#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

AudioInputI2S            i2s1;
AudioRecordQueue         queue1;
AudioRecordQueue         queue2;
AudioConnection          patchCord1(i2s1, 0, queue1, 0);
AudioConnection          patchCord2(i2s1, 1, queue2, 0);

void setup() {
  AudioMemory(50);
}

void loop() {
}

