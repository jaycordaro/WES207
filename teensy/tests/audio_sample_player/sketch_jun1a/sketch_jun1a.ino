#include <Audio.h>
#include <Wire.h>

#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>
#include <Bounce.h>

// WAV files converted to code by wav2sketch
#include "AudioSampleSnare.h"        // http://www.freesound.org/people/KEVOY/sounds/82583/
#include "AudioSampleTomtom.h"       // http://www.freesound.org/people/zgump/sounds/86334/
#include "AudioSampleHihat.h"        // http://www.freesound.org/people/mhc/sounds/102790/
#include "AudioSampleKick.h"         // http://www.freesound.org/people/DWSD/sounds/171104/
#include "AudioSampleGong.h"         // http://www.freesound.org/people/juskiddink/sounds/86773/
#include "AudioSampleCashregister.h" // http://www.freesound.org/people/kiddpark/sounds/201159/

// Create the Audio components.  These should be created in the
// order data flows, inputs/sources -> processing -> outputs
//
AudioPlayMemory    sound0;
AudioPlayMemory    sound1;  // six memory players, so we can play
AudioPlayMemory    sound2;  // all six sounds simultaneously
AudioPlayMemory    sound3;
AudioPlayMemory    sound4;
AudioPlayMemory    sound5;
AudioMixer4        mix1;    // two 4-channel mixers are needed in
AudioMixer4        mix2;    // tandem to combine 6 audio sources
AudioOutputI2S     headphones;
AudioOutputAnalog  dac;     // play to both I2S audio board and on-chip DAC

// Create Audio connections between the components
//
AudioConnection c1(sound0, 0, mix1, 0);
AudioConnection c2(sound1, 0, mix1, 1);
AudioConnection c3(sound2, 0, mix1, 2);
AudioConnection c4(sound3, 0, mix1, 3);
AudioConnection c5(mix1, 0, mix2, 0);   // output of mix1 into 1st input on mix2
AudioConnection c6(sound4, 0, mix2, 1);
AudioConnection c7(sound5, 0, mix2, 2);
AudioConnection c8(mix2, 0, headphones, 0);
AudioConnection c9(mix2, 0, headphones, 1);
AudioConnection c10(mix2, 0, dac, 0);

// Create an object to control the audio shield.
// 
AudioControlSGTL5000 audioShield;





// Create the Audio components for the system
AudioSynthWaveformSine sine1;    //xy=92,155
AudioOutputI2S i2s1;             //xy=317,155
AudioConnection patchCord1(sine1, 0, i2s1, 0);
AudioConnection patchCord2(sine1, 0, i2s1, 1);

void setup() {
  AudioMemory(12);  // Allocate memory for the audio system
  
  sine1.frequency(210);  // Set the sine wave frequency (440Hz is middle A)
  sine1.amplitude(0.1);  // Set the sine wave amplitude (0.5 is roughly half of max output)
}

void loop() {
  int SPEAKER_PIN = 7;
  tone(SPEAKER_PIN, 440, 500); // play a 440 Hz (A4) tone for 500 ms
  delay(1000); // wait for a second
  tone(SPEAKER_PIN, 880, 500); // play a 880 Hz (A5) tone for 500 ms
  delay(1000); // wait for a second

}
