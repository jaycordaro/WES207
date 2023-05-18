
# Efinity Interface Designer SDC
# Version: 2022.2.322
# Date: 2023-05-17 20:27

# Copyright (C) 2017 - 2022 Efinix Inc. All rights reserved.

# Device: T20F256
# Project: WES207_basic
# Timing Model: I4 (final)

# PLL Constraints
#################
create_clock -period 15.6098 pll_clk
create_clock -waveform {3.9024 11.7073} -period 15.6098 tx_fastclk
create_clock -period 15.6098 tx_slowclk

# GPIO Constraints
####################
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {INPUT_CLK}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {INPUT_CLK}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {MOSI}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {MOSI}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {reset_n}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {reset_n}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {SCLK}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {SCLK}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {SSB}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {SSB}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[0]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[0]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[1]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[1]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[2]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[2]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[3]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[3]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[4]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[4]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[5]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[5]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {gpo_pins[6]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {gpo_pins[6]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led0}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led0}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {MISO}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {MISO}]

# LVDS Tx Constraints
####################
set_output_delay -clock tx_slowclk -max -4.030 [get_ports {lvds_tx_inst1_DATA[1] lvds_tx_inst1_DATA[0]}]
set_output_delay -clock tx_slowclk -min -2.135 [get_ports {lvds_tx_inst1_DATA[1] lvds_tx_inst1_DATA[0]}]
