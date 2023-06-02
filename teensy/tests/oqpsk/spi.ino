void spiWrite(uint16_t address, uint8_t value) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  SPI.transfer16(write | address);
  //MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  SPI.transfer(value);
  //MY_ASSERT(res == 0, make_string("Received %d on writing data!", res));

  digitalWrite(chipSelectPin, HIGH);
  SPI.endTransaction();
}

uint8_t spiRead(uint16_t address) {
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  digitalWrite(chipSelectPin, LOW);

  uint8_t res = SPI.transfer16(read | address);
  //MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  res = SPI.transfer(0);

  digitalWrite(chipSelectPin, HIGH);
  SPI.endTransaction();

  return res;
}
