/* This sketch is an adaptation of the "trivial_example.c"
   functionality from the Opus-Teensy-Codec-lib. It is
   intended to demonstrate how the Opus encode() and
   decode() functions can be used from the Arduino
   development enviroment. */

#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>

#include <utility/imxrt_hw.h> 
#include <play_sd_opus.h>

#define FRAME_SIZE 960
#define SAMPLE_RATE 16000
#define CHANNELS 1
#define APPLICATION OPUS_APPLICATION_AUDIO
#define BITRATE 6000

#define MAX_FRAME_SIZE 6*960
#define MAX_PACKET_SIZE (3*1276)

constexpr float BER = 0;

#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message))
void my_assert(bool cond, int line, const char* file, const char* message)
{
  if(!cond)
  {
    while(true)
    {
      Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
      delay(10000);
    }
  }
}

char temp_make_string_buffer[1024];
const char* make_string(const char* format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    vsnprintf(temp_make_string_buffer, sizeof(temp_make_string_buffer), format, arguments);
    va_end(arguments);
    return temp_make_string_buffer;
}

OpusEncoder* init_encoder()
{
  /*Create a new encoder state */
  int err;
  OpusEncoder* encoder = opus_encoder_create(SAMPLE_RATE, CHANNELS, APPLICATION, &err);
  MY_ASSERT(err >= 0, make_string("failed to create an encoder, error code %d", err));

  /* Set the desired bit-rate. You can also set other parameters if needed.
      The Opus library is designed to have good defaults, so only set
      parameters you know you need. Doing otherwise is likely to result
      in worse quality, but better. */
  err = opus_encoder_ctl(encoder, OPUS_SET_BITRATE(BITRATE));
  MY_ASSERT(err >= 0, make_string("failed to set bitrate, error code %d", err));

  return encoder;
}

void destroy_encoder(OpusEncoder* encoder)
{
  opus_encoder_destroy(encoder);
}

OpusDecoder* init_decoder()
{
  /* Create a new decoder state. */
  int err;
  OpusDecoder* decoder = opus_decoder_create(SAMPLE_RATE, CHANNELS, &err);
  MY_ASSERT(err >= 0, make_string("failed to create decoder, error %d", err));
  
  return decoder;
}

void destroy_decoder(OpusDecoder* decoder)
{
  opus_decoder_destroy(decoder);
}

const char* inFile = "input.bin";

const char* output_file_name()
{
  if(BER != 0)
  {
    // approximate the BER in scientific notation...
    int BER_scale = 0;
    float BER_mag = BER;
    while(BER_mag+0.1 < 1)
    {
      BER_mag *= 10;
      BER_scale--;
    }

    return make_string("output_%dbps_BER%de%d.bin", BITRATE, static_cast<int>(round(BER_mag)), BER_scale);
  }
  else
  {
    return make_string("output_%dbps.bin", BITRATE);
  }
}

int encoded_bytes = 0;
int error_count = 0;

void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");

  // BER can't be set to 1, there'd be no point in testing this...
  MY_ASSERT(BER != 1, "BER cannot be set to 1");

  OpusEncoder* encoder = init_encoder();
  Serial.println("Encoder intialized...");

  OpusDecoder* decoder = init_decoder();
  Serial.println("Decoder intialized...");
  
  MY_ASSERT(SD.begin(BUILTIN_SDCARD), "Cannot init SD card");
  
  File fin = SD.open(inFile, FILE_READ);
  MY_ASSERT(fin != 0, "failed to open input file");

  Serial.printf("Output file name: %s\n", output_file_name());
  SD.remove(output_file_name());
  File fout = SD.open(output_file_name(), FILE_WRITE);
  MY_ASSERT(fout != 0, "failed to open output file");

  Serial.println("Files opened...");

  int itr_count = 0;
  while (1)
  {
    int i;
    unsigned char pcm_bytes[MAX_FRAME_SIZE*CHANNELS*2];
    int frame_size;
    opus_int16 in[FRAME_SIZE*CHANNELS];
    opus_int16 out[MAX_FRAME_SIZE*CHANNELS];
    unsigned char cbits[MAX_PACKET_SIZE];

    /* Read a 16 bits/sample audio frame. */
    size_t read_count = sizeof(short)*CHANNELS*FRAME_SIZE;
    size_t amount_read = fin.read(pcm_bytes, read_count);
    if (amount_read != read_count)
    {
      // we'll only do full frames for now
      break;
    }

    /* Convert from little-endian ordering. */
    for (i=0;i<CHANNELS*FRAME_SIZE;i++)
    {
      in[i]=pcm_bytes[2*i+1]<<8 | pcm_bytes[2*i];
    }

    /* Encode the frame. */
    int nbBytes = opus_encode(encoder, in, FRAME_SIZE, cbits, MAX_PACKET_SIZE);
    MY_ASSERT(nbBytes > 0, "encode failed");

    encoded_bytes += nbBytes;

    if(BER != 0)
    {
      for(int byte = 0; byte < nbBytes; byte++)
      {
        char error_pattern = 0;
        for(int bit = 0; bit < 8; bit++)
        {
          if(random(1/BER) == 1)
          {
            error_pattern = error_pattern | 1;
            error_count++;
          }
          error_pattern = error_pattern << 1;
        }

        cbits[byte] ^= error_pattern;
      }
    }

    /* Decode the data. In this example, frame_size will be constant because
        the encoder is using a constant frame size. However, that may not
        be the case for all encoders, so the decoder must always check
        the frame size returned. */
    frame_size = opus_decode(decoder, cbits, nbBytes, out, MAX_FRAME_SIZE, 0);
    MY_ASSERT(frame_size > 0, "decoder failed");

    Serial.printf("Frame %d decoded %d bytes \n", itr_count++, frame_size);

    /* Convert to little-endian ordering. */
    for(i=0;i<CHANNELS*frame_size;i++)
    {
      pcm_bytes[2*i]=out[i]&0xFF;
      pcm_bytes[2*i+1]=(out[i]>>8)&0xFF;
    }

    /* Write the decoded audio to file. */
    fout.write(pcm_bytes, sizeof(short)*frame_size*CHANNELS);
  }

  /*Destroy the encoder state*/
  destroy_encoder(encoder);
  destroy_decoder(decoder);

  fin.close();
  fout.close();
}

void loop() {
  Serial.println("Operation succeeded...");
  File fout = SD.open(output_file_name(), FILE_READ);
  int out_size = fout.size();
  fout.close();
  File fin = SD.open(inFile, FILE_READ);
  int in_size = fin.size();
  fin.close();

  Serial.printf("input file bytes: %d, output file bytes: %d, encoded bytes: %d, added errors: %d\n", in_size, out_size, encoded_bytes, error_count);
  delay(100000);
}

