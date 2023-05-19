void rf_init()
{
  // reset
  RF_RST reset_cmd;
  reset_cmd.CMD = CHIP_RESET;
  spiWrite(reset_cmd.address, reset_cmd.value);

  // channel config
  spiWrite(RF09_CS::address, 0x50);

  spiWrite(RF09_CCF0H::address, 0x8C);

  spiWrite(RF09_CCF0L::address, 0xF0);

  spiWrite(RF09_CNL::address, 0x1); 

  spiWrite(RF09_CNM::address, 0x0);

  // loopback
  RF_IQIFC0 c0;
  c0.EXTLB = 0;
  c0.SF = 0;
  c0.DRV = 1;
  c0.CMV1V2 = 1;
  c0.CMV = 1;
  c0.ECC = 0;

  spiWrite(c0.address, c0.value);

  BBC0_PC pc0;
  pc0.CTX = 0;
  pc0.FCSFE = 0;
  pc0.FCSOK = 0;
  pc0.TXAFCS = 0;
  pc0.FCST = 1;
  pc0.BBEN = 1;
  pc0.PT = 0x3;
  spiWrite(pc0.address, pc0.value);
}

void trx_off()
{
  RF09_CMD cmd;
  cmd.CMD = 0x2;
  spiWrite(cmd.address, cmd.value);

  delay(1);
}

void rx()
{
  RF09_CMD cmd;
  cmd.CMD = 0x5;
  spiWrite(cmd.address, cmd.value);

  delay(1);
}

void tx()
{
  RF09_CMD cmd;
  cmd.CMD = 0x3;
  spiWrite(cmd.address, cmd.value);

  delay(1);

  cmd.CMD = 0x4;
  spiWrite(cmd.address, cmd.value);
  delay(1);
  read_state();
}

void write_tx_length(uint16_t length)
{
  BBC0_TXFLH high;
  BBC0_TXFLL low;
  low.TXFLL = length & 0xFFFF;
  high.TXFLH = (length >> 8) & 0x07;
  spiWrite(high.address, high.value);
  spiWrite(low.address, low.value);
}

uint16_t read_tx_length()
{
  uint16_t ret = spiRead(BBC0_TXFLL::address);
  ret |= (spiRead(BBC0_TXFLH::address) & 0x07) << 8;
  return ret;
}

uint16_t read_rx_length()
{
  uint16_t ret = spiRead(BBC0_RXFLL::address);
  ret |= (spiRead(BBC0_RXFLH::address) & 0x07) << 8;
  return ret;
}

void read_rx()
{
  uint16_t length = read_rx_length();
  if(length == 0)
  {
    Serial.printf("No Rx\n");
    return;
  }

  Serial.printf("Rx packet len: %d\n", length);
  for(int i = 0; i < length; i++)
  {
    
    Serial.printf("[%d]: %d\n", i, spiRead(BBC0_FBRXS::address + i));
  }
}

void load_tx(int length)
{
  write_tx_length(length);
  Serial.printf("length: %d\n", read_tx_length());
  for(int i = 0; i < length; i++)
  {
    spiWrite(BBC0_FBTXS::address + i, i+1);
  }
}

void read_state()
{
  switch(spiRead(RF09_STATE::address))
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