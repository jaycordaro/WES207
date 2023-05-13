
//
// Verific Verilog Description of module WES207_top
//

module WES207_top (pll_clk, reset_n, tx_slowclk, led0, led1, SCLK, 
            SSB, MOSI, MISO, gpo_pins, lvds_tx_inst1_DATA);
    input pll_clk /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input reset_n /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input tx_slowclk /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    output led0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    output led1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    input SCLK /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input SSB /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input MOSI /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    output MISO /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    output [6:0]gpo_pins /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    output [1:0]lvds_tx_inst1_DATA /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    
    
    wire \reg_addr[2] , \spi_slave_inst/bitcnt[2] , \spi_slave_inst/bitcnt[1] , 
        \spi_slave_inst/sync_tx_en[1] , \reg_addr[1] , \spi_slave_inst/bitcnt[0] , 
        \spi_slave_inst/sync_mosi[1] , n17, n18, rw_out, \reg_addr[0] , 
        \spi_slave_inst/d_o[0] , \rx_d[0] , addr_dv, rxdv, \spi_slave_inst/sync_sclk[0] , 
        \spi_slave_inst/bitcnt[4] , \spi_slave_inst/bitcnt[3] , \spi_slave_inst/sync_ss[0] , 
        \spi_slave_inst/d_o[1] , \spi_slave_inst/d_o[2] , \spi_slave_inst/d_o[3] , 
        \spi_slave_inst/d_o[4] , \spi_slave_inst/d_o[5] , \spi_slave_inst/d_o[6] , 
        \spi_slave_inst/d_o[7] , \rx_d[1] , \rx_d[2] , \rx_d[3] , \rx_d[4] , 
        \rx_d[5] , \rx_d[6] , \rx_d[7] , \spi_slave_inst/sync_sclk[1] , 
        \spi_slave_inst/sync_sclk[2] , \spi_slave_inst/sync_ss[1] , \spi_slave_inst/sync_ss[2] , 
        \data_from_led[7] , \data_from_led[6] , \data_from_led[5] , \data_from_led[4] , 
        \data_from_led[3] , \data_from_led[0] , \data_from_led[2] , \data_from_led[1] , 
        \led_inst/counter[0] , \led_inst/ctr_cfg_reg[0] , \led_inst/counter[1] , 
        \led_inst/counter[2] , \led_inst/counter[3] , \led_inst/counter[4] , 
        \led_inst/counter[5] , \led_inst/counter[6] , \led_inst/counter[7] , 
        \led_inst/counter[8] , \led_inst/counter[9] , \led_inst/counter[10] , 
        \led_inst/counter[11] , \led_inst/counter[12] , \led_inst/counter[13] , 
        \led_inst/counter[14] , \led_inst/counter[15] , \led_inst/counter[16] , 
        \led_inst/counter[17] , \led_inst/counter[18] , \led_inst/counter[19] , 
        \led_inst/counter[20] , \led_inst/counter[21] , \led_inst/counter[22] , 
        \led_inst/counter[23] , \led_inst/ctr_cfg_reg[1] , \led_inst/ctr_cfg_reg[2] , 
        \led_inst/ctr_cfg_reg[3] , \led_inst/ctr_cfg_reg[4] , \led_inst/ctr_cfg_reg[5] , 
        \led_inst/ctr_cfg_reg[6] , \led_inst/ctr_cfg_reg[7] , \gpo_inst/gp_config_reg[0] , 
        \gpo_inst/gp_config_reg[1] , \gpo_inst/gp_config_reg[2] , \gpo_inst/gp_config_reg[3] , 
        \gpo_inst/gp_config_reg[4] , \gpo_inst/gp_config_reg[5] , \gpo_inst/gp_config_reg[6] , 
        \gpo_inst/gp_config_reg[7] , n98, n99, n100, n101, n102, 
        n103, n104, n105, n106, n107, n108, n109, n110, n111, 
        n112, n113, n114, n115, n116, n117, n118, \tx_dac_fsm_inst/sym_ctr[0] , 
        n120, n121, n122, \tx_dac_fsm_inst/sym_pos[0] , \tx_dac_fsm_inst/state_reg[0] , 
        n125, n126, n127, n128, n129, n130, n131, \tx_dac_fsm_inst/sym_ctr[1] , 
        \tx_dac_fsm_inst/sym_ctr[2] , \tx_dac_fsm_inst/sym_ctr[3] , n135, 
        n136, n137, n138, n139, n140, n141, n142, n143, \tx_dac_fsm_inst/zctr[0] , 
        n145, n146, n147, n148, n149, n150, \tx_dac_fsm_inst/sym_ctr[4] , 
        n152, n153, \tx_dac_fsm_inst/dctr[0] , n155, n156, \tx_dac_fsm_inst/dac_config_reg[0] , 
        n158, n159, \tx_dac_fsm_inst/sym_pos[1] , \tx_dac_fsm_inst/sym_pos[2] , 
        \tx_dac_fsm_inst/sym_pos[3] , \tx_dac_fsm_inst/state_reg[1] , \tx_dac_fsm_inst/state_reg[2] , 
        \tx_dac_fsm_inst/state_reg[3] , n166, n167, n168, n169, n170, 
        n171, n172, n173, \tx_dac_fsm_inst/zctr[1] , \tx_dac_fsm_inst/zctr[2] , 
        \tx_dac_fsm_inst/zctr[3] , \tx_dac_fsm_inst/zctr[4] , \tx_dac_fsm_inst/zctr[5] , 
        \tx_dac_fsm_inst/dctr[1] , \tx_dac_fsm_inst/dctr[2] , \tx_dac_fsm_inst/dctr[3] , 
        \tx_dac_fsm_inst/dctr[4] , \tx_dac_fsm_inst/dctr[5] , n184, n185, 
        n186, n187, n188, n189, n190, n191, n192, n193, n194, 
        n195, n196, n197, n198, n199, n200, n201, n202, n203, 
        n204, n205, n206, \spi_slave_inst/n96 , ceg_net5, \spi_slave_inst/n56 , 
        ceg_net37, \spi_slave_inst/n57 , \spi_slave_inst/sync_tx_en[0] , 
        \spi_slave_inst/n97 , tx_en, \spi_slave_inst/n58 , \spi_slave_inst/sync_mosi[0] , 
        \spi_slave_inst/n73 , ceg_net20, \spi_slave_inst/n98 , \spi_slave_inst/n139 , 
        ceg_net77, ceg_net98, \spi_slave_inst/n68 , ceg_net31, ceg_net34, 
        \spi_slave_inst/n54 , \spi_slave_inst/n55 , \spi_slave_inst/n138 , 
        \spi_slave_inst/n137 , \spi_slave_inst/n136 , \spi_slave_inst/n135 , 
        \spi_slave_inst/n134 , \spi_slave_inst/n133 , \spi_slave_inst/n132 , 
        \spi_slave_inst/n173 , \spi_slave_inst/n172 , \spi_slave_inst/n171 , 
        \spi_slave_inst/n170 , \spi_slave_inst/n169 , \spi_slave_inst/n168 , 
        \spi_slave_inst/n167 , \led_inst/n41 , \led_inst/n42 , \led_inst/n43 , 
        \led_inst/n44 , \led_inst/n45 , \led_inst/n48 , \led_inst/n46 , 
        \led_inst/n47 , \led_inst/n142 , \data_to_led[0] , rx_en_led, 
        \led_inst/LessThan_21/n48 , \led_inst/n141 , \led_inst/n140 , 
        \led_inst/n139 , \led_inst/n138 , \led_inst/n137 , \led_inst/n136 , 
        \led_inst/n135 , \led_inst/n134 , \led_inst/n133 , \led_inst/n132 , 
        \led_inst/n131 , \led_inst/n130 , \led_inst/n129 , \led_inst/n128 , 
        \led_inst/n127 , \led_inst/n126 , \led_inst/n125 , \led_inst/n124 , 
        \led_inst/n123 , \led_inst/n122 , \led_inst/n121 , \led_inst/n120 , 
        \led_inst/n119 , \data_to_led[1] , \data_to_led[2] , \data_to_led[3] , 
        \data_to_led[4] , \data_to_led[5] , \data_to_led[6] , \data_to_led[7] , 
        \data_to_gpo[0] , rx_en_gpo, \data_to_gpo[1] , \data_to_gpo[2] , 
        \data_to_gpo[3] , \data_to_gpo[4] , \data_to_gpo[5] , \data_to_gpo[6] , 
        \data_to_gpo[7] , n322, n330, n334, \tx_dac_fsm_inst/n68 , 
        \tx_dac_fsm_inst/n42 , \tx_dac_fsm_inst/n344 , n356, n357, \tx_dac_fsm_inst/n67 , 
        \tx_dac_fsm_inst/n66 , \tx_dac_fsm_inst/n65 , n367, n368, n371, 
        n372, \tx_dac_fsm_inst/n258 , \tx_dac_fsm_inst/n64 , \tx_dac_fsm_inst/n284 , 
        data_to_dac, rx_en_dac, \~tx_dac_fsm_inst/n431 , \~tx_dac_fsm_inst/n436 , 
        \~tx_dac_fsm_inst/n441 , n396, n397, n398, n403, \tx_dac_fsm_inst/n257 , 
        \tx_dac_fsm_inst/n256 , \tx_dac_fsm_inst/n255 , \tx_dac_fsm_inst/n254 , 
        \tx_dac_fsm_inst/n253 , \tx_dac_fsm_inst/n283 , \tx_dac_fsm_inst/n282 , 
        \tx_dac_fsm_inst/n281 , \tx_dac_fsm_inst/n280 , \tx_dac_fsm_inst/n279 , 
        \pll_clk~O , \tx_slowclk~O , n489, n488, n487, n486, n485, 
        n438, n439, n440, n441, n442, n443, n444, n445, n446, 
        n447, n448, n449, n450, n451, n452, n453, n454, n455, 
        n456, n457, n458, n459, n460, n461, n462, n463, n464, 
        n465, n466, n467, n468, n469, n470, n471, n472, n473, 
        n474, n475, n476, n477, n478, n479, n480, n481, n482, 
        n483, n484;
    
    EFX_LUT4 \tx_dac_fsm_inst/dlatchrs_162/i1  (.I0(n356), .I1(n129), .I2(n357), 
            .O(n129)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/dlatchrs_162/i1 .LUTMASK = 16'hacac;
    EFX_LUT4 \tx_dac_fsm_inst/i116  (.I0(n367), .I1(n139), .I2(n368), 
            .O(n139)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/i116 .LUTMASK = 16'hacac;
    EFX_FF \reg_addr[2]~FF  (.D(\spi_slave_inst/n96 ), .CE(ceg_net5), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\reg_addr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(114)
    defparam \reg_addr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \reg_addr[2]~FF .CE_POLARITY = 1'b0;
    defparam \reg_addr[2]~FF .SR_POLARITY = 1'b0;
    defparam \reg_addr[2]~FF .D_POLARITY = 1'b1;
    defparam \reg_addr[2]~FF .SR_SYNC = 1'b0;
    defparam \reg_addr[2]~FF .SR_VALUE = 1'b0;
    defparam \reg_addr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[2]~FF  (.D(\spi_slave_inst/n56 ), .CE(ceg_net37), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[2]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[1]~FF  (.D(\spi_slave_inst/n57 ), .CE(ceg_net37), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[1]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_tx_en[1]~FF  (.D(\spi_slave_inst/sync_tx_en[0] ), 
           .CE(1'b1), .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_tx_en[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_tx_en[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \reg_addr[1]~FF  (.D(\spi_slave_inst/n97 ), .CE(ceg_net5), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\reg_addr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(114)
    defparam \reg_addr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \reg_addr[1]~FF .CE_POLARITY = 1'b0;
    defparam \reg_addr[1]~FF .SR_POLARITY = 1'b0;
    defparam \reg_addr[1]~FF .D_POLARITY = 1'b1;
    defparam \reg_addr[1]~FF .SR_SYNC = 1'b0;
    defparam \reg_addr[1]~FF .SR_VALUE = 1'b0;
    defparam \reg_addr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_tx_en[0]_2~FF  (.D(tx_en), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_tx_en[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[0]~FF  (.D(\spi_slave_inst/n58 ), .CE(ceg_net37), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[0]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_mosi[1]~FF  (.D(\spi_slave_inst/sync_mosi[0] ), 
           .CE(1'b1), .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_mosi[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_mosi[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_mosi[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rw_out~FF  (.D(\spi_slave_inst/n73 ), .CE(ceg_net20), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(rw_out)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(103)
    defparam \rw_out~FF .CLK_POLARITY = 1'b1;
    defparam \rw_out~FF .CE_POLARITY = 1'b0;
    defparam \rw_out~FF .SR_POLARITY = 1'b0;
    defparam \rw_out~FF .D_POLARITY = 1'b1;
    defparam \rw_out~FF .SR_SYNC = 1'b0;
    defparam \rw_out~FF .SR_VALUE = 1'b0;
    defparam \rw_out~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \reg_addr[0]~FF  (.D(\spi_slave_inst/n98 ), .CE(ceg_net5), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\reg_addr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(114)
    defparam \reg_addr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \reg_addr[0]~FF .CE_POLARITY = 1'b0;
    defparam \reg_addr[0]~FF .SR_POLARITY = 1'b0;
    defparam \reg_addr[0]~FF .D_POLARITY = 1'b1;
    defparam \reg_addr[0]~FF .SR_SYNC = 1'b0;
    defparam \reg_addr[0]~FF .SR_VALUE = 1'b0;
    defparam \reg_addr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[0]~FF  (.D(\spi_slave_inst/n139 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[0]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[0]~FF  (.D(\spi_slave_inst/n98 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[0]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[0]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[0]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[0]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[0]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[0]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \addr_dv~FF  (.D(\spi_slave_inst/n68 ), .CE(ceg_net31), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(addr_dv)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(155)
    defparam \addr_dv~FF .CLK_POLARITY = 1'b1;
    defparam \addr_dv~FF .CE_POLARITY = 1'b0;
    defparam \addr_dv~FF .SR_POLARITY = 1'b0;
    defparam \addr_dv~FF .D_POLARITY = 1'b0;
    defparam \addr_dv~FF .SR_SYNC = 1'b0;
    defparam \addr_dv~FF .SR_VALUE = 1'b0;
    defparam \addr_dv~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rxdv~FF  (.D(\spi_slave_inst/n68 ), .CE(ceg_net34), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(rxdv)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(165)
    defparam \rxdv~FF .CLK_POLARITY = 1'b1;
    defparam \rxdv~FF .CE_POLARITY = 1'b0;
    defparam \rxdv~FF .SR_POLARITY = 1'b0;
    defparam \rxdv~FF .D_POLARITY = 1'b0;
    defparam \rxdv~FF .SR_SYNC = 1'b0;
    defparam \rxdv~FF .SR_VALUE = 1'b0;
    defparam \rxdv~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_sclk[0]~FF  (.D(SCLK), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_sclk[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_sclk[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[0]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_sclk[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[4]~FF  (.D(\spi_slave_inst/n54 ), .CE(ceg_net37), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[4]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[3]~FF  (.D(\spi_slave_inst/n55 ), .CE(ceg_net37), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[3]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_mosi[0]_2~FF  (.D(MOSI), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_mosi[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_ss[0]~FF  (.D(SSB), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_ss[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_ss[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_ss[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_VALUE = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[1]~FF  (.D(\spi_slave_inst/n138 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[1]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[2]~FF  (.D(\spi_slave_inst/n137 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[2]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[3]~FF  (.D(\spi_slave_inst/n136 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[3]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[3]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[3]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[4]~FF  (.D(\spi_slave_inst/n135 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[4]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[4]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[4]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[5]~FF  (.D(\spi_slave_inst/n134 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[5]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[5]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[5]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[6]~FF  (.D(\spi_slave_inst/n133 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[6]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[6]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[6]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[7]~FF  (.D(\spi_slave_inst/n132 ), .CE(ceg_net77), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[7]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[7]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[7]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[1]~FF  (.D(\spi_slave_inst/n173 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[1]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[1]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[1]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[1]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[1]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[1]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[2]~FF  (.D(\spi_slave_inst/n172 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[2]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[2]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[2]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[2]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[2]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[2]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[3]~FF  (.D(\spi_slave_inst/n171 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[3]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[3]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[3]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[3]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[3]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[3]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[4]~FF  (.D(\spi_slave_inst/n170 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[4]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[4]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[4]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[4]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[4]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[4]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[5]~FF  (.D(\spi_slave_inst/n169 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[5]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[5]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[5]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[5]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[5]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[5]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[6]~FF  (.D(\spi_slave_inst/n168 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[6]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[6]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[6]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[6]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[6]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[6]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[7]~FF  (.D(\spi_slave_inst/n167 ), .CE(ceg_net98), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\rx_d[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[7]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[7]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[7]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[7]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[7]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[7]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_sclk[1]~FF  (.D(\spi_slave_inst/sync_sclk[0] ), 
           .CE(1'b1), .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_sclk[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_sclk[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_sclk[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_sclk[2]~FF  (.D(\spi_slave_inst/sync_sclk[1] ), 
           .CE(1'b1), .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_sclk[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_sclk[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[2]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_sclk[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_ss[1]~FF  (.D(\spi_slave_inst/sync_ss[0] ), 
           .CE(1'b1), .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_ss[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_ss[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_ss[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_VALUE = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_ss[2]~FF  (.D(\spi_slave_inst/sync_ss[1] ), 
           .CE(1'b1), .CLK(\pll_clk~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_ss[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_ss[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_ss[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_VALUE = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[7]~FF  (.D(\led_inst/n41 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[7]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[7]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[7]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[7]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[7]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[7]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[6]~FF  (.D(\led_inst/n42 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[6]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[6]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[6]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[6]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[6]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[6]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[5]~FF  (.D(\led_inst/n43 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[5]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[5]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[5]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[5]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[5]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[5]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[4]~FF  (.D(\led_inst/n44 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[4]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[4]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[4]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[4]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[4]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[4]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[3]~FF  (.D(\led_inst/n45 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[3]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[3]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[3]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[3]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[3]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[3]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[0]~FF  (.D(\led_inst/n48 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[0]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[0]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[0]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[0]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[0]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[0]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[2]~FF  (.D(\led_inst/n46 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[2]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[2]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[2]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[2]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[2]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[2]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[1]~FF  (.D(\led_inst/n47 ), .CE(1'b0), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\data_from_led[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[1]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[1]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[1]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[1]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[1]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[1]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[0]~FF  (.D(\led_inst/n142 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[0]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[0]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[0]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[0]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[0]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[0]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[0]~FF  (.D(\data_to_led[0] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[0]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led0~FF  (.D(led0), .CE(\led_inst/LessThan_21/n48 ), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(led0)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led0~FF .CLK_POLARITY = 1'b1;
    defparam \led0~FF .CE_POLARITY = 1'b1;
    defparam \led0~FF .SR_POLARITY = 1'b0;
    defparam \led0~FF .D_POLARITY = 1'b0;
    defparam \led0~FF .SR_SYNC = 1'b0;
    defparam \led0~FF .SR_VALUE = 1'b0;
    defparam \led0~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led1~FF  (.D(led0), .CE(\led_inst/LessThan_21/n48 ), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(led1)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led1~FF .CLK_POLARITY = 1'b1;
    defparam \led1~FF .CE_POLARITY = 1'b1;
    defparam \led1~FF .SR_POLARITY = 1'b0;
    defparam \led1~FF .D_POLARITY = 1'b1;
    defparam \led1~FF .SR_SYNC = 1'b0;
    defparam \led1~FF .SR_VALUE = 1'b1;
    defparam \led1~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[1]~FF  (.D(\led_inst/n141 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[1]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[1]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[1]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[1]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[1]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[1]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[2]~FF  (.D(\led_inst/n140 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[2]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[2]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[2]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[2]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[2]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[2]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[3]~FF  (.D(\led_inst/n139 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[3]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[3]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[3]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[3]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[3]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[3]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[4]~FF  (.D(\led_inst/n138 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[4]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[4]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[4]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[4]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[4]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[4]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[5]~FF  (.D(\led_inst/n137 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[5]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[5]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[5]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[5]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[5]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[5]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[6]~FF  (.D(\led_inst/n136 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[6]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[6]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[6]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[6]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[6]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[6]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[7]~FF  (.D(\led_inst/n135 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[7]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[7]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[7]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[7]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[7]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[7]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[8]~FF  (.D(\led_inst/n134 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[8]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[8]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[8]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[8]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[8]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[8]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[9]~FF  (.D(\led_inst/n133 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[9]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[9]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[9]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[9]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[9]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[9]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[10]~FF  (.D(\led_inst/n132 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[10]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[10]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[10]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[10]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[10]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[10]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[11]~FF  (.D(\led_inst/n131 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[11] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[11]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[11]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[11]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[11]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[11]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[11]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[12]~FF  (.D(\led_inst/n130 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[12] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[12]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[12]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[12]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[12]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[12]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[12]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[13]~FF  (.D(\led_inst/n129 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[13] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[13]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[13]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[13]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[13]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[13]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[13]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[14]~FF  (.D(\led_inst/n128 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[14] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[14]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[14]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[14]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[14]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[14]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[14]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[15]~FF  (.D(\led_inst/n127 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[15] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[15]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[15]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[15]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[15]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[15]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[15]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[16]~FF  (.D(\led_inst/n126 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[16] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[16]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[16]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[16]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[16]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[16]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[16]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[16]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[17]~FF  (.D(\led_inst/n125 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[17] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[17]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[17]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[17]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[17]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[17]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[17]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[17]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[18]~FF  (.D(\led_inst/n124 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[18] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[18]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[18]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[18]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[18]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[18]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[18]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[18]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[19]~FF  (.D(\led_inst/n123 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[19] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[19]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[19]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[19]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[19]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[19]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[19]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[19]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[20]~FF  (.D(\led_inst/n122 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[20] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[20]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[20]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[20]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[20]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[20]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[20]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[20]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[21]~FF  (.D(\led_inst/n121 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[21] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[21]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[21]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[21]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[21]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[21]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[21]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[21]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[22]~FF  (.D(\led_inst/n120 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[22] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[22]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[22]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[22]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[22]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[22]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[22]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[22]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[23]~FF  (.D(\led_inst/n119 ), .CE(1'b1), .CLK(\pll_clk~O ), 
           .SR(reset_n), .Q(\led_inst/counter[23] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[23]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[23]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[23]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[23]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[23]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[23]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[23]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[1]~FF  (.D(\data_to_led[1] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[1]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[1]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[2]~FF  (.D(\data_to_led[2] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[2]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[3]~FF  (.D(\data_to_led[3] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[3]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[4]~FF  (.D(\data_to_led[4] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[4]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[4]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[5]~FF  (.D(\data_to_led[5] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[5]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[5]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[5]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[6]~FF  (.D(\data_to_led[6] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[6]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[6]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[7]~FF  (.D(\data_to_led[7] ), .CE(rx_en_led), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[7]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[7]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[7]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[0]~FF  (.D(\data_to_gpo[0] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[0]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[0]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[1]~FF  (.D(\data_to_gpo[1] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[1]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[1]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[2]~FF  (.D(\data_to_gpo[2] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[2]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[2]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[3]~FF  (.D(\data_to_gpo[3] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[3]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[3]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[4]~FF  (.D(\data_to_gpo[4] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[4]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[4]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[4]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[5]~FF  (.D(\data_to_gpo[5] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[5]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[5]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[5]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[6]~FF  (.D(\data_to_gpo[6] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[6]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[6]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[6]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[7]~FF  (.D(\data_to_gpo[7] ), .CE(rx_en_gpo), 
           .CLK(\pll_clk~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[7]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[7]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[7]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_ctr[0]~FF  (.D(\tx_dac_fsm_inst/n68 ), .CE(\tx_dac_fsm_inst/n42 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_ctr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_pos[0]~FF  (.D(\tx_dac_fsm_inst/sym_pos[0] ), 
           .CE(\tx_dac_fsm_inst/n344 ), .CLK(\tx_slowclk~O ), .SR(reset_n), 
           .Q(\tx_dac_fsm_inst/sym_pos[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .D_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/state_reg[0]~FF  (.D(n129), .CE(1'b1), .CLK(\tx_slowclk~O ), 
           .SR(reset_n), .Q(\tx_dac_fsm_inst/state_reg[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(113)
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_ctr[1]~FF  (.D(\tx_dac_fsm_inst/n67 ), .CE(\tx_dac_fsm_inst/n42 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_ctr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_ctr[2]~FF  (.D(\tx_dac_fsm_inst/n66 ), .CE(\tx_dac_fsm_inst/n42 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_ctr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_ctr[3]~FF  (.D(\tx_dac_fsm_inst/n65 ), .CE(\tx_dac_fsm_inst/n42 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_ctr[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/zctr[0]~FF  (.D(\tx_dac_fsm_inst/n258 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/zctr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(200)
    defparam \tx_dac_fsm_inst/zctr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[0]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[0]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[0]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[0]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[0]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_ctr[4]~FF  (.D(\tx_dac_fsm_inst/n64 ), .CE(\tx_dac_fsm_inst/n42 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_ctr[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_ctr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dctr[0]~FF  (.D(\tx_dac_fsm_inst/n284 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dctr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(211)
    defparam \tx_dac_fsm_inst/dctr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[0]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[0]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[0]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[0]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[0]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dac_config_reg[0]~FF  (.D(data_to_dac), .CE(rx_en_dac), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dac_config_reg[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(51)
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dac_config_reg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_pos[1]~FF  (.D(\~tx_dac_fsm_inst/n431 ), .CE(\tx_dac_fsm_inst/n344 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_pos[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_pos[2]~FF  (.D(\~tx_dac_fsm_inst/n436 ), .CE(\tx_dac_fsm_inst/n344 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_pos[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/sym_pos[3]~FF  (.D(\~tx_dac_fsm_inst/n441 ), .CE(\tx_dac_fsm_inst/n344 ), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/sym_pos[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(103)
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/sym_pos[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/state_reg[1]~FF  (.D(n166), .CE(1'b1), .CLK(\tx_slowclk~O ), 
           .SR(reset_n), .Q(\tx_dac_fsm_inst/state_reg[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(113)
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/state_reg[2]~FF  (.D(n167), .CE(1'b1), .CLK(\tx_slowclk~O ), 
           .SR(reset_n), .Q(\tx_dac_fsm_inst/state_reg[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(113)
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/state_reg[3]~FF  (.D(n168), .CE(1'b1), .CLK(\tx_slowclk~O ), 
           .SR(reset_n), .Q(\tx_dac_fsm_inst/state_reg[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(113)
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/state_reg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/zctr[1]~FF  (.D(\tx_dac_fsm_inst/n257 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/zctr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(200)
    defparam \tx_dac_fsm_inst/zctr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[1]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[1]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[1]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[1]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[1]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/zctr[2]~FF  (.D(\tx_dac_fsm_inst/n256 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/zctr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(200)
    defparam \tx_dac_fsm_inst/zctr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[2]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[2]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[2]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[2]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[2]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/zctr[3]~FF  (.D(\tx_dac_fsm_inst/n255 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/zctr[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(200)
    defparam \tx_dac_fsm_inst/zctr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[3]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[3]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[3]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[3]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[3]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/zctr[4]~FF  (.D(\tx_dac_fsm_inst/n254 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/zctr[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(200)
    defparam \tx_dac_fsm_inst/zctr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[4]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[4]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[4]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[4]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[4]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/zctr[5]~FF  (.D(\tx_dac_fsm_inst/n253 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/zctr[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(200)
    defparam \tx_dac_fsm_inst/zctr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[5]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[5]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[5]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/zctr[5]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[5]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/zctr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dctr[1]~FF  (.D(\tx_dac_fsm_inst/n283 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dctr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(211)
    defparam \tx_dac_fsm_inst/dctr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[1]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[1]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[1]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[1]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[1]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dctr[2]~FF  (.D(\tx_dac_fsm_inst/n282 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dctr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(211)
    defparam \tx_dac_fsm_inst/dctr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[2]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[2]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[2]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[2]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[2]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dctr[3]~FF  (.D(\tx_dac_fsm_inst/n281 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dctr[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(211)
    defparam \tx_dac_fsm_inst/dctr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[3]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[3]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[3]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[3]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[3]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dctr[4]~FF  (.D(\tx_dac_fsm_inst/n280 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dctr[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(211)
    defparam \tx_dac_fsm_inst/dctr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[4]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[4]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[4]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[4]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[4]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \tx_dac_fsm_inst/dctr[5]~FF  (.D(\tx_dac_fsm_inst/n279 ), .CE(1'b1), 
           .CLK(\tx_slowclk~O ), .SR(reset_n), .Q(\tx_dac_fsm_inst/dctr[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(211)
    defparam \tx_dac_fsm_inst/dctr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[5]~FF .CE_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[5]~FF .SR_POLARITY = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[5]~FF .D_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/dctr[5]~FF .SR_SYNC = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[5]~FF .SR_VALUE = 1'b0;
    defparam \tx_dac_fsm_inst/dctr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_LUT4 \tx_dac_fsm_inst/i119  (.I0(n371), .I1(n142), .I2(n368), 
            .O(n142)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/i119 .LUTMASK = 16'hacac;
    EFX_LUT4 \tx_dac_fsm_inst/dlatchrs_164/i1  (.I0(n372), .I1(n143), .I2(n368), 
            .O(n143)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/dlatchrs_164/i1 .LUTMASK = 16'hacac;
    EFX_LUT4 \tx_dac_fsm_inst/dlatchrs_162/i2  (.I0(n396), .I1(n166), .I2(n357), 
            .O(n166)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/dlatchrs_162/i2 .LUTMASK = 16'hacac;
    EFX_LUT4 \tx_dac_fsm_inst/dlatchrs_162/i3  (.I0(n397), .I1(n167), .I2(n357), 
            .O(n167)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/dlatchrs_162/i3 .LUTMASK = 16'hacac;
    EFX_LUT4 \tx_dac_fsm_inst/dlatchrs_162/i4  (.I0(n398), .I1(n168), .I2(n357), 
            .O(n168)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/dlatchrs_162/i4 .LUTMASK = 16'hacac;
    EFX_LUT4 \tx_dac_fsm_inst/dlatchrs_164/i2  (.I0(n403), .I1(n173), .I2(n368), 
            .O(n173)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam \tx_dac_fsm_inst/dlatchrs_164/i2 .LUTMASK = 16'hacac;
    EFX_LUT4 LUT__642 (.I0(\spi_slave_inst/bitcnt[4] ), .I1(\spi_slave_inst/bitcnt[3] ), 
            .O(n438)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__642.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__643 (.I0(n438), .I1(\spi_slave_inst/d_o[7] ), .I2(rw_out), 
            .O(MISO)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__643.LUTMASK = 16'h4040;
    EFX_ADD \led_inst/add_23/i2  (.I0(\led_inst/counter[1] ), .I1(\led_inst/counter[0] ), 
            .CI(1'b0), .O(n17), .CO(n18)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i2 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_136/i6  (.I0(\tx_dac_fsm_inst/dctr[5] ), 
            .I1(1'b0), .CI(n100), .O(n98)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(208)
    defparam \tx_dac_fsm_inst/add_136/i6 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_136/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_136/i5  (.I0(\tx_dac_fsm_inst/dctr[4] ), 
            .I1(1'b0), .CI(n102), .O(n99), .CO(n100)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(208)
    defparam \tx_dac_fsm_inst/add_136/i5 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_136/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_136/i4  (.I0(\tx_dac_fsm_inst/dctr[3] ), 
            .I1(1'b0), .CI(n485), .O(n101), .CO(n102)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(208)
    defparam \tx_dac_fsm_inst/add_136/i4 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_136/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_136/i3  (.I0(\tx_dac_fsm_inst/dctr[2] ), 
            .I1(1'b0), .CI(n153), .O(n103)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(208)
    defparam \tx_dac_fsm_inst/add_136/i3 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_136/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_129/i6  (.I0(\tx_dac_fsm_inst/zctr[5] ), 
            .I1(1'b0), .CI(n106), .O(n104)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(197)
    defparam \tx_dac_fsm_inst/add_129/i6 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_129/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_129/i5  (.I0(\tx_dac_fsm_inst/zctr[4] ), 
            .I1(1'b0), .CI(n108), .O(n105), .CO(n106)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(197)
    defparam \tx_dac_fsm_inst/add_129/i5 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_129/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_129/i4  (.I0(\tx_dac_fsm_inst/zctr[3] ), 
            .I1(1'b0), .CI(n486), .O(n107), .CO(n108)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(197)
    defparam \tx_dac_fsm_inst/add_129/i4 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_129/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_129/i3  (.I0(\tx_dac_fsm_inst/zctr[2] ), 
            .I1(1'b0), .CI(n150), .O(n109)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(197)
    defparam \tx_dac_fsm_inst/add_129/i3 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_129/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/sub_20/add_2/i5  (.I0(\tx_dac_fsm_inst/sym_ctr[4] ), 
            .I1(1'b0), .CI(n487), .O(n110)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(97)
    defparam \tx_dac_fsm_inst/sub_20/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sub_20/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/sub_20/add_2/i4  (.I0(\tx_dac_fsm_inst/sym_ctr[3] ), 
            .I1(1'b1), .CI(n488), .O(n111)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(97)
    defparam \tx_dac_fsm_inst/sub_20/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/sub_20/add_2/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_18/i5  (.I0(\tx_dac_fsm_inst/sym_ctr[4] ), 
            .I1(1'b0), .CI(n114), .O(n112)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(95)
    defparam \tx_dac_fsm_inst/add_18/i5 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_18/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_18/i4  (.I0(\tx_dac_fsm_inst/sym_ctr[3] ), 
            .I1(1'b0), .CI(n116), .O(n113), .CO(n114)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(95)
    defparam \tx_dac_fsm_inst/add_18/i4 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_18/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_18/i3  (.I0(\tx_dac_fsm_inst/sym_ctr[2] ), 
            .I1(1'b0), .CI(n118), .O(n115), .CO(n116)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(95)
    defparam \tx_dac_fsm_inst/add_18/i3 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_18/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_18/i2  (.I0(\tx_dac_fsm_inst/sym_ctr[1] ), 
            .I1(1'b1), .CI(n489), .O(n117), .CO(n118)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(95)
    defparam \tx_dac_fsm_inst/add_18/i2 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_18/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i24  (.I0(\led_inst/counter[23] ), .I1(1'b0), 
            .CI(n122), .O(n120)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i24 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i24 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i23  (.I0(\led_inst/counter[22] ), .I1(1'b0), 
            .CI(n126), .O(n121), .CO(n122)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i23 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i23 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i22  (.I0(\led_inst/counter[21] ), .I1(1'b0), 
            .CI(n128), .O(n125), .CO(n126)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i22 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i22 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i21  (.I0(\led_inst/counter[20] ), .I1(1'b0), 
            .CI(n131), .O(n127), .CO(n128)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i21 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i21 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i20  (.I0(\led_inst/counter[19] ), .I1(1'b0), 
            .CI(n136), .O(n130), .CO(n131)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i20 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i20 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i19  (.I0(\led_inst/counter[18] ), .I1(1'b0), 
            .CI(n138), .O(n135), .CO(n136)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i19 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i19 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i18  (.I0(\led_inst/counter[17] ), .I1(1'b0), 
            .CI(n141), .O(n137), .CO(n138)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i18 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i18 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i17  (.I0(\led_inst/counter[16] ), .I1(1'b0), 
            .CI(n146), .O(n140), .CO(n141)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i17 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i17 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i16  (.I0(\led_inst/counter[15] ), .I1(1'b0), 
            .CI(n148), .O(n145), .CO(n146)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i16 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i16 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i15  (.I0(\led_inst/counter[14] ), .I1(1'b0), 
            .CI(n156), .O(n147), .CO(n148)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i15 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i15 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_129/i2  (.I0(\tx_dac_fsm_inst/zctr[1] ), 
            .I1(\tx_dac_fsm_inst/zctr[0] ), .CI(1'b0), .O(n149), .CO(n150)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(197)
    defparam \tx_dac_fsm_inst/add_129/i2 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_129/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \tx_dac_fsm_inst/add_136/i2  (.I0(\tx_dac_fsm_inst/dctr[1] ), 
            .I1(\tx_dac_fsm_inst/dctr[0] ), .CI(1'b0), .O(n152), .CO(n153)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(208)
    defparam \tx_dac_fsm_inst/add_136/i2 .I0_POLARITY = 1'b1;
    defparam \tx_dac_fsm_inst/add_136/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i14  (.I0(\led_inst/counter[13] ), .I1(1'b0), 
            .CI(n159), .O(n155), .CO(n156)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i14 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i14 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i13  (.I0(\led_inst/counter[12] ), .I1(1'b0), 
            .CI(n170), .O(n158), .CO(n159)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i13 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i13 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i12  (.I0(\led_inst/counter[11] ), .I1(1'b0), 
            .CI(n172), .O(n169), .CO(n170)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i12 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i12 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i11  (.I0(\led_inst/counter[10] ), .I1(1'b0), 
            .CI(n185), .O(n171), .CO(n172)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i11 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i11 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i10  (.I0(\led_inst/counter[9] ), .I1(1'b0), 
            .CI(n187), .O(n184), .CO(n185)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i10 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i10 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i9  (.I0(\led_inst/counter[8] ), .I1(1'b0), 
            .CI(n189), .O(n186), .CO(n187)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i9 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i9 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i8  (.I0(\led_inst/counter[7] ), .I1(1'b0), 
            .CI(n191), .O(n188), .CO(n189)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i8 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i8 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i7  (.I0(\led_inst/counter[6] ), .I1(1'b0), 
            .CI(n193), .O(n190), .CO(n191)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i7 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i7 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i6  (.I0(\led_inst/counter[5] ), .I1(1'b0), 
            .CI(n195), .O(n192), .CO(n193)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i6 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i5  (.I0(\led_inst/counter[4] ), .I1(1'b0), 
            .CI(n197), .O(n194), .CO(n195)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i5 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i4  (.I0(\led_inst/counter[3] ), .I1(1'b0), 
            .CI(n199), .O(n196), .CO(n197)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i4 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i3  (.I0(\led_inst/counter[2] ), .I1(1'b0), 
            .CI(n18), .O(n198), .CO(n199)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i3 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i5  (.I0(\spi_slave_inst/bitcnt[4] ), .I1(1'b0), 
            .CI(n202), .O(n200)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i5 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i4  (.I0(\spi_slave_inst/bitcnt[3] ), .I1(1'b0), 
            .CI(n204), .O(n201), .CO(n202)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i4 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i3  (.I0(\spi_slave_inst/bitcnt[2] ), .I1(1'b0), 
            .CI(n206), .O(n203), .CO(n204)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i3 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i2  (.I0(\spi_slave_inst/bitcnt[1] ), .I1(\spi_slave_inst/bitcnt[0] ), 
            .CI(1'b0), .O(n205), .CO(n206)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i2 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i2 .I1_POLARITY = 1'b1;
    EFX_LUT4 LUT__644 (.I0(\gpo_inst/gp_config_reg[6] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__644.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__645 (.I0(\gpo_inst/gp_config_reg[5] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__645.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__646 (.I0(\gpo_inst/gp_config_reg[4] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__646.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__647 (.I0(\gpo_inst/gp_config_reg[3] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__647.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__648 (.I0(\gpo_inst/gp_config_reg[2] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__648.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__649 (.I0(\gpo_inst/gp_config_reg[1] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__649.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__650 (.I0(\gpo_inst/gp_config_reg[0] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__650.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__651 (.I0(\tx_dac_fsm_inst/dac_config_reg[0] ), .I1(n173), 
            .O(lvds_tx_inst1_DATA[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__651.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__652 (.I0(n143), .I1(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .O(lvds_tx_inst1_DATA[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__652.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__653 (.I0(\spi_slave_inst/sync_ss[1] ), .I1(\spi_slave_inst/sync_ss[2] ), 
            .O(n439)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__653.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__654 (.I0(n439), .I1(\reg_addr[1] ), .O(\spi_slave_inst/n96 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__654.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__655 (.I0(\spi_slave_inst/bitcnt[2] ), .I1(\spi_slave_inst/bitcnt[1] ), 
            .I2(\spi_slave_inst/bitcnt[0] ), .O(n440)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__655.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__656 (.I0(\spi_slave_inst/sync_sclk[2] ), .I1(\spi_slave_inst/sync_ss[1] ), 
            .I2(\spi_slave_inst/sync_sclk[1] ), .O(n441)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__656.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__657 (.I0(n440), .I1(n438), .I2(n441), .I3(n439), .O(ceg_net5)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00bf */ ;
    defparam LUT__657.LUTMASK = 16'h00bf;
    EFX_LUT4 LUT__658 (.I0(n439), .I1(n203), .O(\spi_slave_inst/n56 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__658.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__659 (.I0(n439), .I1(n441), .O(ceg_net37)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__659.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__660 (.I0(n439), .I1(n205), .O(\spi_slave_inst/n57 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__660.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__661 (.I0(n439), .I1(\reg_addr[0] ), .O(\spi_slave_inst/n97 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__661.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__662 (.I0(\reg_addr[0] ), .I1(\reg_addr[1] ), .I2(\reg_addr[2] ), 
            .O(n442)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he0e0 */ ;
    defparam LUT__662.LUTMASK = 16'he0e0;
    EFX_LUT4 LUT__663 (.I0(rw_out), .I1(addr_dv), .I2(n442), .O(tx_en)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__663.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__664 (.I0(\spi_slave_inst/bitcnt[0] ), .I1(n439), .O(\spi_slave_inst/n58 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__664.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__665 (.I0(\spi_slave_inst/sync_ss[1] ), .I1(\spi_slave_inst/sync_ss[2] ), 
            .O(\spi_slave_inst/n68 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__665.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__666 (.I0(\spi_slave_inst/n68 ), .I1(\spi_slave_inst/sync_mosi[1] ), 
            .O(\spi_slave_inst/n73 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__666.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__667 (.I0(n438), .I1(n440), .I2(n441), .I3(\spi_slave_inst/n68 ), 
            .O(ceg_net20)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h007f */ ;
    defparam LUT__667.LUTMASK = 16'h007f;
    EFX_LUT4 LUT__668 (.I0(n439), .I1(\spi_slave_inst/sync_mosi[1] ), .O(\spi_slave_inst/n98 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__668.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__669 (.I0(\data_from_led[0] ), .I1(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .I2(\reg_addr[0] ), .O(n443)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__669.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__670 (.I0(\reg_addr[2] ), .I1(\reg_addr[1] ), .O(n444)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__670.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__671 (.I0(rw_out), .I1(addr_dv), .I2(n444), .O(n445)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__671.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__672 (.I0(\spi_slave_inst/sync_tx_en[1] ), .I1(n443), .I2(n445), 
            .I3(\spi_slave_inst/sync_tx_en[0] ), .O(\spi_slave_inst/n139 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__672.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__673 (.I0(\spi_slave_inst/sync_tx_en[0] ), .I1(\spi_slave_inst/sync_tx_en[1] ), 
            .I2(n441), .I3(tx_en), .O(ceg_net77)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0d00 */ ;
    defparam LUT__673.LUTMASK = 16'h0d00;
    EFX_LUT4 LUT__674 (.I0(n438), .I1(rw_out), .I2(n441), .I3(n439), 
            .O(ceg_net98)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00ef */ ;
    defparam LUT__674.LUTMASK = 16'h00ef;
    EFX_LUT4 LUT__675 (.I0(\spi_slave_inst/bitcnt[2] ), .I1(\spi_slave_inst/bitcnt[1] ), 
            .I2(\spi_slave_inst/bitcnt[0] ), .O(n446)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__675.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__676 (.I0(\spi_slave_inst/n68 ), .I1(n446), .I2(n438), 
            .O(ceg_net31)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__676.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__677 (.I0(rw_out), .I1(\spi_slave_inst/bitcnt[4] ), .I2(\spi_slave_inst/bitcnt[3] ), 
            .I3(\spi_slave_inst/sync_sclk[1] ), .O(n447)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__677.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__678 (.I0(\spi_slave_inst/sync_sclk[2] ), .I1(n446), .I2(n447), 
            .I3(\spi_slave_inst/n68 ), .O(ceg_net34)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00bf */ ;
    defparam LUT__678.LUTMASK = 16'h00bf;
    EFX_LUT4 LUT__679 (.I0(n439), .I1(n200), .O(\spi_slave_inst/n54 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__679.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__680 (.I0(n439), .I1(n201), .O(\spi_slave_inst/n55 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__680.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__681 (.I0(\spi_slave_inst/sync_tx_en[0] ), .I1(\spi_slave_inst/sync_tx_en[1] ), 
            .I2(n441), .I3(tx_en), .O(n448)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd000 */ ;
    defparam LUT__681.LUTMASK = 16'hd000;
    EFX_LUT4 LUT__682 (.I0(\reg_addr[0] ), .I1(rw_out), .I2(addr_dv), 
            .I3(n444), .O(n449)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__682.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__683 (.I0(\spi_slave_inst/sync_tx_en[1] ), .I1(\spi_slave_inst/sync_tx_en[0] ), 
            .I2(n449), .O(n450)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__683.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__684 (.I0(n450), .I1(\data_from_led[1] ), .I2(\spi_slave_inst/d_o[0] ), 
            .I3(n448), .O(\spi_slave_inst/n138 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__684.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__685 (.I0(n450), .I1(\data_from_led[2] ), .I2(\spi_slave_inst/d_o[1] ), 
            .I3(n448), .O(\spi_slave_inst/n137 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__685.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__686 (.I0(n450), .I1(\data_from_led[3] ), .I2(\spi_slave_inst/d_o[2] ), 
            .I3(n448), .O(\spi_slave_inst/n136 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__686.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__687 (.I0(n450), .I1(\data_from_led[4] ), .I2(\spi_slave_inst/d_o[3] ), 
            .I3(n448), .O(\spi_slave_inst/n135 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__687.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__688 (.I0(n450), .I1(\data_from_led[5] ), .I2(\spi_slave_inst/d_o[4] ), 
            .I3(n448), .O(\spi_slave_inst/n134 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__688.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__689 (.I0(n450), .I1(\data_from_led[6] ), .I2(\spi_slave_inst/d_o[5] ), 
            .I3(n448), .O(\spi_slave_inst/n133 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__689.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__690 (.I0(n450), .I1(\data_from_led[7] ), .I2(\spi_slave_inst/d_o[6] ), 
            .I3(n448), .O(\spi_slave_inst/n132 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf888 */ ;
    defparam LUT__690.LUTMASK = 16'hf888;
    EFX_LUT4 LUT__691 (.I0(n439), .I1(\rx_d[0] ), .O(\spi_slave_inst/n173 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__691.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__692 (.I0(n439), .I1(\rx_d[1] ), .O(\spi_slave_inst/n172 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__692.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__693 (.I0(n439), .I1(\rx_d[2] ), .O(\spi_slave_inst/n171 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__693.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__694 (.I0(n439), .I1(\rx_d[3] ), .O(\spi_slave_inst/n170 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__694.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__695 (.I0(n439), .I1(\rx_d[4] ), .O(\spi_slave_inst/n169 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__695.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__696 (.I0(n439), .I1(\rx_d[5] ), .O(\spi_slave_inst/n168 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__696.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__697 (.I0(n439), .I1(\rx_d[6] ), .O(\spi_slave_inst/n167 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__697.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__698 (.I0(\led_inst/ctr_cfg_reg[7] ), .I1(n449), .O(\led_inst/n41 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__698.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__699 (.I0(\led_inst/ctr_cfg_reg[6] ), .I1(n449), .O(\led_inst/n42 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__699.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__700 (.I0(\led_inst/ctr_cfg_reg[5] ), .I1(n449), .O(\led_inst/n43 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__700.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__701 (.I0(\led_inst/ctr_cfg_reg[4] ), .I1(n449), .O(\led_inst/n44 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__701.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__702 (.I0(\led_inst/ctr_cfg_reg[3] ), .I1(n449), .O(\led_inst/n45 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__702.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__703 (.I0(\led_inst/ctr_cfg_reg[0] ), .I1(n449), .O(\led_inst/n48 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__703.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__704 (.I0(\led_inst/ctr_cfg_reg[2] ), .I1(n449), .O(\led_inst/n46 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__704.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__705 (.I0(\led_inst/ctr_cfg_reg[1] ), .I1(n449), .O(\led_inst/n47 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__705.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__706 (.I0(\led_inst/counter[17] ), .I1(\led_inst/counter[16] ), 
            .I2(\led_inst/ctr_cfg_reg[1] ), .I3(\led_inst/ctr_cfg_reg[0] ), 
            .O(n451)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8eaf */ ;
    defparam LUT__706.LUTMASK = 16'h8eaf;
    EFX_LUT4 LUT__707 (.I0(\led_inst/ctr_cfg_reg[3] ), .I1(\led_inst/counter[19] ), 
            .O(n452)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__707.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__708 (.I0(\led_inst/counter[18] ), .I1(n451), .I2(\led_inst/ctr_cfg_reg[2] ), 
            .I3(n452), .O(n453)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0071 */ ;
    defparam LUT__708.LUTMASK = 16'h0071;
    EFX_LUT4 LUT__709 (.I0(\led_inst/counter[20] ), .I1(\led_inst/ctr_cfg_reg[4] ), 
            .I2(\led_inst/counter[19] ), .I3(\led_inst/ctr_cfg_reg[3] ), 
            .O(n454)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;
    defparam LUT__709.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__710 (.I0(\led_inst/ctr_cfg_reg[5] ), .I1(\led_inst/counter[21] ), 
            .O(n455)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__710.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__711 (.I0(\led_inst/ctr_cfg_reg[7] ), .I1(\led_inst/counter[23] ), 
            .I2(\led_inst/ctr_cfg_reg[6] ), .I3(\led_inst/counter[22] ), 
            .O(n456)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;
    defparam LUT__711.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__712 (.I0(\led_inst/ctr_cfg_reg[4] ), .I1(\led_inst/counter[20] ), 
            .I2(n455), .I3(n456), .O(n457)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0b00 */ ;
    defparam LUT__712.LUTMASK = 16'h0b00;
    EFX_LUT4 LUT__713 (.I0(\led_inst/counter[22] ), .I1(\led_inst/counter[21] ), 
            .I2(\led_inst/ctr_cfg_reg[6] ), .I3(\led_inst/ctr_cfg_reg[5] ), 
            .O(n458)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8eaf */ ;
    defparam LUT__713.LUTMASK = 16'h8eaf;
    EFX_LUT4 LUT__714 (.I0(\led_inst/counter[23] ), .I1(\led_inst/ctr_cfg_reg[7] ), 
            .I2(n458), .O(n459)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb2b2 */ ;
    defparam LUT__714.LUTMASK = 16'hb2b2;
    EFX_LUT4 LUT__715 (.I0(n453), .I1(n454), .I2(n457), .I3(n459), .O(\led_inst/LessThan_21/n48 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__715.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__716 (.I0(\led_inst/counter[0] ), .I1(\led_inst/LessThan_21/n48 ), 
            .O(\led_inst/n142 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__716.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__717 (.I0(rw_out), .I1(addr_dv), .I2(rxdv), .O(n460)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__717.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__718 (.I0(\reg_addr[0] ), .I1(n444), .I2(n460), .O(rx_en_led)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__718.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__719 (.I0(\rx_d[0] ), .I1(rx_en_led), .O(\data_to_led[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__719.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__720 (.I0(\led_inst/LessThan_21/n48 ), .I1(n17), .O(\led_inst/n141 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__720.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__721 (.I0(\led_inst/LessThan_21/n48 ), .I1(n198), .O(\led_inst/n140 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__721.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__722 (.I0(\led_inst/LessThan_21/n48 ), .I1(n196), .O(\led_inst/n139 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__722.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__723 (.I0(\led_inst/LessThan_21/n48 ), .I1(n194), .O(\led_inst/n138 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__723.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__724 (.I0(\led_inst/LessThan_21/n48 ), .I1(n192), .O(\led_inst/n137 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__724.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__725 (.I0(\led_inst/LessThan_21/n48 ), .I1(n190), .O(\led_inst/n136 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__725.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__726 (.I0(\led_inst/LessThan_21/n48 ), .I1(n188), .O(\led_inst/n135 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__726.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__727 (.I0(\led_inst/LessThan_21/n48 ), .I1(n186), .O(\led_inst/n134 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__727.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__728 (.I0(\led_inst/LessThan_21/n48 ), .I1(n184), .O(\led_inst/n133 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__728.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__729 (.I0(\led_inst/LessThan_21/n48 ), .I1(n171), .O(\led_inst/n132 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__729.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__730 (.I0(\led_inst/LessThan_21/n48 ), .I1(n169), .O(\led_inst/n131 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__730.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__731 (.I0(\led_inst/LessThan_21/n48 ), .I1(n158), .O(\led_inst/n130 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__731.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__732 (.I0(\led_inst/LessThan_21/n48 ), .I1(n155), .O(\led_inst/n129 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__732.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__733 (.I0(\led_inst/LessThan_21/n48 ), .I1(n147), .O(\led_inst/n128 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__733.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__734 (.I0(\led_inst/LessThan_21/n48 ), .I1(n145), .O(\led_inst/n127 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__734.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__735 (.I0(\led_inst/LessThan_21/n48 ), .I1(n140), .O(\led_inst/n126 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__735.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__736 (.I0(\led_inst/LessThan_21/n48 ), .I1(n137), .O(\led_inst/n125 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__736.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__737 (.I0(\led_inst/LessThan_21/n48 ), .I1(n135), .O(\led_inst/n124 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__737.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__738 (.I0(\led_inst/LessThan_21/n48 ), .I1(n130), .O(\led_inst/n123 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__738.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__739 (.I0(\led_inst/LessThan_21/n48 ), .I1(n127), .O(\led_inst/n122 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__739.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__740 (.I0(\led_inst/LessThan_21/n48 ), .I1(n125), .O(\led_inst/n121 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__740.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__741 (.I0(\led_inst/LessThan_21/n48 ), .I1(n121), .O(\led_inst/n120 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__741.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__742 (.I0(\led_inst/LessThan_21/n48 ), .I1(n120), .O(\led_inst/n119 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__742.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__743 (.I0(\rx_d[1] ), .I1(rx_en_led), .O(\data_to_led[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__743.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__744 (.I0(\rx_d[2] ), .I1(rx_en_led), .O(\data_to_led[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__744.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__745 (.I0(\rx_d[3] ), .I1(rx_en_led), .O(\data_to_led[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__745.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__746 (.I0(\rx_d[4] ), .I1(rx_en_led), .O(\data_to_led[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__746.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__747 (.I0(\rx_d[5] ), .I1(rx_en_led), .O(\data_to_led[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__747.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__748 (.I0(\rx_d[6] ), .I1(rx_en_led), .O(\data_to_led[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__748.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__749 (.I0(\rx_d[7] ), .I1(rx_en_led), .O(\data_to_led[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__749.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__750 (.I0(\reg_addr[2] ), .I1(\reg_addr[1] ), .I2(\reg_addr[0] ), 
            .I3(n460), .O(rx_en_gpo)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__750.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__751 (.I0(\rx_d[0] ), .I1(rx_en_gpo), .O(\data_to_gpo[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__751.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__752 (.I0(\rx_d[1] ), .I1(rx_en_gpo), .O(\data_to_gpo[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__752.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__753 (.I0(\rx_d[2] ), .I1(rx_en_gpo), .O(\data_to_gpo[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__753.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__754 (.I0(\rx_d[3] ), .I1(rx_en_gpo), .O(\data_to_gpo[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__754.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__755 (.I0(\rx_d[4] ), .I1(rx_en_gpo), .O(\data_to_gpo[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__755.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__756 (.I0(\rx_d[5] ), .I1(rx_en_gpo), .O(\data_to_gpo[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__756.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__757 (.I0(\rx_d[6] ), .I1(rx_en_gpo), .O(\data_to_gpo[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__757.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__758 (.I0(\rx_d[7] ), .I1(rx_en_gpo), .O(\data_to_gpo[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__758.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__759 (.I0(\tx_dac_fsm_inst/dctr[1] ), .I1(\tx_dac_fsm_inst/dctr[2] ), 
            .O(n461)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__759.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__760 (.I0(\tx_dac_fsm_inst/dctr[0] ), .I1(n461), .O(n322)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__760.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__761 (.I0(\tx_dac_fsm_inst/zctr[0] ), .I1(\tx_dac_fsm_inst/zctr[1] ), 
            .I2(\tx_dac_fsm_inst/zctr[2] ), .O(n330)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__761.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__762 (.I0(\tx_dac_fsm_inst/sym_ctr[2] ), .I1(\tx_dac_fsm_inst/sym_ctr[3] ), 
            .O(n334)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heeee */ ;
    defparam LUT__762.LUTMASK = 16'heeee;
    EFX_LUT4 LUT__763 (.I0(\tx_dac_fsm_inst/sym_ctr[4] ), .I1(n334), .O(n462)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__763.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__764 (.I0(\tx_dac_fsm_inst/sym_ctr[0] ), .I1(n462), .O(\tx_dac_fsm_inst/n68 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;
    defparam LUT__764.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__765 (.I0(\tx_dac_fsm_inst/dctr[0] ), .I1(\tx_dac_fsm_inst/dctr[3] ), 
            .I2(n461), .O(n463)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__765.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__766 (.I0(\tx_dac_fsm_inst/dctr[4] ), .I1(\tx_dac_fsm_inst/dctr[5] ), 
            .O(n464)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__766.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__767 (.I0(\tx_dac_fsm_inst/zctr[4] ), .I1(\tx_dac_fsm_inst/zctr[5] ), 
            .I2(\tx_dac_fsm_inst/zctr[3] ), .I3(n330), .O(n465)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__767.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__768 (.I0(n464), .I1(n463), .I2(n465), .I3(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .O(\tx_dac_fsm_inst/n42 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf800 */ ;
    defparam LUT__768.LUTMASK = 16'hf800;
    EFX_LUT4 LUT__769 (.I0(n462), .I1(\tx_dac_fsm_inst/n42 ), .O(\tx_dac_fsm_inst/n344 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__769.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__770 (.I0(\tx_dac_fsm_inst/sym_pos[2] ), .I1(\tx_dac_fsm_inst/sym_pos[1] ), 
            .I2(\tx_dac_fsm_inst/sym_pos[3] ), .I3(\tx_dac_fsm_inst/sym_pos[0] ), 
            .O(n466)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcf15 */ ;
    defparam LUT__770.LUTMASK = 16'hcf15;
    EFX_LUT4 LUT__771 (.I0(n466), .I1(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .I2(\tx_dac_fsm_inst/state_reg[0] ), .I3(\tx_dac_fsm_inst/state_reg[1] ), 
            .O(n467)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf400 */ ;
    defparam LUT__771.LUTMASK = 16'hf400;
    EFX_LUT4 LUT__772 (.I0(\tx_dac_fsm_inst/dctr[1] ), .I1(\tx_dac_fsm_inst/dctr[0] ), 
            .I2(\tx_dac_fsm_inst/dctr[2] ), .O(n468)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he0e0 */ ;
    defparam LUT__772.LUTMASK = 16'he0e0;
    EFX_LUT4 LUT__773 (.I0(\tx_dac_fsm_inst/dctr[3] ), .I1(\tx_dac_fsm_inst/dctr[4] ), 
            .I2(\tx_dac_fsm_inst/dctr[5] ), .I3(\tx_dac_fsm_inst/state_reg[2] ), 
            .O(n469)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__773.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__774 (.I0(n468), .I1(n469), .O(n470)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__774.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__775 (.I0(\tx_dac_fsm_inst/state_reg[2] ), .I1(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .I2(\tx_dac_fsm_inst/state_reg[0] ), .O(n471)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0e0e */ ;
    defparam LUT__775.LUTMASK = 16'h0e0e;
    EFX_LUT4 LUT__776 (.I0(\tx_dac_fsm_inst/state_reg[2] ), .I1(\tx_dac_fsm_inst/zctr[4] ), 
            .I2(\tx_dac_fsm_inst/zctr[5] ), .I3(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .O(n472)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__776.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__777 (.I0(\tx_dac_fsm_inst/state_reg[1] ), .I1(n472), .O(n473)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__777.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__778 (.I0(n470), .I1(n471), .I2(n473), .I3(\tx_dac_fsm_inst/state_reg[3] ), 
            .O(n474)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h004f */ ;
    defparam LUT__778.LUTMASK = 16'h004f;
    EFX_LUT4 LUT__779 (.I0(\tx_dac_fsm_inst/dctr[3] ), .I1(n461), .I2(n464), 
            .I3(\tx_dac_fsm_inst/state_reg[0] ), .O(n475)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8f00 */ ;
    defparam LUT__779.LUTMASK = 16'h8f00;
    EFX_LUT4 LUT__780 (.I0(\tx_dac_fsm_inst/state_reg[1] ), .I1(\tx_dac_fsm_inst/state_reg[2] ), 
            .O(n476)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__780.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__781 (.I0(n475), .I1(\tx_dac_fsm_inst/state_reg[3] ), .I2(n476), 
            .O(n477)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__781.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__782 (.I0(\tx_dac_fsm_inst/state_reg[2] ), .I1(n467), .I2(n474), 
            .I3(n477), .O(n356)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hffb0 */ ;
    defparam LUT__782.LUTMASK = 16'hffb0;
    EFX_LUT4 LUT__783 (.I0(\tx_dac_fsm_inst/state_reg[3] ), .I1(\tx_dac_fsm_inst/state_reg[0] ), 
            .I2(\tx_dac_fsm_inst/state_reg[1] ), .I3(\tx_dac_fsm_inst/state_reg[2] ), 
            .O(n478)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4110 */ ;
    defparam LUT__783.LUTMASK = 16'h4110;
    EFX_LUT4 LUT__784 (.I0(\tx_dac_fsm_inst/dctr[3] ), .I1(n461), .I2(n464), 
            .O(n479)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__784.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__785 (.I0(n479), .I1(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .I2(\tx_dac_fsm_inst/state_reg[2] ), .I3(n478), .O(n357)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacff */ ;
    defparam LUT__785.LUTMASK = 16'hacff;
    EFX_LUT4 LUT__786 (.I0(\tx_dac_fsm_inst/sym_ctr[1] ), .I1(n117), .I2(n462), 
            .O(\tx_dac_fsm_inst/n67 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;
    defparam LUT__786.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__787 (.I0(\tx_dac_fsm_inst/sym_ctr[2] ), .I1(n115), .I2(n462), 
            .O(\tx_dac_fsm_inst/n66 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5c5c */ ;
    defparam LUT__787.LUTMASK = 16'h5c5c;
    EFX_LUT4 LUT__788 (.I0(n113), .I1(n111), .I2(n462), .O(\tx_dac_fsm_inst/n65 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcaca */ ;
    defparam LUT__788.LUTMASK = 16'hcaca;
    EFX_LUT4 LUT__789 (.I0(\tx_dac_fsm_inst/state_reg[1] ), .I1(\tx_dac_fsm_inst/state_reg[0] ), 
            .I2(\tx_dac_fsm_inst/state_reg[2] ), .I3(\tx_dac_fsm_inst/state_reg[3] ), 
            .O(n367)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfff8 */ ;
    defparam LUT__789.LUTMASK = 16'hfff8;
    EFX_LUT4 LUT__790 (.I0(n476), .I1(\tx_dac_fsm_inst/state_reg[3] ), .O(n368)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__790.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__791 (.I0(\tx_dac_fsm_inst/state_reg[3] ), .I1(\tx_dac_fsm_inst/state_reg[0] ), 
            .I2(n476), .O(n371)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__791.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__792 (.I0(\tx_dac_fsm_inst/state_reg[1] ), .I1(\tx_dac_fsm_inst/state_reg[2] ), 
            .I2(\tx_dac_fsm_inst/state_reg[0] ), .O(n372)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcaca */ ;
    defparam LUT__792.LUTMASK = 16'hcaca;
    EFX_LUT4 LUT__793 (.I0(\tx_dac_fsm_inst/zctr[0] ), .I1(n142), .O(\tx_dac_fsm_inst/n258 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__793.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__794 (.I0(n112), .I1(n110), .I2(n462), .O(\tx_dac_fsm_inst/n64 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcaca */ ;
    defparam LUT__794.LUTMASK = 16'hcaca;
    EFX_LUT4 LUT__795 (.I0(\tx_dac_fsm_inst/dctr[0] ), .I1(n139), .O(\tx_dac_fsm_inst/n284 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__795.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__796 (.I0(\reg_addr[0] ), .I1(n444), .I2(n460), .O(rx_en_dac)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__796.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__797 (.I0(\rx_d[0] ), .I1(rx_en_dac), .O(data_to_dac)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__797.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__798 (.I0(\tx_dac_fsm_inst/sym_pos[0] ), .I1(\tx_dac_fsm_inst/sym_pos[1] ), 
            .O(\~tx_dac_fsm_inst/n431 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__798.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__799 (.I0(\tx_dac_fsm_inst/sym_pos[0] ), .I1(\tx_dac_fsm_inst/sym_pos[1] ), 
            .I2(\tx_dac_fsm_inst/sym_pos[2] ), .O(\~tx_dac_fsm_inst/n436 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;
    defparam LUT__799.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__800 (.I0(\tx_dac_fsm_inst/sym_pos[0] ), .I1(\tx_dac_fsm_inst/sym_pos[1] ), 
            .I2(\tx_dac_fsm_inst/sym_pos[2] ), .I3(\tx_dac_fsm_inst/sym_pos[3] ), 
            .O(\~tx_dac_fsm_inst/n441 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f80 */ ;
    defparam LUT__800.LUTMASK = 16'h7f80;
    EFX_LUT4 LUT__801 (.I0(\tx_dac_fsm_inst/zctr[3] ), .I1(\tx_dac_fsm_inst/zctr[5] ), 
            .I2(\tx_dac_fsm_inst/zctr[4] ), .I3(\tx_dac_fsm_inst/state_reg[0] ), 
            .O(n480)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__801.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__802 (.I0(\tx_dac_fsm_inst/zctr[0] ), .I1(\tx_dac_fsm_inst/zctr[1] ), 
            .I2(\tx_dac_fsm_inst/zctr[2] ), .I3(\tx_dac_fsm_inst/dac_config_reg[0] ), 
            .O(n481)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__802.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__803 (.I0(n476), .I1(n480), .I2(n481), .O(n482)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__803.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__804 (.I0(n470), .I1(\tx_dac_fsm_inst/state_reg[0] ), .I2(\tx_dac_fsm_inst/state_reg[1] ), 
            .I3(n482), .O(n483)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h004f */ ;
    defparam LUT__804.LUTMASK = 16'h004f;
    EFX_LUT4 LUT__805 (.I0(n475), .I1(n476), .I2(n483), .I3(\tx_dac_fsm_inst/state_reg[3] ), 
            .O(n396)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h880f */ ;
    defparam LUT__805.LUTMASK = 16'h880f;
    EFX_LUT4 LUT__806 (.I0(\tx_dac_fsm_inst/state_reg[0] ), .I1(\tx_dac_fsm_inst/state_reg[2] ), 
            .I2(n467), .I3(\tx_dac_fsm_inst/state_reg[3] ), .O(n397)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00f4 */ ;
    defparam LUT__806.LUTMASK = 16'h00f4;
    EFX_LUT4 LUT__807 (.I0(n475), .I1(\tx_dac_fsm_inst/state_reg[0] ), .I2(\tx_dac_fsm_inst/state_reg[2] ), 
            .I3(\tx_dac_fsm_inst/state_reg[3] ), .O(n484)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfa3f */ ;
    defparam LUT__807.LUTMASK = 16'hfa3f;
    EFX_LUT4 LUT__808 (.I0(\tx_dac_fsm_inst/state_reg[1] ), .I1(n484), .O(n398)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__808.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__809 (.I0(\tx_dac_fsm_inst/state_reg[0] ), .I1(\tx_dac_fsm_inst/state_reg[3] ), 
            .I2(n476), .O(n403)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4242 */ ;
    defparam LUT__809.LUTMASK = 16'h4242;
    EFX_LUT4 LUT__810 (.I0(n142), .I1(n149), .O(\tx_dac_fsm_inst/n257 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__810.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__811 (.I0(n109), .I1(n142), .O(\tx_dac_fsm_inst/n256 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__811.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__812 (.I0(n107), .I1(n142), .O(\tx_dac_fsm_inst/n255 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__812.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__813 (.I0(n105), .I1(n142), .O(\tx_dac_fsm_inst/n254 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__813.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__814 (.I0(n104), .I1(n142), .O(\tx_dac_fsm_inst/n253 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__814.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__815 (.I0(n139), .I1(n152), .O(\tx_dac_fsm_inst/n283 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__815.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__816 (.I0(n103), .I1(n139), .O(\tx_dac_fsm_inst/n282 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__816.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__817 (.I0(n101), .I1(n139), .O(\tx_dac_fsm_inst/n281 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__817.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__818 (.I0(n99), .I1(n139), .O(\tx_dac_fsm_inst/n280 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__818.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__819 (.I0(n98), .I1(n139), .O(\tx_dac_fsm_inst/n279 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__819.LUTMASK = 16'h8888;
    EFX_GBUFCE CLKBUF__1 (.CE(1'b1), .I(pll_clk), .O(\pll_clk~O )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_GBUFCE, CE_POLARITY=1'b1 */ ;
    defparam CLKBUF__1.CE_POLARITY = 1'b1;
    EFX_GBUFCE CLKBUF__0 (.CE(1'b1), .I(tx_slowclk), .O(\tx_slowclk~O )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_GBUFCE, CE_POLARITY=1'b1 */ ;
    defparam CLKBUF__0.CE_POLARITY = 1'b1;
    EFX_ADD \AUX_ADD_CI__tx_dac_fsm_inst/add_18/i2  (.I0(\tx_dac_fsm_inst/sym_ctr[0] ), 
            .I1(1'b1), .CI(1'b0), .CO(n489)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(95)
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/add_18/i2 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/add_18/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \AUX_ADD_CI__tx_dac_fsm_inst/sub_20/add_2/i4  (.I0(\tx_dac_fsm_inst/sym_ctr[2] ), 
            .I1(1'b1), .CI(1'b0), .CO(n488)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(97)
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/sub_20/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/sub_20/add_2/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \AUX_ADD_CI__tx_dac_fsm_inst/sub_20/add_2/i5  (.I0(n334), .I1(1'b1), 
            .CI(1'b0), .CO(n487)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(97)
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/sub_20/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/sub_20/add_2/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \AUX_ADD_CI__tx_dac_fsm_inst/add_129/i4  (.I0(n330), .I1(1'b1), 
            .CI(1'b0), .CO(n486)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(197)
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/add_129/i4 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/add_129/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \AUX_ADD_CI__tx_dac_fsm_inst/add_136/i4  (.I0(n322), .I1(1'b1), 
            .CI(1'b0), .CO(n485)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\tx_dac_fsm.sv(208)
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/add_136/i4 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CI__tx_dac_fsm_inst/add_136/i4 .I1_POLARITY = 1'b1;
    
endmodule

//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_7d6f04f7_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_7d6f04f7_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_7d6f04f7_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_7d6f04f7_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_7d6f04f7_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_ADD_7d6f04f7_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_15
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_16
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_17
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_18
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_19
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_20
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_21
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_22
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_23
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_24
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_25
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_26
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_27
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_28
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_29
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_30
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_31
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_32
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_33
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_34
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_35
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_36
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_37
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_38
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_39
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_40
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_41
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_42
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_43
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_44
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_45
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_7d6f04f7_46
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_GBUFCE_7d6f04f7_0
// module not written out since it is a black box. 
//

