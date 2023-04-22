// include the SPI library:
#include <SPI.h>

constexpr uint32_t SPICLOCKRATE = 4000000;

const int chipSelectPin = 10;

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
}

void loop() {
  spiWrite(1, 0x10);
  delay(5000);
  int result = spiRead(1);
  Serial.printf("Read %#02x\n", result);
  delay(5000);
}

constexpr uint8_t write = 0x00;
constexpr uint8_t read = 0x80;

void spiWrite(uint8_t address, uint8_t value) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI.transfer(write | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI.transfer(value);
  MY_ASSERT(res == 0, make_string("Received %d on writing data!", res));

  digitalWrite(chipSelectPin, HIGH);
  SPI.endTransaction();
}

uint8_t spiRead(uint8_t address) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI.transfer(read | address);
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI.transfer(0);

  digitalWrite(chipSelectPin, HIGH);
  SPI.endTransaction();

  return res;
}
