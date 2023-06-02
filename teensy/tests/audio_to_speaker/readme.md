# Audio to Speaker
Play an audio file to the speaker.

## Usage:
Load a Input.bin 16-bit PCM audio file onto an SD card and insert it into the Teensy.  
  
Then run the "convert" command to upsample the input audio to 44.1 kHz. Then run the "play" command to play it out of the speaker.  

Connect the I2S speaker to the Teensy using the following pins:  
21 (BCLK1)	Audio	Audio Bit Clock, 1.41 MHz  
20 (LRCLK1) Audio	Audio Left/Right Clock, 44.1 kHz  
7 (OUT1A)	Audio Output  
Also connect the 5V power to the speaker board  
