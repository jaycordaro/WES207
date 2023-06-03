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
        Serial.println("Txing...");
        transmitting = true;
        prompt = NONE;
        tx_count = 0;
        opus_init_tx();
      }
      else if(cmd == "RX")
      {
        Serial.println("Enter Rx Count:");
        prompt = RX_COUNT;
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

      break;
    }

    case RX_COUNT:
    {
      int cmd_count = getValue();
      if(cmd_count > 0)
      {
        Serial.println("Rxing...");
        receiving = true;
        rx_count = cmd_count;
        prompt = NONE;

        opus_init_rx();
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
    tx_count += payload_len;
    rx_count += amount_txed;
  }
  else
  {
    opus_tx_complete();
	
    Serial.println("Tx compelte.");
    transmitting = false;

    if(rx_count <= 0)
    {
      rx_complete();
    }
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
  if(rx_count <= 0 && !transmitting)
  {
    rx_complete();
    return;
  }

  int length = receive(rx_buff);

  Serial.printf("Rx'd %d/%d bytes\n", length, rx_count);

  RxPacket rx((Packet*)&rx_buff, length);

  MY_ASSERT_NON_FATAL(rx.validate_header(), "Invalid header received!");
  MY_ASSERT_NON_FATAL(rx.validate_crc(), "Invalid crc received!");

  decode(rx.payload_begin(), rx.get_payload_len());

  rx_count -= length;
  if(rx_count <= 0 && !transmitting)
  {
     rx_complete();
  }
}