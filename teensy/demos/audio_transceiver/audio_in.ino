// GUItool: begin automatically generated code
AudioInputPDM2           pdm2_1;         //xy=337.27272033691406,433.2727279663086
AudioRecordQueue         queue1;         //xy=527.2727203369141,418.2727279663086
AudioConnection          patchCord5(pdm2_1, queue1);
// GUItool: end automatically generated code

const char recname[] = "recorded.bin";
int total = 0;
const int complete_count = 600;
int16_t outbuff[128];
int skip_idx = 0;

void record()
{
  SD.remove(recname);
  File fout = SD.open(recname, FILE_WRITE);
  queue1.clear();
  queue1.begin();

  total = 0;
  skip_idx = 0;

  while(true)
  {
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
      fout.write(outbuff, out_idx*sizeof(int16_t));

      total++;
      if(total >= complete_count)
      {
        queue1.end();
        fout.close();

        Serial.printf("recording complete\n");
        break;
      }
    }
  }
}