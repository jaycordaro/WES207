# RF Push-to-talk Test
Demo of enabling and disabling output from the RF board via SPI.

## Usage
- Code is for Arduino IDE with Teensy 4.1 board 
  for Push-To-Talk functionality of the Wakie-Talkie.
- It sets A17 pin as analog input.
- The default state is Rx. 
- If the pin senses more than 800 by spi reading it swaps to Tx mode.
