/* Top level for file transceiver. */
#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <string>
#include "TxPacket.h"
#include "RxPacket.h"
#include <bitset>
#include "rf_registers.h"
#include <SerialFlash.h>

#include <utility/imxrt_hw.h> 
#include <play_sd_opus.h>
#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message, true))
#define MY_ASSERT_NON_FATAL(cond, message) (my_assert((cond), __LINE__, __FILE__, message, false))

constexpr int MAX_PACKET_SIZE = 120;
constexpr int MAX_RX_PACKET_SIZE = 127;

bool transmitting;
bool receiving;
bool header_filter;
bool crc_filter;

enum prompt_t
{
  PROMPT_FOR_CMD,
  CMD,
  CHANNEL_NUMBER,
  NONE
};

prompt_t prompt;

int tx_limit = 0;

unsigned char cbits[MAX_PACKET_SIZE];
unsigned char rx_buff[MAX_RX_PACKET_SIZE];

void setup() {
  Serial.begin(9600);
  Serial.println("Starting program...");

  transmitting = false;
  receiving = false;
  header_filter = false;
  crc_filter = false;
  prompt = PROMPT_FOR_CMD;

  spi_init();
  sd_init();
  audio_out_init();
  oqpsk_init(1);
}

void tx_rx_status(bool& tx_ready, bool& rx_ready)
{
  oqpsk_status(tx_ready, rx_ready);
}

void loop() {
  handleCommands();

  bool tx_ready, rx_ready;

  tx_rx_status(tx_ready, rx_ready);

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

