#include <Audio.h>
#include <Wire.h>
#include <SD.h>
#include <SerialFlash.h>

// GUItool: begin automatically generated code
AudioPlaySdRaw           playSdRaw1;     //xy=69.5,269.33330631256104
AudioFilterFIR           fir1;           //xy=210.33334732055664,258.33330631256104
AudioOutputI2S           i2s1;           //xy=333.3333282470703,289.3333282470703
AudioConnection          patchCord1(playSdRaw1, fir1);
AudioConnection          patchCord2(fir1, 0, i2s1, 0);
AudioConnection          patchCord3(fir1, 0, i2s1, 1);
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

const short filter[] = { 8, 17, 31, 49, 69, 87, 97, 92, 65, 11, -74,
  -189, -325, -469, -601, -696, -727, -669, -502, -216, 190, 698,
  1282, 1901, 2506, 3045, 3471, 3744, 3838, 3744, 3471,3045, 2506,
  1901, 1282, 698, 190, -216, -502, -669, -727, -696, -601, -469,
  -325, -189, -74, 11, 65, 92, 97, 87, 69, 49, 31, 17, 8, 0
  };

void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");
  AudioMemory(8);
  if (!(SD.begin(BUILTIN_SDCARD))) {
    while (1) {
      Serial.println("Unable to access the SD card");
      delay(500);
    }
  }

  fir1.begin(filter, 58);
  //fir2.begin(filter, 58);
}

void loop() {
  Serial.println("enter command:");
  String cmd = getCommand();

  if(cmd == "play")
  {
    Serial.println("playing...");
    if(!playSdRaw1.isPlaying())
    {
      if (!playSdRaw1.play("Output.bin")) {
        while (1) {
          Serial.println("Unable to play audio!");
          delay(500);
        }
      }

      while (playSdRaw1.isPlaying()) {
        // wait for file to complete playing
        delay(10);
      }
    }
  }
  else if (cmd == "gen")
  {
    convert();
  }
}