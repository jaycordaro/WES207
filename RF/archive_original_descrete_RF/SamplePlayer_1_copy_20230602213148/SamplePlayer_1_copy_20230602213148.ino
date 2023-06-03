#include <Audio.h>
#include <Wire.h>
#include <SD.h>
#include <SerialFlash.h>


// Create the Audio components.  These should be created in the
// order data flows, inputs/sources -> processing -> outputs
//
AudioPlayMemory    sound0;

// Create Audio connections between the components
//
#include "AudioSampleSnare.h"        // http://www.freesound.org/people/KEVOY/sounds/82583/
#include "AudioSampleCashregister.h" 
#include "AudioSampleGong.h"

// Create the Audio components for the system
AudioSynthWaveformSine sine1;    //xy=92,155
AudioOutputI2S i2s1;             //xy=317,155
AudioConnection patchCord1(sound0, 0, i2s1, 0);
AudioConnection patchCord2(sound0, 0, i2s1, 1);

int soundindex = 0;

void setup() {

  AudioMemory(20);
  //sound0.play(AudioSampleCashregister);
  //sound0.play(AudioSampleSnare);
  //sound0.play(AudioSampleGong);

}

void loop() {
  if(!sound0.isPlaying())
  {
  soundindex++;
    if(soundindex > 2 )
    {
      soundindex = 0;
    } 
    if(soundindex == 0)
    {
      sound0.play(AudioSampleCashregister);
    }
  if(soundindex == 1)
    {
      sound0.play(AudioSampleSnare);
    }
  if(soundindex == 2)
    {
      sound0.play(AudioSampleGong);
    }

  }

}
