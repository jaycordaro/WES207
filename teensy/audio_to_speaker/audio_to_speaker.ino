#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

AudioPlaySdRaw           play_sd;
AudioFilterFIR           rate_change_fir;
AudioOutputI2S           i2s_out;
AudioConnection          patchCord1(play_sd, rate_change_fir);
AudioConnection          patchCord2(rate_change_fir, 0, i2s_out, 0);
AudioConnection          patchCord3(rate_change_fir, 0, i2s_out, 1);

#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message, true))
#define MY_ASSERT_NON_FATAL(cond, message) (my_assert((cond), __LINE__, __FILE__, message, false))

File fin;
File fout;

const char* input_file_name = "Input.bin";
const char* upsampled_file_name = "Upsample.bin";

void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");
  MY_ASSERT(SD.begin(BUILTIN_SDCARD), "Cannot init SD card");
}


String getCommand()
{
  String command = "";
  while(command == "")
  {
    command = Serial.readString(1024);
    delay(1);
  }
  return command.trim();
}

int getValue()
{
  String cmd = getCommand();
  return cmd.toInt();
}

void my_assert(bool cond, int line, const char* file, const char* message, bool fatal)
{
  if(!cond)
  {
    if(fatal)
    {
      while(true)
      {
        Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
        delay(10000);
      }
    }
    else
    {
      Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
    }
  }
}

const short filter[] = { 8, 17, 31, 49, 69, 87, 97, 92, 65, 11, -74,
  -189, -325, -469, -601, -696, -727, -669, -502, -216, 190, 698,
  1282, 1901, 2506, 3045, 3471, 3744, 3838, 3744, 3471,3045, 2506,
  1901, 1282, 698, 190, -216, -502, -669, -727, -696, -601, -469,
  -325, -189, -74, 11, 65, 92, 97, 87, 69, 49, 31, 17, 8, 0
  };

bool readWord(int32_t& word)
{
  int read_length = fin.read((uint8_t *) &word, sizeof(int32_t));
  return read_length == sizeof(int32_t);
}

void export_if_full(int16_t* data_buff, int& i, int size)
{
  if(i == size)
  {
    fout.write((uint8_t *) data_buff, sizeof(int32_t)*i);
    i = 0;
  }
}

void loop() {
  Serial.println("enter command:");
  String cmd = getCommand();
  if(cmd == "convert")
  {
    fin = SD.open(input_file_name, FILE_READ);
    MY_ASSERT(fin != 0, "failed to open input file");

    Serial.printf("Output file name: %s\n", upsampled_file_name);
    SD.remove(upsampled_file_name);
    fout = SD.open(upsampled_file_name, FILE_WRITE);
    MY_ASSERT(fout != 0, "failed to open output file");

    int rem = 0;
    int16_t data_buff[128];
    int32_t in_data;
    int i = 0;
    while(readWord(in_data))
    {
      for(int sample_i = 0; sample_i < 2; sample_i++)
      {
        int16_t sample = in_data & 0xFFFF;
        data_buff[i++] = sample;
        export_if_full(data_buff, i, 128);
        data_buff[i++] = 0;
        export_if_full(data_buff, i, 128);
        rem += 121;
        if(rem > 160)
        {
          rem -= 160;
          data_buff[i++] = 0;
          export_if_full(&data_buff[0], i, 128);
        }
        in_data = in_data >> 16;
      }
    }

    if(i != 0)
    {
      fout.write((uint8_t *) &data_buff[0], sizeof(int32_t)*i);
    }

    fin.close();
    fout.close();
  }
  else if(cmd == "play")
  {
    rate_change_fir.begin(filter, 58);
    play_sd.play(upsampled_file_name);
  }
}
