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
    }
  }
  
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.printf("packets: %d\n", queue1.available());
  
  if(queue1.available() >= 200)
  {
    queue1.end();
    while(queue1.available() > 0)
    {
      int16_t* packet = queue1.readBuffer();
      fout.write(packet, 128*sizeof(int16_t));
      queue1.freeBuffer();
    }
	  fout.close();

    Serial.printf("write complete\n");

    while(true)
    {
      String cmd = getCommand();

      if(cmd == "rec")
      {
        SD.remove(outfile);
        fout = SD.open(outfile, FILE_WRITE);
        queue1.clear();
        queue1.begin();
      }
    }
  }
  delay(1000);
}
