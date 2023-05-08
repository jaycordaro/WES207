#include "rf_registers.h"

void init_rf_device()
{
  RF_RST reset_cmd;
  reset_cmd.CMD = CHIP_RESET;

  spiWriteRF(reset_cmd.address, reset_cmd.value);

  spiWriteRF(RF09_CS::address, 0x50);

  spiWriteRF(RF09_CCF0H::address, 0x8C);

  spiWriteRF(RF09_CCF0L::address, 0xF0);

  spiWriteRF(RF09_CNL::address, 0x1); 

  spiWriteRF(RF09_CNM::address, 0x0);

  RF_IQIFC0 c0;
  c0.EXTLB = 0;
  c0.SF = 0;
  c0.DRV = 1;
  c0.CMV1V2 = 1;
  c0.CMV = 1;
  c0.ECC = 0;

  spiWriteRF(c0.address, c0.value);

  RF_IQIFC1 c1;
  c1.CHPM = 1;
  c1.SKEWDRV = 2;
  
  spiWriteRF(c1.address, c1.value);

  RF09_TXDACI daci;
  daci.ENTXDACID = 1;
  daci.TXDACID = 1;

  spiWriteRF(RF09_TXDACI::address, daci.value);

  RF09_CMD cmd;
  cmd.CMD = 0x3;

  spiWriteRF(cmd.address, cmd.value);

  delay(1);

  cmd.CMD = 0x4;

  spiWriteRF(cmd.address, cmd.value);
}