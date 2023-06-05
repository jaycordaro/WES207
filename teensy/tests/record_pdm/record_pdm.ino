#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

// GUItool: begin automatically generated code
AudioInputPDM2           pdm2_1;         //xy=337.27272033691406,433.2727279663086
AudioRecordQueue         queue1;         //xy=527.2727203369141,418.2727279663086
AudioConnection          patchCord1(pdm2_1, queue1);
// GUItool: end automatically generated code

#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message, true))
#define MY_ASSERT_NON_FATAL(cond, message) (my_assert((cond), __LINE__, __FILE__, message, false))

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

File fout;

const char outfile[] = "testout.bin";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Starting program...");
  AudioMemory(200);
  if (!(SD.begin(BUILTIN_SDCARD))) {
    while (1) {
      Serial.println("Unable to access the SD card");
      delay(500);
    }
  }

  while(true)
  {
    String cmd = getCommand();

    if(cmd == "rec")
    {
      SD.remove(outfile);
      fout = SD.open(outfile, FILE_WRITE);
      queue1.clear();
      queue1.begin();
      break;
    }
  }
  
}

int total = 0;
const int complete_count = 600;
int16_t outbuff[128];
int skip_idx = 0;
void loop() {
  
  while(queue1.available() > 0)
  {
    int16_t* packet = queue1.readBuffer();
    
    queue1.freeBuffer();
    int out_idx = 0;
    for(int i = 0; i < 128; i++)
    {
      if(skip_idx == 0)
      {
        outbuff[out_idx++] = packet[i];
      }
      skip_idx = (skip_idx + 1) % 3;
    }
    fout.write(packet, out_idx*sizeof(int16_t));

    total++;
    if(total >= complete_count)
    {
      queue1.end();
      fout.close();

      Serial.printf("write complete\n");
    }
  }
}
