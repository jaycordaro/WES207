#include <SPI.h>
#include <SD.h>
#include <string>

constexpr int audio_in_pin = 2;
constexpr int audio_out_pin = 3;

constexpr int AUDIO_IN_FIFO_ADDRESS = 1;
constexpr int AUDIO_OUT_FIFO_ADDRESS = 2;

constexpr int OUT_BUFF_SIZE = 512;

#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message, true))
#define MY_ASSERT_NON_FATAL(cond, message) (my_assert((cond), __LINE__, __FILE__, message, false))

File fin;
File fout;

const char output_file_name = "Output.bin";
const char input_file_name = "Input.bin";

void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");
  spi_init();

  MY_ASSERT(SD.begin(BUILTIN_SDCARD), "Cannot init SD card");

  fin = SD.open(input_file_name, FILE_READ);
  MY_ASSERT(fin != 0, "failed to open input file");

  Serial.printf("Output file name: %s\n", output_file_name);
  SD.remove(output_file_name);
  fout = SD.open(output_file_name, FILE_WRITE);
  MY_ASSERT(fout != 0, "failed to open output file");
  

  pinMode(audio_in_pin, INPUT_PULLDOWN);
  attachInterrupt(digitalPinToInterrupt(audio_in_pin), input_isr, RISING);

  pinMode(audio_out_pin, INPUT_PULLDOWN);
  attachInterrupt(digitalPinToInterrupt(audio_out_pin), output_isr, RISING);

  
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


void loop() {
  Serial.println("enter command:");
  String cmd = getCommand();
  if(cmd == "tx")
  {
    writeAudio(OUT_BUFF_SIZE);
  }
}

bool audio_in_asserted()
{
  return (digitalRead(audio_in_pin) == HIGH);
}

bool audio_out_asserted()
{
  return (digitalRead(audio_out_pin) == HIGH);
}

void input_isr()
{
  int32_t data_buff[128];
  int i = 0;

  while(audio_in_asserted())
  {
    // read 32 bits
    data_buff[i] = spiReadFpga(AUDIO_IN_FIFO_ADDRESS);
    i++;

    // write to the SD card
    if(i == 128)
    {
      fout.write((uint8_t *) &data_buff[0], sizeof(int32_t)*i);
      i = 0;
    }
  }

  if(i > 0)
  {
    fout.write((uint8_t *) &data_buff[0], sizeof(int32_t)*i);
    fout.flush();
  }
}

void writeAudio(int count)
{
  int32_t pcm_bytes[OUT_BUFF_SIZE/sizeof(int32_t)];
  int bytes_written = 0;
  size_t amount_read = fin.read((void *) pcm_bytes, count);
  while (int i = 0; i < amount_read / 4; i++)
  {
    spiWriteFpga(AUDIO_OUT_FIFO_ADDRESS, pcm_bytes[i]);
  }
  MY_ASSERT(count != amount_read || !audio_out_asserted(), "Unable to fill output FIFO fast enough!");
}

void output_isr()
{
  writeAudio(OUT_BUFF_SIZE / 2);
}