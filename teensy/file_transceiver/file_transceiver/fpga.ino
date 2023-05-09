#if (USE_SPI == 1)
void fpga_status(bool& tx_ready, bool& rx_ready)
{
  STATUS_REG status;
  status.value = spiReadFpga(STATUS_REG::address);
  tx_ready = status.TXRDY;
  rx_ready = status.RXRDY;
}


int fpga_transmit(unsigned char* cbits, int payload_len)
{
  TxPacket packet(cbits, payload_len);
  // write packet length
  spiWriteFpga(TX_PACKET_LEN_REG::address, packet.get_length());

  for (auto itr = packet.begin(); itr != packet.end(); itr++)
  {
    spiWriteFpga(TX_PACKET_REG::address, *itr);
  }

  return packet.get_length();
}


uint8_t fpga_receive(unsigned char* rx_buff)
{
  // read packet length
  uint8_t length = spiReadFpga(RX_PACKET_LEN_REG::address);

  for (int i = 0; i < length; i++)
  {
    rx_buff[i] = spiReadFpga(RX_PACKET_REG::address);
  }

  return length;
}

#else

void fpga_status(bool& tx_ready, bool& rx_ready)
{
  tx_ready = true;
  rx_ready = true;
}


unsigned char bypass_buff[MAX_RX_PACKET_SIZE];
int bypass_len;
int fpga_transmit(unsigned char* cbits, int payload_len)
{
  TxPacket packet(cbits, payload_len);
  // write packet length
  bypass_len = packet.get_length();

  int bypass_idx = 0;
  for (auto itr = packet.begin(); itr != packet.end(); itr++)
  {
    bypass_buff[bypass_idx++] = *itr;
  }

  return packet.get_length();
}

uint8_t fpga_receive(unsigned char* rx_buff)
{
  for (int i = 0; i < bypass_len; i++)
  {
    rx_buff[i] = bypass_buff[i];
  }

  return bypass_len;
}

#endif