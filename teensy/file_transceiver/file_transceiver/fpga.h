#ifndef FPGA_H
#define FPGA_H

union STATUS_REG
{
  struct
  {  
    unsigned char ERRCODE : 6;
    unsigned char RXRDY : 1;
    unsigned char TXRDY : 1;
  };

  uint8_t value;
	
	static const uint16_t address =  0x0001;
};

union TX_PACKET_LEN_REG
{
  uint8_t length;
	
	static const uint16_t address =  0x0002;
};

union TX_PACKET_REG
{
  uint8_t value;
	
	static const uint16_t address =  0x0003;
};

union RX_PACKET_LEN_REG
{
  uint8_t length;
	
	static const uint16_t address =  0x0004;
};

union RX_PACKET_REG
{
  uint8_t value;
	
	static const uint16_t address =  0x0005;
};


#endif