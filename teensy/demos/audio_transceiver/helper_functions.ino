void sd_init() {
  MY_ASSERT(SD.begin(BUILTIN_SDCARD), "Cannot init SD card");
}

void handleCommands()
{
  switch(prompt)
  {
    case PROMPT_FOR_CMD:
    {
      Serial.println("Enter command:");
      prompt = CMD;

      break;
    }

    case CMD:
    {
      String cmd = getCommand();
      if(cmd == "TX")
      {
        Serial.println("Recording...");
        record();
        transmitting = true;
        prompt = NONE;
        Serial.println("Txing...");
        opus_init_tx("recorded.bin");
      }
      if(cmd == "RESEND")
      {
        Serial.println("Txing...");
        transmitting = true;
        prompt = NONE;
        opus_init_tx("recorded.bin");
      }
      if(cmd == "HELLO")
      {
        Serial.println("Txing...");
        transmitting = true;
        prompt = NONE;
        opus_init_tx("hello.bin");
      }
      if(cmd == "BYE")
      {
        Serial.println("Txing...");
        transmitting = true;
        prompt = NONE;
        opus_init_tx("bye.bin");
      }
      if(cmd == "OKAY")
      {
        Serial.println("Txing...");
        transmitting = true;
        prompt = NONE;
        opus_init_tx("okay.bin");
      }
      else if(cmd == "RX")
      {
        Serial.println("Rxing...");
        receiving = true;
        prompt = NONE;
        opus_init_rx();
      }
      else if (cmd == "STATE")
      {
        oqpsk_read_state();
        prompt = PROMPT_FOR_CMD;
      }
      else if (cmd == "READ")
      {
        Serial.println("read address:");
        int address = getValue();
        Serial.printf("Address set to %d\n", address);
        int result = spiReadRF(address);
        Serial.printf("Value read is %d\n", result);
        prompt = PROMPT_FOR_CMD;
      }
      else if (cmd == "PLAY")
      {
        audio_out_play();
        prompt = PROMPT_FOR_CMD;
      }
      else if (cmd == "CHANNEL")
      {
        Serial.printf("Enter channel number:\n");
        prompt = CHANNEL_NUMBER;
      }

      break;
    }

    case CHANNEL_NUMBER:
    {
      int channel = getValue();
      if(channel > 0)
      {
        oqpsk_init(channel);
        prompt = PROMPT_FOR_CMD;
      }

      break;
    }
    
    default:
    {
      String cmd = getCommand();
      if(cmd == "CANCEL")
      {
        transmitting = false;
        receiving = false;
        prompt = PROMPT_FOR_CMD;
      }
      break;
    }
  }
}

int transmit(unsigned char* cbits, int payload_len)
{
   return oqpsk_transmit(cbits, payload_len);
}

void handle_transmit()
{
  int payload_len = 0;

  encode(cbits, payload_len);
  

  if(payload_len != 0)
  {
    int amount_txed = transmit(cbits, payload_len);
    Serial.printf("Tx'd %d bytes\n", amount_txed);
  }
  else
  {
    int amount_txed = transmit(cbits, 0);
    Serial.printf("Ended TX with %d bytes\n", amount_txed);

    opus_tx_complete();
	
    Serial.println("Tx compelte.");
    transmitting = false;
  }
}

void rx_complete()
{
  Serial.println("Rx complete.");

  opus_rx_complete();

  audio_out_play();

  receiving = false;
}

uint8_t receive(unsigned char* rx_buff)
{
  return oqpsk_receive(rx_buff);
}

void handle_receive()
{
  int length = receive(rx_buff);

  Serial.printf("Rx'd %d bytes\n", length);

  RxPacket rx((Packet*)&rx_buff, length);

  MY_ASSERT_NON_FATAL(rx.validate_header(), "Invalid header received!");
  
  MY_ASSERT_NON_FATAL(rx.validate_crc(), "Invalid crc received!");

  if(rx.get_payload_len() != 0)
  {
    decode(rx.payload_begin(), rx.get_payload_len());
  }
  else
  {
    rx_complete();
  }
}