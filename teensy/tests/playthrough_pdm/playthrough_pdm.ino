#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

// GUItool: begin automatically generated code
AudioInputPDM2           pdm2_1;         //xy=336.2726993560791,433.27272605895996
AudioOutputI2S           i2s1;           //xy=590.2727203369141,314.2727279663086
AudioConnection          patchCord1(pdm2_1, 0, i2s1, 0);
AudioConnection          patchCord2(pdm2_1, 0, i2s1, 1);
// GUItool: end automatically generated code


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Starting program...");
  AudioMemory(80);
}

void loop() {
  // put your main code here, to run repeatedly:

}
