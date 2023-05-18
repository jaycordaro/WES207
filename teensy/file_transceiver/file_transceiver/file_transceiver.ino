/* Top level for file transceiver. */
#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <string>
#include "TxPacket.h"
#include "RxPacket.h"
#include "fpga.h"
#include "BerTester.h"
#include <bitset>

#include <utility/imxrt_hw.h> 
#include <play_sd_opus.h>
#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message, true))
#define MY_ASSERT_NON_FATAL(cond, message) (my_assert((cond), __LINE__, __FILE__, message, false))

#define USE_SPI 1

constexpr int MAX_PACKET_SIZE = 120;
constexpr int MAX_RX_PACKET_SIZE = 127;


bool transmitting;
bool receiving;
int tx_count = 0;
int rx_count;

enum prompt_t
{
  PROMPT_FOR_CMD,
  CMD,
  RX_COUNT,
  BERT_PATTERN,
  BERT_LIMIT,
  NONE
};

enum operating_mode_t
{
  OPUS,
  BERT
};

prompt_t prompt;
operating_mode_t mode;
BerTester::pattern_t pattern;

int tx_limit = 0;

BerTester txBert(BerTester::NONE);
BerTester rxBert(BerTester::NONE);

unsigned char cbits[MAX_PACKET_SIZE];
unsigned char rx_buff[MAX_RX_PACKET_SIZE];

void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");

  transmitting = false;
  receiving = false;
  prompt = PROMPT_FOR_CMD;
  mode = OPUS;

  spi_init();
  sd_init();

  init_rf_device();
}

void loop() {
  handleCommands();

  bool tx_ready, rx_ready;

  fpga_status(tx_ready, rx_ready);

  if(receiving && rx_ready)
  {
    handle_receive();
  }

  if(transmitting && tx_ready)
  {
    handle_transmit();
  }

  if(prompt == NONE && !receiving && !transmitting)
  {
    prompt = PROMPT_FOR_CMD;
  }
}

