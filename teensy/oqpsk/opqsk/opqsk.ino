#include <SPI.h>
#include <string>
#include "rf_registers.h"

constexpr uint32_t SPICLOCKRATE = 4000000;
const int chipSelectPin = 10;
constexpr uint16_t read = 0x0000;
constexpr uint16_t write = 0x8000;

void setup()
{
  Serial.begin(9600);
  Serial.println("Starting program...");

  pinMode(chipSelectPin, OUTPUT);
  digitalWrite(chipSelectPin, HIGH);
  SPI.begin();

  rf_init();

  write_tx_length(30);
  Serial.printf("length: %d\n", read_tx_length());
}

void loop()
{
  Serial.println("enter command:");
  String cmd = getCommand();
  Serial.println(cmd);
  if(cmd == "read")
  {
    Serial.println("read address:");
    int address = getValue();
    Serial.printf("Address set to %d\n", address);
    int result = spiRead(address);
    Serial.printf("Value read is %d\n", result);
  }
  else if (cmd == "write")
  {
    Serial.println("write address:");
    int address = getValue();
    Serial.printf("Address set to %d\n", address);
    Serial.println("write value:");
    int value = getValue();
    Serial.printf("Value set to %d\n", value);
    spiWrite(address, value);
  }
  else if (cmd == "load")
  {
    Serial.println("tx length:");
    int length = getValue();
    load_tx(length);
  }
  else if (cmd == "tx")
  {
    tx();
  }
  else if (cmd == "off")
  {
    trx_off();
  }
  else if (cmd == "rx")
  {
    rx();
  }
  else if (cmd == "read_rx")
  {
    read_rx();
  }
  else if (cmd == "state")
  {
    read_state();
  }
  else if (cmd == "length")
  {
    Serial.printf("length: %d\n", read_tx_length());
  }
  else
  {
    Serial.println("invalid command");
  }
}
