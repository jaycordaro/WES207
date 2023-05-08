# File-based transceiver
This transceiver can be commanded through the Teensy serial interface. Rather than sending and receiving data from a microphone/speaker, it reads and writes files to an SD card.

## Build Instructions
install the Arduino-Teensy-Codec-lib: 
```
cd  ~/Documents/Arduino/libraries
git clone https://github.com/FrankBoesing/Arduino-Teensy-Codec-lib
```

Set the USE_SPI macro to 0 is SPI is not hooked up to the FGPA.

## Usage: 
1. Copy Input.bin onto an SD card
2. Insert SD card into Teensy
3. Flash code onto teensy with Arduino IDE if not done yet.
4. Open serial monitor on Arduino IDE
5. You can then control the Teensy with the following commands:

- OPUS: Commands the Teensy to Opus mode:
	- on transmit it will encode Input.bin with the opus codec
	- on receive it will decode the rx data with the opus codec and write to an out bin file (file name will be printed on serial log)

- BERT: Commands the Teensy to Bit Error Rate Test mode:
	- on transmit it will send a fixed bit pattern
	- on receive it will check for bit errors with the configured pattern on write the results to BERT.txt

	- The following patterns can be entered:
		- MK - all ones
		- SP - all zeroes
		- ONE_ONE - repeating 1 followed by 0 pattern
		- ONE_SEVEN - repeating 1 followed by seven zeroes pattern
		- ONE_FIFTEEN - repeating 1 followed by fifteen zeroes pattern
		- PRBS_63 - PRBS with k=6
		- PRBS_127 - PRBS with k=7
- TRX: Commands the Teensy to transmit and then receive what it transmitted
- TX: Commands the Teensy to transmit
- RX: Commands the Teesny to receive
- CANCEL: If a TX/RX operation is active, this will cancel out of it
