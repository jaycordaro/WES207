// Radio IRQ Status
union RF09_IRQS
{
  struct
  {  
    unsigned char WAKEUP : 1;
    unsigned char TRXRDY : 1;
    unsigned char EDC : 1;
    unsigned char BATLOW : 1;
    unsigned char TRXERR : 1;
    unsigned char IQIFSF : 1;
    unsigned char : 2;
  };

  uint8_t value;
	
	static const uint16_t address =  0x0000;
};

// ensure size is one byte
static_assert(sizeof(RF09_IRQS) == 1);

// Reset Register 
union RF_RST
{
  struct
  {
    unsigned char CMD : 3;
    unsigned char : 5;
  };

  uint8_t value;
	
	static const uint16_t address =  0x0005;
};

constexpr char CHIP_RESET = 0x7;

// ensure size is one byte
static_assert(sizeof(RF_RST) == 1);

// IRQ Configuration register
union RF_CFG
{
  struct
  {
    unsigned char DRV : 2;
	  unsigned char IRQP : 1;
	  unsigned char IRQMM : 1;
  };

  uint8_t value;

	static const uint16_t address =  0x0006;
};

	// ensure size is one byte 
static_assert(sizeof(RF_CFG) == 1);

// Clock Output
union RF_CLKO
{ 
  struct
  {  
	  unsigned char OS : 2;  // 0x0 is off, 0x1 is 26MHz (default), 0x2 is 32MHz
    unsigned char DRV : 2; // drive strength
  };

  uint8_t value;
	
	static const uint16_t address =  0x0007;
};

	// ensure size is one byte 
static_assert(sizeof(RF_CLKO) == 1);

// Clock Output
union RF_XOC
{ 
  struct
  {  
	  unsigned char TRIM : 4;  // 
    unsigned char DRV : 2; // drive strength
	  unsigned char : 2;
  };

  uint8_t value;

	static const uint16_t address =  0x0009;
};

	// ensure size is one byte 
static_assert(sizeof(RF_XOC) == 1);

// Tx control bit setting, loopback mode
union RF_IQIFC0
{
  struct
  {
    unsigned char ECC : 1; 
    unsigned char CMV1V2 : 1;
    unsigned char CMV : 2;  
    unsigned char DRV : 2; 
    unsigned char SF : 1;
    unsigned char EXTLB : 1;
  };

  uint8_t value;

  static const uint16_t address = 0x000A;
};

// ensure size is one byte
static_assert(sizeof(RF_IQIFC0) == 1);

// Used to set IQ mode
union RF_IQIFC1
{
  struct
  {
    unsigned char SKEWDRV : 2; 
    unsigned char    : 2;
    unsigned char CHPM : 3;  
    unsigned char FAILSF : 1;
  };

  uint8_t value;

  static const uint16_t address = 0x000B;
};

// ensure size is one byte
static_assert(sizeof(RF_IQIFC1) == 1);

// Syncrhonization status
union RF_IQIFC2
{
  struct
  {
    unsigned char    : 7;
    unsigned char SYNC : 1;
  };

  uint8_t value;

  static const uint16_t address = 0x000C;
};

// ensure size is one byte
static_assert(sizeof(RF_IQIFC2) == 1);

// Radio IRQ Mask
union RF09_IRQM
{
  struct
  {
    unsigned char WAKEUP : 1;  // Wakeup / Reset Interrupt Mask
    unsigned char TRXRDY : 1;  // Transceiver Ready Inerrupt Mask 
    unsigned char EDC : 1;     // Energy Detection Completion Interrupt Mask
    unsigned char BATLOW :1;   // Battery low interrupt mask
    unsigned char TRXERR : 1;  //  Transceiver Error Interrupt Mask
    unsigned char IQIFSF : 1;  // I/Q IF Synchronization Failure Interrupt Mask
    unsigned char : 2; 
  };

  uint8_t value;

	static const uint16_t address =  0x0100;
};

	// ensure size is one byte 
static_assert(sizeof(RF09_IRQM) == 1);

// Transceiver Auxilliary Settings
union RF09_AUXS
{
  struct
  { 
    unsigned char PAVC : 2;  // 
    unsigned char AVS : 1;    // 
    unsigned char AVEN : 1;
    unsigned char AVEXT : 1;
    unsigned char AGCMAP : 2;
    unsigned char EXTLNABYP : 1;
  };

  uint8_t value;

	static const uint16_t address =  0x0101;
};

// ensure size is one byte 
static_assert(sizeof(RF09_AUXS) == 1);

// transciever state
union RF09_STATE
{
  struct
  {
	  unsigned char STATE : 3;  // 
    unsigned char  : 5; // drive strength
  };

  uint8_t value;
	
	static const uint16_t address =  0x0102;
};

// ensure size is one byte
static_assert(sizeof(RF09_STATE) == 1);

union RF09_CMD
{
  struct
  {
    unsigned char CMD : 3;
    unsigned char : 5;
  };

  uint8_t value;
	
	static const uint16_t address =  0x0103;
};

// ensure size is one byte
static_assert(sizeof(RF09_CMD) == 1);

union RF09_CS
{
  struct
  {
    unsigned char CS : 8;
  };

  uint8_t value;
	
	static const uint16_t address =  0x0104;
};

// ensure size is one byte
static_assert(sizeof(RF09_CS) == 1);

// carrier frequency low
union RF09_CCF0L
{
  struct
  {
    unsigned char CCF0L : 8;
  };

  uint8_t value;

  static const uint16_t address = 0x0105;
};

// ensure size is one byte
static_assert(sizeof(RF09_CCF0L) == 1);

// carrier frequency high
union RF09_CCF0H
{
  struct
  {
    unsigned char CCF0H : 8;
  };

  uint8_t value;

  static const uint16_t address = 0x0106;
};

// ensure size is one byte
static_assert(sizeof(RF09_CCF0H) == 1);

// channel number low
union RF09_CNL
{
  struct
  {
    unsigned char CNL : 8;
  };

  uint8_t value;

  static const uint16_t address = 0x0107;
};

// ensure size is one byte
static_assert(sizeof(RF09_CNL) == 1);

// channel number high
union RF09_CNM
{
  struct
  {
    unsigned char CNH : 1;
    unsigned char : 6;
    unsigned char CM : 1;
  };

  uint8_t value;
  
  static const uint16_t address = 0x0108;
};

// receive filter bandwidth
union RF09_RXBWC
{ 
  struct
  {  
    unsigned char BW : 4;  // 
    unsigned char IFS : 1; // 
    unsigned char IFI : 1;
    unsigned char : 2;
  };

  uint8_t value;

	static const uint16_t address =  0x0109;
};

	// ensure size is one byte 
static_assert(sizeof(RF09_RXBWC) == 1);

// rx sample rate and cutoff rate
union RF09_RXDFE
{ 
  struct
  {  
	  unsigned char SR : 4;  // 
    unsigned char : 1; // 
  	unsigned char RCUT : 3;
  };

  uint8_t value;

	static const uint16_t address =  0x010A;
};

	// ensure size is one byte 
static_assert(sizeof(RF09_RXDFE) == 1);

// AGC control
union RF09_AGCC
{ 
  struct
  {  
    unsigned char EN : 1;  // 
    unsigned char FRZC: 1; // 
    unsigned char FRZS : 1;
    unsigned char RST : 1;
    unsigned char AVGS : 2;
    unsigned char AGCI : 1;
    unsigned char  : 1;
  };

  uint8_t value;

	static const uint16_t address =  0x010B;
};

	// ensure size is one byte 
static_assert(sizeof(RF09_AGCC) == 1);

// receiver AGC gain
union RF09_AGCS
{
  struct
  {
	  unsigned char GCW : 5;  // 
    unsigned char TGT: 3; //
  };

  uint8_t value; 
	
	static const uint16_t address =  0x010C;
};

// ensure size is one byte
static_assert(sizeof(RF09_CNM) == 1);

// received signal strength
union RF09_RSSI
{
  struct
  {
    unsigned char RSSI : 8;
  };

  uint8_t value;

  static const uint16_t address = 0x010D;
};

// ensure size is one byte
static_assert(sizeof(RF09_RSSI) == 1);


// energy detection mode
union RF09_EDC
{
  struct
  {
    unsigned char EDM : 1;
    unsigned char : 7;
  };

  uint8_t value;
  
  static const uint16_t address = 0x010E;
};

// ensure size is one byte
static_assert(sizeof(RF09_EDC) == 1);

// energy detection mode
union RF09_EDD
{
  struct
  {
    unsigned char DTB : 1;
    unsigned char DF : 7;
  };

  uint8_t value;

  static const uint16_t address = 0x010F;
};

// ensure size is one byte
static_assert(sizeof(RF09_EDD) == 1);

// energy detection value
union RF09_EDV
{
  struct
  {  
	  unsigned char EDV : 8;  // 
  };

  uint8_t value;
	
	static const uint16_t address =  0x0110;
};

	// ensure size is one byte 
static_assert(sizeof(RF09_EDV) == 1);

// random number
union RF09_RNDV
{   
  struct
  {
	  unsigned char RNDV : 8;  // 
  };

	uint8_t value;

	static const uint16_t address =  0x0111;
};

	// ensure size is one byte 
static_assert(sizeof(RF09_RNDV) == 1);

// tx filter cutoff PA ramp time
union RF09_TXCUTC
{
  struct
  {
    unsigned char LPFCUT : 4;
    unsigned char : 2;
    unsigned char PARAMP : 2;
  };

  uint8_t value;

  static const uint16_t address = 0x0112;
};

// ensure size is one byte
static_assert(sizeof(RF09_TXCUTC) == 1);

// tx filter cutoff PA ramp time
union RF09_TXDFE
{
  struct
  {
    unsigned char SR : 4;
    unsigned char DM : 1;
    unsigned char RCUT : 3;
  };

  uint8_t value;

  static const uint16_t address = 0x0113;
};

// ensure size is one byte
static_assert(sizeof(RF09_TXDFE) == 1);


union RF09_PAC
{
  struct
  {
    unsigned char TXPWR : 5;
    unsigned char PACUR : 2;
    unsigned char  : 1;
  };

  uint8_t value;

  static const uint16_t address =  0x0114;
};
// ensure size is one byte
static_assert(sizeof(RF09_PAC) == 1); 

union RF09_PADFE
{
  struct
  {
    unsigned char  : 6;
    unsigned char PADFE : 2;
  };

  uint8_t value;

  static const uint16_t address =  0x0116;
};
// ensure size is one byte
static_assert(sizeof(RF09_PADFE) == 1); 

union RF09_PLL
{
  struct
  {
    unsigned char  : 1;
    unsigned char LS : 1;
    unsigned char  : 2;
    unsigned char LBW : 2;
    unsigned char  : 2;
  };

  uint8_t value;

  static const uint16_t address =  0x0121;
};
// ensure size is one byte
static_assert(sizeof(RF09_PLL) == 1); 

union RF09_PLLCF
{
  struct
  {
    unsigned char CF : 6;
    unsigned char  : 1;
    unsigned char  : 1;
  };

  uint8_t value;

  static const uint16_t address =  0x0122;
};
// ensure size is one byte
static_assert(sizeof(RF09_PLLCF) == 1); 

// control the Transmit Frequency Control Word for the In-phase (I) channel of the RF09 (sub-GHz) radio, 
// which is related to In-phase Tx LO leakage (Local Oscillator leakage)
union RF09_TXCI
{
  struct
  {
    unsigned char DCOI : 6; // Bit 5:0 – TXCI.DCOI: DC offset calibration value I path
    unsigned char  : 1;
    unsigned char  : 1;
  };

  uint8_t value;

  static const uint16_t address =  0x0125;
};
// ensure size is one byte
static_assert(sizeof(RF09_TXCI) == 1); 

// control the Transmit Frequency Control Word for the Quadrature (Q) channel of the RF09 (sub-GHz) radio
union RF09_TXCQ
{
  struct
  {
    unsigned char DCOQ : 6; //Bit 5:0 – TXCQ.DCOQ: DC offset calibration value Q path
    unsigned char  : 1;
    unsigned char  : 1;
  };

  uint8_t value;

  static const uint16_t address =  0x0126;
};
// ensure size is one byte
static_assert(sizeof(RF09_TXCQ) == 1);

// control the transmit DAC (Digital-to-Analog Converter) settings for the In-phase (I) channel of the RF09 (sub-GHz) radio
union RF09_TXDACI
{
  struct
  {
    unsigned char TXDACID : 7;   //  Input to TXDAC data
    unsigned char ENTXDACID : 1; // Enable input to TXDAC
  };

  uint8_t value;
       
  static const uint16_t address =  0x0127;
};
// ensure size is one byte
static_assert(sizeof(RF09_TXDACI) == 1);

// controls the operation of the transmitter's digital-to-analog converter (DAC) quadrature calibration function. 
union RF09_TXDACQ
{
  struct
  {
    unsigned char TXDACQD : 7; //  Input to TXDAC data
    unsigned char ENTXDACQD : 1; //Enable input to TXDAC
  };

  uint8_t value;

  static const uint16_t address =  0x0128;
};
// ensure size is one byte
static_assert(sizeof(RF09_TXDACQ) == 1);
