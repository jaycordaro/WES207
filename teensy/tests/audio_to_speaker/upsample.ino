
File fin;
File fout;

bool readWord(int32_t& word)
{
  int read_length = fin.read((uint8_t *) &word, sizeof(int32_t));
  return read_length == sizeof(int32_t);
}

void export_if_full(int16_t* data_buff, int& i, int size)
{
  if(i == size)
  {
    fout.write((uint8_t *) data_buff, sizeof(int16_t)*i);
    i = 0;
  }
}

void convert()
{
  fin = SD.open("Input.bin", FILE_READ);
  MY_ASSERT(fin != 0, "failed to open input file");

  Serial.printf("Output file name: %s\n", "Output.bin");
  SD.remove("Output.bin");
  fout = SD.open("Output.bin", FILE_WRITE);
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
    fout.write((uint8_t *) &data_buff[0], sizeof(int16_t)*i);
  }

  fin.close();
  fout.close();
}