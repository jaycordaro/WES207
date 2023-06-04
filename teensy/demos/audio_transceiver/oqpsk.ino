elapsedMillis txTime;
bool tx_timer_set = false;

bool oqpsk_tx_rdy = false;
bool oqpsk_rx_rdy = false;

bool rx_set = false;

void oqpsk_init(int16_t channel_number)
{
  // reset
  RF_RST reset_cmd;
  reset_cmd.CMD = CHIP_RESET;
  spiWriteRF(reset_cmd.address, reset_cmd.value);

  // channel config
  spiWriteRF(RF09_IRQM::address, 0x1F);
  spiWriteRF(RF09_CS::address, 0x50);
  spiWriteRF(RF09_CCF0L::address, 0xF0);
  spiWriteRF(RF09_CCF0H::address, 0x8C);
  spiWriteRF(RF09_CNL::address, channel_number);
  spiWriteRF(RF09_CNM::address, 0x00);

  RF09_RXBWC rxbwc;
  rxbwc.BW = 8;
  rxbwc.IFS = 0;
  rxbwc.IFI = 0;
  spiWriteRF(rxbwc.address, rxbwc.value);

  delay(10);
  RF09_RXDFE rxdfe;
  rxdfe.SR = 1;
  rxdfe.RCUT = 0;
  spiWriteRF(rxdfe.address, rxdfe.value);

  RF09_EDD edd;
  edd.DTB = 3;
  edd.DF = 4;
  spiWriteRF(edd.address, edd.value);

  spiWriteRF(RF09_RNDV::address, 0x11);
  
  RF09_TXCUTC txcutc;
  txcutc.PARAMP = 0;
  txcutc.LPFCUT = 0xB;
  spiWriteRF(txcutc.address, txcutc.value);

  RF09_TXDFE dfe;
  dfe.RCUT = 3;
  dfe.SR = 1;
  dfe.DM = 0;
  spiWriteRF(dfe.address, dfe.value);

  spiWriteRF(RF09_PAC::address, 0x7C);
  spiWriteRF(0x300, 0x1F);
  
  BBC0_PC pc0;
  pc0.CTX = 0;
  pc0.FCSFE = 0;
  pc0.FCSOK = 0;
  pc0.TXAFCS = 0;
  pc0.FCST = 1;
  pc0.BBEN = 1;
  pc0.PT = 0x3;
  spiWriteRF(pc0.address, pc0.value);

  BBC0_OQPSKC0 opqsk_c0;
  opqsk_c0.DM = 0;
  opqsk_c0.MOD = 0;
  opqsk_c0.FCHIP = 2;
  spiWriteRF(opqsk_c0.address, opqsk_c0.value);

  BBC0_OQPSKC1 opqsk_c1;
  opqsk_c1.RXO = 1;
  opqsk_c1.RXOLEG = 1;
  opqsk_c1.PDT0 = 1;
  opqsk_c1.PDT1 = 1;
  spiWriteRF(opqsk_c1.address, opqsk_c1.value);

  BBC0_OQPSKC2 opqsk_c2;
  opqsk_c2.SPC = 0;
  opqsk_c2.RPC = 0;
  opqsk_c2.ENPROP = 0;
  opqsk_c2.FCSTLEG = 1;
  opqsk_c2.RXM = 1;
  spiWriteRF(opqsk_c2.address, opqsk_c2.value);

  BBC0_OQPSKC3 opqsk_c3;
  opqsk_c3.HRLEG = 0;
  opqsk_c3.NSFD = 3;
  spiWriteRF(opqsk_c3.address, opqsk_c3.value);

  BBC0_OQPSKPHRTX tx;
  tx.LEG = 1;
  tx.MOD = 0;
  tx.PPDUT = 0;
  tx.RB0 = 0;
  spiWriteRF(tx.address, tx.value);

  BBC0_OQPSKPHRRX rx;
  rx.LEG = 1;
  rx.MOD = 0;
  rx.PPDUT = 0;
  rx.RB0 = 0;
  spiWriteRF(rx.address, rx.value);

  oqpsk_tx_rdy = true;
  oqpsk_rx_rdy = false;
  tx_timer_set = false;
  rx_set = false;
}

void oqpsk_status(bool& tx_ready, bool& rx_ready)
{
  BBC0_IRQS irqs;
  irqs.value = spiReadRF(BBC0_IRQS::address);

  if(irqs.TXFE)
  {
    txTime = 0;
    tx_timer_set = true;
  }

  if(irqs.RXFE)
  {
    oqpsk_rx_rdy = true;
    Serial.println("New Rx frame ready");
  }

  if(receiving && !rx_set)
  {
    oqpsk_rx();
    delay(1);
  }
  

  if(tx_timer_set && txTime > 10)
  {
    oqpsk_tx_rdy = true;
  }

  tx_ready = oqpsk_tx_rdy;
  rx_ready = oqpsk_rx_rdy;
}

void oqpsk_trx_off()
{
  RF09_CMD cmd;
  cmd.CMD = 0x2;
  spiWriteRF(cmd.address, cmd.value);

  delay(1);

  rx_set = false;
}

void oqpsk_rx()
{
  RF09_CMD cmd;
  cmd.CMD = 0x5;
  spiWriteRF(cmd.address, cmd.value);

  delay(1);

  oqpsk_read_state();
  if(spiReadRF(RF09_STATE::address) == 5)
  {
    Serial.println("RX set");
    rx_set = true;
  }
}

void oqpsk_tx()
{
  RF09_CMD cmd;
  cmd.CMD = 0x3;
  spiWriteRF(cmd.address, cmd.value);

  delay(1);

  cmd.CMD = 0x4;
  spiWriteRF(cmd.address, cmd.value);
  delay(1);
  oqpsk_read_state();

  oqpsk_tx_rdy = false;
  rx_set = false;
}

void oqpsk_write_tx_length(uint16_t length)
{
  BBC0_TXFLH high;
  BBC0_TXFLL low;
  low.TXFLL = length & 0xFFFF;
  high.TXFLH = (length >> 8) & 0x07;
  spiWriteRF(high.address, high.value);
  spiWriteRF(low.address, low.value);
}

uint16_t oqpsk_read_tx_length()
{
  uint16_t ret = spiReadRF(BBC0_TXFLL::address);
  ret |= (spiReadRF(BBC0_TXFLH::address) & 0x07) << 8;
  return ret;
}

uint16_t oqpsk_read_rx_length()
{
  uint16_t ret = spiReadRF(BBC0_RXFLL::address);
  ret |= (spiReadRF(BBC0_RXFLH::address) & 0x07) << 8;
  return ret;
}

void oqpsk_read_state()
{
  switch(spiReadRF(RF09_STATE::address))
  {
    case 0:
      Serial.println("Invalid (0)");
      break;
    case 1:
      Serial.println("Invalid (1)");
      break;
    case 2:
      Serial.println("TRXOFF");
      break;
    case 3:
      Serial.println("TXPREP");
      break;
    case 4:
      Serial.println("TX");
      break;
    case 5:
      Serial.println("RX");
      break;
    case 6:
      Serial.println("TRANSITION");
      break;
    case 7:
      Serial.println("RESET");
      break;
    default:
      Serial.println("UNKNOWN");
  }
}

uint8_t oqpsk_receive(unsigned char* rx_buff)
{
  // read packet length
  uint8_t length = oqpsk_read_rx_length();

  Serial.printf("Rx packet len: %d\n", length);

  for (int i = 0; i < length; i++)
  {
    rx_buff[i] = spiReadRF(BBC0_FBRXS::address + i);
    if(rx_buff[i] == 0)
    {
      // could be an SPI error, try re-reading
      rx_buff[i] = spiReadRF(BBC0_FBRXS::address + i);
    }
  }

  oqpsk_rx_rdy = false;
  rx_set = false;

  return length;
}

int oqpsk_transmit(unsigned char* cbits, int payload_len)
{
  TxPacket packet(cbits, payload_len);
  // write packet length
  oqpsk_write_tx_length(packet.get_length());

  int i = 0;
  for (auto itr = packet.begin(); itr != packet.end(); itr++)
  {
    spiWriteRF(BBC0_FBTXS::address + i, *itr);
    i++;
  }

  oqpsk_tx();

  return packet.get_length();
}