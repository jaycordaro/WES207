# WES207
Repo for our WES207 project, a Walkie Talkie using 802.15.4 with Opus Codec

## Component Connections:
### Teensy to FPGA
The Teensy and FPGA communicate over an SPI interface:  
Name | Teensy Pin | FPGA Pin 
--- | --- | --- 
CS | 0 | 27
MISO | 1 | 28
MOSI | 26 | 30
SCK | 27 | 29  

Also connect a ground between the boards.  

### Teensy to RF board
The Teensy and RF board communicate over an SPI interface.  
The RF board's pinout is described here: http://atmel-studio-doc.s3-website-us-east-1.amazonaws.com/webhelp/GUID-48EF8A2C-BED0-4DC2-B36A-38E99440A4F8-en-US-1/index.html?GUID-06EB0063-0126-41F7-B6C9-CEAB087F6BAC

Name | Teensy Pin | RF board Pin 
--- | --- | --- 
CS | 10 | 15
MISO | 12 | 17
MOSI | 11 | 16
SCK | 13 | 18
POWER | 3.3V | 19
GND | GND | 20
