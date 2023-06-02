# audio_input

This directory contains SystemVerilog modules and testbenches for PDM audio decimator to PCM.  PCM samples are available over I2S controller as well as SPI.  

* hb_filter.sv - 27-tap half band filter
* polyphase_ds_decim.sv -- 48-tap polyphase decimate by 12 filter.  Uses '[fred] harris' sigma-delta decimation architecture
<img src="./images/revdwg3.png" width="800" height="313">
