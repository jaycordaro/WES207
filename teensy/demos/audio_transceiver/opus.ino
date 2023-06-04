/* This file is an adaptation of the "trivial_example.c"
   functionality from the Opus-Teensy-Codec-lib. It is
   intended to demonstrate how the Opus encode() and
   decode() functions can be used from the Arduino
   development enviroment. */


constexpr int FRAME_SIZE = 960;
constexpr int SAMPLE_RATE = 16000;
constexpr int APPLICATION = OPUS_APPLICATION_AUDIO;
constexpr int BITRATE = 6000;

constexpr int MAX_FRAME_SIZE = 6*960;

int rem = 0;
int itr_count;
OpusEncoder* init_encoder()
{
  itr_count = 0;
  
  /*Create a new encoder state */
  int err;
  OpusEncoder* encoder = opus_encoder_create(SAMPLE_RATE, 1, APPLICATION, &err);
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
  OpusDecoder* decoder = opus_decoder_create(SAMPLE_RATE, 1, &err);
  MY_ASSERT(err >= 0, make_string("failed to create decoder, error %d", err));
  rem = 0;
  
  return decoder;
}

void destroy_decoder(OpusDecoder* decoder)
{
  opus_decoder_destroy(decoder);
}

const char* inFile = "input.bin";

const char* output_file_name()
{
    return make_string("output_%dbps.bin", BITRATE);
}

int encoded_bytes = 0;
int error_count = 0;

OpusEncoder* encoder;
OpusDecoder* decoder;

File fin;
File fout;

void opus_init_tx()
{
  encoded_bytes = 0;

  encoder = init_encoder();
  Serial.println("Encoder intialized...");

  fin = SD.open(inFile, FILE_READ);
  MY_ASSERT(fin != 0, "failed to open input file");
}

void opus_init_rx()
{
  decoder = init_decoder();
  Serial.println("Decoder intialized...");

  Serial.printf("Output file name: %s\n", output_file_name());
  SD.remove(output_file_name());
  fout = SD.open(output_file_name(), FILE_WRITE);
  MY_ASSERT(fout != 0, "failed to open output file");
}

void encode(unsigned char* codebits, int& payloadlen)
{
  unsigned char pcm_bytes[sizeof(short)*MAX_FRAME_SIZE];
  opus_int16 in[FRAME_SIZE];

  /* Read a 16 bits/sample audio frame. */
  size_t read_count = sizeof(short)*FRAME_SIZE;
  size_t amount_read = fin.read(pcm_bytes, read_count);
  if (amount_read != read_count)
  {
    // we'll only do full frames for now
    payloadlen = 0;
    return;
  }

  for (int i = 0; i < FRAME_SIZE; i++)
  {
    in[i] = pcm_bytes[2*i+1]<<8 | pcm_bytes[2*i];
  }

  /* Encode the frame. */
  payloadlen = opus_encode(encoder, in, FRAME_SIZE, codebits, MAX_PACKET_SIZE);
  MY_ASSERT(payloadlen > 0, "encode failed");
}

void decode(unsigned char* codebits, int payloadlen)
{
  opus_int16 out[MAX_FRAME_SIZE];
  unsigned char pcm_bytes[sizeof(short)*MAX_FRAME_SIZE*3];

  int frame_size = opus_decode(decoder, codebits, payloadlen, out, MAX_FRAME_SIZE, 0);
  MY_ASSERT(frame_size > 0, "decoder failed");

  Serial.printf("Frame %d decoded %d bytes \n", itr_count++, frame_size);

  /* Convert to little-endian ordering and upsample to 44.1 kHz. */
  int out_i = 0;
  for(int i = 0; i < frame_size; i++)
  {
    pcm_bytes[out_i++] = out[i] & 0xFF;
    pcm_bytes[out_i++] = (out[i]>>8) & 0xFF;

    // always insert one zero
    pcm_bytes[out_i++] = 0;
    pcm_bytes[out_i++] = 0;

    // dither an additional zero if necessary
    rem += 121;
    if(rem > 160)
    {
      rem -= 160;
      pcm_bytes[out_i++] = 0;
      pcm_bytes[out_i++] = 0;
    }
  }

  /* Write the decoded audio to file. */
  fout.write(pcm_bytes, out_i);
}

void opus_tx_complete()
{
  destroy_encoder(encoder);
  fin.close();
}

void opus_rx_complete()
{
  destroy_decoder(decoder);
  fout.close();
}

void tx_rx_complete()
{
  Serial.println("Operation succeeded...");
  File fout = SD.open(output_file_name(), FILE_READ);
  int out_size = fout.size();
  fout.close();
  File fin = SD.open(inFile, FILE_READ);
  int in_size = fin.size();
  fin.close();

  Serial.printf("input file bytes: %d, output file bytes: %d, encoded bytes: %d, errors: %d\n", in_size, out_size, encoded_bytes, error_count);
}