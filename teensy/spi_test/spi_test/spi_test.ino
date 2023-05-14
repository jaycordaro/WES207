// include the SPI library:
#include <SPI.h>
#include <string>

constexpr uint32_t SPICLOCKRATE = 1000000;

const int chipSelectPin = 0;

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
  else
  {
    Serial.println("invalid command");
  }
}

constexpr uint8_t write = 0x00;
constexpr uint8_t read = 0x80;

void spiWrite(uint16_t address, uint8_t value) {
  SPI1.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI1.transfer(write | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI1.transfer(value);
  MY_ASSERT(res == 0, make_string("Received %d on writing data!", res));

  digitalWrite(chipSelectPin, HIGH);
  SPI1.endTransaction();
}

uint8_t spiRead(uint16_t address) {
  SPI1.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI1.transfer(read | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI1.transfer(0);

  digitalWrite(chipSelectPin, HIGH);
  SPI1.endTransaction();

  return res;
}
