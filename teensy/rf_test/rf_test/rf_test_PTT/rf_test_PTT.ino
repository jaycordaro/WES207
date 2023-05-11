#include <stdio.h>
#include <SPI.h>
#include <string>
#include "rf_registers.h"

constexpr uint32_t SPICLOCKRATE = 4000000;

// define the pin used to select the device:
const int chipSelectPin = 10;
const int analogPin = A13; 

// define the macro for assertion checking:
#define MY_ASSERT(cond, message) (my_assert((cond), __LINE__, __FILE__, message))
void my_assert(bool cond, int line, const char* file, const char* message)
{
  if(!cond)
    {
      // print an error message if the condition is not met:
      Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
    }
}

char temp_make_string_buffer[1024];
const char* make_string(const char* format, ...)
{
  va_list arguments;
  va_start(arguments, format);
  vsnprintf(temp_make_string_buffer, sizeof(temp_make_string_buffer), format, arguments);
  va_end(arguments);
  return temp_make_string_buffer;
}



// the setup function initializes the device:
void setup() 
{   // start the serial communication:
    Serial.begin(9600);
    Serial.println("Starting program...");

    // set the chip select pin to output:
    pinMode(chipSelectPin, OUTPUT);
    digitalWrite(chipSelectPin, HIGH);
    SPI.begin();

    // reset the device:
    RF_RST reset_cmd;
    reset_cmd.CMD = CHIP_RESET;

    spiWrite(reset_cmd.address, reset_cmd.value);

    // set the Chanel spase/freqHL:
    spiWrite(RF09_CS::address, 0x50);
    spiWrite(RF09_CCF0H::address, 0x8C);
    spiWrite(RF09_CCF0L::address, 0xF0);

    // set the channel number:
    spiWrite(RF09_CNL::address, 0x02);
    spiWrite(RF09_CNM::address, 0x0);

    // configure the IQ interface:
    RF_IQIFC0 c0;
    c0.EXTLB = 0;
    c0.SF = 0;
    c0.DRV = 1;
    c0.CMV1V2 = 1;
    c0.CMV = 1;
    c0.ECC = 0;
    spiWrite(c0.address, c0.value);

    RF_IQIFC1 c1;
    c1.CHPM = 1;
    c1.SKEWDRV = 2;
    spiWrite(c1.address, c1.value);


    // configure the transmit DAC:
    RF09_TXDACI daci;
    daci.ENTXDACID = 1;
    daci.TXDACID = 1;
    spiWrite(RF09_TXDACI::address, daci.value);

    RF09_TXDACQ dacq;
    dacq.ENTXDACQD = 1;
    dacq.TXDACQD = 1;
    spiWrite(RF09_TXDACQ::address, dacq.value);

    // configure the transmit LO leakage:
    //RF09_TXCI txci;
    //txci.DCOI = 31;
    //spiWrite(RF09_TXCI::address, daci.value);

    //RF09_TXCQ txcq;
    //txcq.DCOQ = 31;
    //spiWrite(RF09_TXCQ::address, dacq.value);

    // set the device to receive mode:
    RF09_CMD cmd;
    cmd.CMD = 0x3;
    spiWrite(cmd.address, cmd.value);
    delay(1);

    // set the device to transmit mode:
    cmd.CMD = 0x4;
    spiWrite(cmd.address, cmd.value);
    
    // Analog pin setting to input
    pinMode(analogPin, INPUT); // Set analog pin as input
    //Serial.begin(9600); // Initialize serial communication
}
// define a function to get a command from the user via the serial interface:
String getCommand() 
{
  String command = "";
  // loop until a non-empty command is received:
  while(command == "")
  {
    // read a string from the serial interface with a maximum length of 1024 characters:
    command = Serial.readString(1024);
    delay(1);
  }
  // return the trimmed command string:
  return command.trim();
}
// define a function to get a numerical value from the user via the serial interface:
int getValue()
{ // get a command from the user:
  String cmd = getCommand();
  // convert the command to an integer value and return it:
  return cmd.toInt();
}


// the main loop of the program:
void loop() 
{ ////////////Analog input reading///////////////////////////////
  // Read value of analog pin
  int analogValue = analogRead(analogPin);

  // Print analog value to serial console
  Serial.print("Analog value: ");
  Serial.println(analogValue);
  delay(100); // Add a small delay before taking another reading
  /////////////////////////////////////////////////////////////////
  if ( analogValue > 300)
  {
      RF09_CMD cmd;
    cmd.CMD = 0x3;
    spiWrite(cmd.address, cmd.value);
    delay(1);

    // set the device to transmit mode:
    cmd.CMD = 0x4;
    spiWrite(cmd.address, cmd.value);
  }
  else
  {
    RF09_CMD cmd;
    // set the device to transmit mode:
    cmd.CMD = 0x5;
    spiWrite(cmd.address, cmd.value);
  }

/*
  // prompt the user to enter a command:
  Serial.println("enter command:");
  // get a command from the user:
  String cmd = getCommand();
  // process the command:
  if(cmd == "read"){
    // prompt the user to enter an address to read from:
    Serial.println("read address:");
    // get the address from the user:
    int address = getValue();
    // print the address:
    Serial.printf("Address set to %d\n", address);
    // read the value from the specified address:
    int result = spiRead(address);
    // print the value:
    Serial.printf("Value read is %d\n", result);
  }
  else if (cmd == "write")
  {
    // prompt the user to enter an address to write to:
    Serial.println("write address:");
    // get the address from the user:
    int address = getValue();
    // print the address:
    Serial.printf("Address set to %d\n", address);
    // prompt the user to enter a value to write:
    Serial.println("write value:");
    // get the value from the user:
    int value = getValue();
    // print the value:
    Serial.printf("Value set to %d\n", value);
    // write the value to the specified address:
    spiWrite(address, value);
  }
  else
  {
    // print an error message if an invalid command is entered:
    Serial.println("invalid command");
  }
*/

}

// define constants for the read and write operations:
constexpr uint16_t read = 0x0000;
constexpr uint16_t write = 0x8000;

// define a function to write a value to an address on the device via SPI:
void spiWrite(uint16_t address, uint8_t value) 
{ // begin an SPI transaction with the specified clock rate and mode:
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  // select the device by setting the chip select pin low:
  digitalWrite(chipSelectPin, LOW);

  // write the address with the write flag set:
  uint8_t res = SPI.transfer16(write | address);
  // check if the write was successful:
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  // write the data value:
  res = SPI.transfer(value);
  // check if the write was successful:
  MY_ASSERT(res == 0, make_string("Received %d on writing data!", res));

  // deselect the device by setting the chip select pin high:
  digitalWrite(chipSelectPin, HIGH);

  // end the SPI transaction:
  SPI.endTransaction();
}

// define a function to read a value from an address on the device via SPI:
uint8_t spiRead(uint16_t address) 
{ // begin an SPI transaction with the specified clock rate and mode:
  SPI.beginTransaction(SPISettings(SPICLOCKRATE, MSBFIRST, SPI_MODE0));

  // select the device by setting the chip select pin low:
  digitalWrite(chipSelectPin, LOW);

  // write the address with the read flag set:
  uint8_t res = SPI.transfer16(read | address);
  // check if the write was successful:
  MY_ASSERT(res == 0, make_string("Received %d on writing write address!", res));

  // read the data value:
  res = SPI.transfer(0);

  // deselect the device by setting the chip select pin high:
  digitalWrite(chipSelectPin, HIGH);

  // end the SPI transaction:
  SPI.endTransaction();

  // return the read value:
  return res;
}