constexpr uint32_t SPICLOCKRATE = 4000000;

constexpr uint16_t readRF = 0x0000;
constexpr uint16_t writeRF = 0x8000;

constexpr uint8_t writeFpga = 0x00;
constexpr uint8_t readFpga = 0x80;

const int chipSelectPinRF = 10;
const int chipSelectPinFpga = 37;

void spi_init() {
  pinMode(chipSelectPinRF, OUTPUT);
  digitalWrite(chipSelectPinRF, HIGH);

  pinMode(chipSelectPinFpga, OUTPUT);
  digitalWrite(chipSelectPinFpga, HIGH);
  SPI.begin();
}

void spiWriteRF(uint16_t address, uint8_t value) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPinRF, LOW);

  SPI.transfer16(writeRF | address);

  SPI.transfer(value);

  digitalWrite(chipSelectPinRF, HIGH);
  SPI.endTransaction();
}

uint8_t spiReadRF(uint16_t address) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPinRF, LOW);

  SPI.transfer16(readRF | address);

  uint8_t res = SPI.transfer(0);

  digitalWrite(chipSelectPinRF, HIGH);
  SPI.endTransaction();

  return res;
}

void spiWriteFpga(uint8_t address, uint8_t value) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPinFpga, LOW);

  SPI.transfer(writeFpga | address);

  SPI.transfer(value);

  digitalWrite(chipSelectPinFpga, HIGH);
  SPI.endTransaction();
}

uint8_t spiReadFpga(uint8_t address) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPinFpga, LOW);

  SPI.transfer(readFpga | address);

  uint8_t res = SPI.transfer(0);

  digitalWrite(chipSelectPinFpga, HIGH);
  SPI.endTransaction();

  return res;
}