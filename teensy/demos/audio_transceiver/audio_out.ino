// GUItool: begin automatically generated code
AudioPlaySdRaw           playSdRaw1;     //xy=69.5,269.33330631256104
AudioFilterFIR           fir1;           //xy=210.33334732055664,258.33330631256104
AudioOutputI2S           i2s1;           //xy=333.3333282470703,289.3333282470703
AudioConnection          patchCord1(playSdRaw1, fir1);
AudioConnection          patchCord2(fir1, 0, i2s1, 0);
AudioConnection          patchCord3(fir1, 0, i2s1, 1);
// GUItool: end automatically generated code

const short filter[] = { 8, 17, 31, 49, 69, 87, 97, 92, 65, 11, -74,
  -189, -325, -469, -601, -696, -727, -669, -502, -216, 190, 698,
  1282, 1901, 2506, 3045, 3471, 3744, 3838, 3744, 3471,3045, 2506,
  1901, 1282, 698, 190, -216, -502, -669, -727, -696, -601, -469,
  -325, -189, -74, 11, 65, 92, 97, 87, 69, 49, 31, 17, 8, 0
  };

void audio_out_init()
{
  AudioMemory(200);
  fir1.begin(filter, 58);
}

void audio_out_play()
{
  Serial.println("playing...");
  if(!playSdRaw1.isPlaying())
  {
    MY_ASSERT(playSdRaw1.play(output_file_name()), "Unable to play audio!");
  }
}