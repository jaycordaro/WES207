// include the SPI library:
#include <SPI.h>
#include <string>
#include "rf_registers.h"

constexpr uint32_t SPICLOCKRATE = 4000000;
constexpr uint32_t SPICLOCKRATE_FPGA = 1000000;

const int chipSelectPin = 10;
const int chipSelectPin_FPGA = 0;

#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message))
void my_assert(bool cond, int line, const char* file, const char* message)
{
  if(!cond)
  {
    //while(true)
    //{
      Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
      //delay(10000);
    //}
  }
}

char temp_make_string_buffer[1024];
const char* make_string(const char* format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    vsnprintf(temp_make_string_buffer, sizeof(temp_make_string_buffer), format, arguments);
    va_end(arguments);
    return temp_make_string_buffer;
}


void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");

  pinMode(chipSelectPin, OUTPUT);
  digitalWrite(chipSelectPin, HIGH);
  SPI.begin();
  SPI1.begin();

  RF_RST reset_cmd;
  reset_cmd.CMD = CHIP_RESET;

  spiWrite(reset_cmd.address, reset_cmd.value);
  
  // Set CLK output of Atmel chip to 32MHz (connect to FPGA J3)
  spiWrite(RF_CLKO::address, 0x0A);

  spiWrite(RF09_CS::address, 0x50);

  spiWrite(RF09_CCF0H::address, 0x8C);

  spiWrite(RF09_CCF0L::address, 0xF0);

  spiWrite(RF09_CNL::address, 0x1); 

  spiWrite(RF09_CNM::address, 0x0);

  RF_IQIFC0 c0;
  c0.EXTLB = 0;
  c0.SF = 0;
  c0.DRV = 1;
  c0.CMV1V2 = 1;
  c0.CMV = 1;
  c0.ECC = 0;

  spiWrite(c0.address, c0.value);

  RF_IQIFC1 c1;
  c1.CHPM = 1;
  c1.SKEWDRV = 2;
  
  spiWrite(c1.address, c1.value);

  RF09_TXDACI daci;
  daci.ENTXDACID = 1;
  daci.TXDACID = 1;

  spiWrite(RF09_TXDACI::address, daci.value);

  RF09_CMD cmd;
  cmd.CMD = 0x3;

  spiWrite(cmd.address, cmd.value);

  delay(1);

  cmd.CMD = 0x4;

  spiWrite(cmd.address, cmd.value);
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
  if(cmd == "aread")
  {
    Serial.println("Atmel read address:");
    int address = getValue();
    Serial.printf("Address set to %d\n", address);
    int result = spiRead(address);
    Serial.printf("Value read is %d\n", result);
  }
  else if (cmd == "awrite")
  {
    Serial.println("Atmel write address:");
    int address = getValue();
    Serial.printf("Address set to %d\n", address);
    Serial.println("write value:");
    int value = getValue();
    Serial.printf("Value set to %d\n", value);
    spiWrite(address, value);
  } 
  else if(cmd == "fread")
  {
    Serial.println("FPGA read address:");
    int faddress = getValue();
    Serial.printf("Address set to %d\n", faddress);
    int fresult = spiRead_FPGA(faddress);
    Serial.printf("Value read is %d\n", fresult);
  }
  else if (cmd == "fwrite")
  {
    Serial.println("FPGA write address:");
    int faddress = getValue();
    Serial.printf("Address set to %d\n", faddress);
    Serial.println("write value:");
    int fvalue = getValue();
    Serial.printf("Value set to %d\n", fvalue);
    spiWrite_FPGA(faddress, fvalue);
  }
  else
  {
    Serial.println("invalid command");
  }
}

constexpr uint16_t read = 0x0000;
constexpr uint16_t write = 0x8000;

void spiWrite(uint16_t address, uint8_t value) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI.transfer16(write | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI.transfer(value);
  MY_ASSERT(res == 0, make_string("Received %d on writing data!", res));

  digitalWrite(chipSelectPin, HIGH);
  SPI.endTransaction();
}

uint8_t spiRead(uint16_t address) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI.transfer16(read | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI.transfer(0);

  digitalWrite(chipSelectPin, HIGH);
  SPI.endTransaction();

  return res;
}

constexpr uint8_t write_FPGA = 0x00;
constexpr uint8_t read_FPGA = 0x80;

void spiWrite_FPGA(uint16_t address, uint8_t value) {
  SPI1.beginTransaction(SPISettings(SPICLOCKRATE_FPGA, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin_FPGA, LOW);

  uint8_t res = SPI1.transfer(write | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI1.transfer(value);
  MY_ASSERT(res == 0, make_string("Received %d on writing data!", res));

  digitalWrite(chipSelectPin_FPGA, HIGH);
  SPI1.endTransaction();
}

uint8_t spiRead_FPGA(uint16_t address) {
  SPI1.beginTransaction(SPISettings(SPICLOCKRATE_FPGA, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin_FPGA, LOW);

  uint8_t res = SPI1.transfer(read | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI1.transfer(0);

  digitalWrite(chipSelectPin_FPGA, HIGH);
  SPI1.endTransaction();

  return res;
}
