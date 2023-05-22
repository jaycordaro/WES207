void sd_init() {
  MY_ASSERT(SD.begin(BUILTIN_SDCARD), "Cannot init SD card");
}

File bertOut;

void writeBertMessage(const char* message)
{
  Serial.print(message);
  bertOut.write(message);
}

void initBertOut()
{
  bertOut = SD.open("BERT.txt", FILE_WRITE);
  MY_ASSERT(bertOut != 0, "failed to open output file");
  writeBertMessage(make_string("%s BER Test:\n", BerTester::pattern_name(pattern)));
}

void writeBertOut(unsigned char* buff, int count, int errors)
{
  int line_idx = 0;
  for(int i = 0; i < count; i++)
  {
    std::bitset<8> bits(buff[i]);
    if(line_idx != 3)
    {
      writeBertMessage(make_string("%s ", bits.to_string().c_str()));
    }
    else
    {
      writeBertMessage(make_string("%s\n", bits.to_string().c_str()));
    }
    line_idx = (line_idx + 1) % 4;
  }

  if(line_idx != 0)
  {
    Serial.println();
    bertOut.write("\n");
  }

  writeBertMessage(make_string("Errors: %d\n", errors));
}

void finalizeBertOut()
{
  writeBertMessage(make_string("%s test complete, %d total bit errors\n\n", BerTester::pattern_name(pattern), rxBert.error_total));
  bertOut.close();
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
      if(cmd == "TRX")
      {
        Serial.println("Trxing...");
        transmitting = true;
        receiving = true;
        tx_count = 0;
        rx_count = 0;
        prompt = NONE;
        if(mode == OPUS)
        {
          opus_init_tx();
          opus_init_rx();
        }
        else
        {
          txBert = BerTester(pattern);
          rxBert = BerTester(pattern);
          initBertOut();
        }
      }
      else if(cmd == "TX")
      {
        Serial.println("Txing...");
        transmitting = true;
        prompt = NONE;
        tx_count = 0;
        if(mode == OPUS)
        {
          opus_init_tx();
        }
        else
        {
          txBert = BerTester(pattern);
        }
      }
      else if(cmd == "RX")
      {
        Serial.println("Enter Rx Count:");
        prompt = RX_COUNT;
      }
      else if (cmd == "BERT")
      {
        Serial.println("Enter BERT pattern:");
        prompt = BERT_PATTERN;
      }
      else if (cmd == "OPUS")
      {
        Serial.println("Set to Opus Mode!");
        mode = OPUS;
        prompt = PROMPT_FOR_CMD;
      }
      else if (cmd == "OQPSK")
      {
        Serial.println("Moudlation set to OQPSK!");
        oqpsk_init();
        modulation = OQPSK;
        prompt = PROMPT_FOR_CMD;
      }
      else if (cmd == "BPSK")
      {
        Serial.println("Moudlation set to BPSK!");
        bpsk_init();
        modulation = BPSK;
        prompt = PROMPT_FOR_CMD;
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

        if(mode == OPUS)
        {
          opus_init_rx();
        }
        else
        {
          rxBert = BerTester(pattern);
          initBertOut();
        }
      }

      break;
    }

    case BERT_PATTERN:
    {
      BerTester::pattern_t cmd_pattern = BerTester::NONE;
      String cmd = getCommand();
      if(cmd == "MK")
      {
        cmd_pattern = BerTester::MK;
      }
      else if(cmd == "SP")
      {
        cmd_pattern = BerTester::SP;
      }
      else if (cmd == "ONE_ONE")
      {
        cmd_pattern = BerTester::ONE_ONE;
      }
      else if (cmd == "ONE_SEVEN")
      {
        cmd_pattern = BerTester::ONE_SEVEN;
      }
      else if (cmd == "ONE_FIFTEEN")
      {
        cmd_pattern = BerTester::ONE_FIFTEEN;
      }
      else if (cmd == "PRBS_63")
      {
        cmd_pattern = BerTester::PRBS_63;
      }
      else if (cmd == "PRBS_127")
      {
        cmd_pattern = BerTester::PRBS_127;
      }

      if(cmd_pattern != BerTester::NONE)
      {
        Serial.println("Pattern Set!");
        mode = BERT;
        pattern = cmd_pattern;
        Serial.println("Enter Tx limit:");
        prompt = BERT_LIMIT;
      }

      break;
    }

    case BERT_LIMIT:
    {
      int cmd_count = getValue();
      if(cmd_count > 0)
      {
        Serial.println("Tx limit set!");
        tx_limit = cmd_count;
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
  if(modulation == BPSK)
  {
    return fpga_transmit(cbits, payload_len);
  }
  else
  {
    return oqpsk_transmit(cbits, payload_len);
  }
}

void handle_transmit()
{
  int payload_len = 0;
  if(mode == OPUS)
  {
    encode(cbits, payload_len);
  }
  else
  {
    if(tx_count >= tx_limit)
    {
      payload_len = 0;
    }
    else
    {
      payload_len = random(1, 120);
      if(payload_len + tx_count > tx_limit)
      {
        payload_len = tx_limit - tx_count;
      }
      txBert.fill(cbits, payload_len);
    }
  }

  if(payload_len != 0)
  {
    int amount_txed = transmit(cbits, payload_len);
    Serial.printf("Tx'd %d bytes\n", amount_txed);
    tx_count += payload_len;
    rx_count += amount_txed;
  }
  else
  {
    if(mode == OPUS)
    {
      opus_tx_complete();
    }
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
  if(mode == OPUS)
  {
    opus_rx_complete();
  }
  else
  {
    finalizeBertOut();
  }
  receiving = false;
}

uint8_t receive(unsigned char* rx_buff)
{
  if(modulation == BPSK)
  {
    return fpga_receive(rx_buff);
  }
  else
  {
    return oqpsk_receive(rx_buff);
  }
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

  if(mode == OPUS)
  {
    decode(rx.payload_begin(), rx.get_payload_len());
  }
  else
  {
    int errors = rxBert.error_count(rx.payload_begin(), rx.get_payload_len());
    writeBertOut(rx.payload_begin(), rx.get_payload_len(), errors);
  }

  rx_count -= length;
  if(rx_count <= 0 && !transmitting)
  {
     rx_complete();
  }
}