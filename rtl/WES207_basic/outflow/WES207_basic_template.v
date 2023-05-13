
// Efinity Top-level template
// Version: 2022.2.322.4.7
// Date: 2023-05-12 18:49

// Copyright (C) 2017 - 2022 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as C:\Efinity\2022.2\project\WES207_basic\WES207_basic.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  WES207_basic
//     #4)  Insert design content.


module WES207_basic
(
  input INPUT_CLK,
  input MOSI,
  input SCLK,
  input SSB,
  input reset_n,
  input pll_clk,
  input tx_fastclk,
  input tx_slowclk,
  output MISO,
  output [6:0] gpo_pins,
  output led0,
  output led1,
  output [1:0] lvds_tx_inst1_DATA
);


endmodule

