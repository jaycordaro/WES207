
//
// Verific Verilog Description of module WES207_top
//

module WES207_top (INPUT_CLK, reset_n, led0, led1, SCLK, SSB, MOSI, 
            MISO, gpo_pins);
    input INPUT_CLK /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input reset_n /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    output led0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    output led1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    input SCLK /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input SSB /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input MOSI /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    output MISO /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    output [6:0]gpo_pins /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    
    
    wire \spi_slave_inst/bitcnt[2] , \reg_addr[2] , \spi_slave_inst/bitcnt[1] , 
        \spi_slave_inst/sync_tx_en[1] , \reg_addr[1] , \spi_slave_inst/bitcnt[0] , 
        \spi_slave_inst/sync_mosi[1] , n16, n17, rw_out, \reg_addr[0] , 
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
        \gpo_inst/gp_config_reg[7] , n97, n98, n99, n100, n101, 
        n102, n103, n104, n105, n106, n107, n108, n109, n110, 
        n111, n112, n113, n114, n115, n116, n117, n118, n119, 
        n120, n121, n122, n123, n124, n125, n126, n127, n128, 
        n129, n130, n131, n132, n133, n134, n135, n136, n137, 
        n138, n139, n140, n141, n142, n143, n144, n145, n146, 
        \spi_slave_inst/n56 , ceg_net37, \spi_slave_inst/n96 , ceg_net5, 
        \spi_slave_inst/n57 , \spi_slave_inst/sync_tx_en[0] , \spi_slave_inst/n97 , 
        tx_en, \spi_slave_inst/n58 , \spi_slave_inst/sync_mosi[0] , \spi_slave_inst/n73 , 
        ceg_net20, \spi_slave_inst/n98 , \spi_slave_inst/n139 , ceg_net77, 
        ceg_net98, \spi_slave_inst/n68 , ceg_net31, ceg_net34, \spi_slave_inst/n54 , 
        \spi_slave_inst/n55 , \spi_slave_inst/n138 , \spi_slave_inst/n137 , 
        \spi_slave_inst/n136 , \spi_slave_inst/n135 , \spi_slave_inst/n134 , 
        \spi_slave_inst/n133 , \spi_slave_inst/n132 , \spi_slave_inst/n173 , 
        \spi_slave_inst/n172 , \spi_slave_inst/n171 , \spi_slave_inst/n170 , 
        \spi_slave_inst/n169 , \spi_slave_inst/n168 , \spi_slave_inst/n167 , 
        \led_inst/n41 , \led_inst/n42 , \led_inst/n43 , \led_inst/n44 , 
        \led_inst/n45 , \led_inst/n48 , \led_inst/n46 , \led_inst/n47 , 
        \led_inst/n142 , \data_to_led[0] , rx_en_led, \led_inst/LessThan_21/n48 , 
        \led_inst/n141 , \led_inst/n140 , \led_inst/n139 , \led_inst/n138 , 
        \led_inst/n137 , \led_inst/n136 , \led_inst/n135 , \led_inst/n134 , 
        \led_inst/n133 , \led_inst/n132 , \led_inst/n131 , \led_inst/n130 , 
        \led_inst/n129 , \led_inst/n128 , \led_inst/n127 , \led_inst/n126 , 
        \led_inst/n125 , \led_inst/n124 , \led_inst/n123 , \led_inst/n122 , 
        \led_inst/n121 , \led_inst/n120 , \led_inst/n119 , \data_to_led[1] , 
        \data_to_led[2] , \data_to_led[3] , \data_to_led[4] , \data_to_led[5] , 
        \data_to_led[6] , \data_to_led[7] , \data_to_gpo[0] , rx_en_gpo, 
        \data_to_gpo[1] , \data_to_gpo[2] , \data_to_gpo[3] , \data_to_gpo[4] , 
        \data_to_gpo[5] , \data_to_gpo[6] , \data_to_gpo[7] , \INPUT_CLK~O , 
        n307, n308, n309, n310, n311, n312, n313, n314, n315, 
        n316, n317, n318, n319, n320, n321, n322, n323, n324, 
        n325, n326, n327, n328, n329, n330, n331, n332, n333, 
        n334;
    
    EFX_LUT4 LUT__451 (.I0(\spi_slave_inst/bitcnt[4] ), .I1(\spi_slave_inst/bitcnt[3] ), 
            .O(n307)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__451.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__452 (.I0(n307), .I1(\spi_slave_inst/d_o[7] ), .I2(rw_out), 
            .O(MISO)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__452.LUTMASK = 16'h4040;
    EFX_FF \spi_slave_inst/bitcnt[2]~FF  (.D(\spi_slave_inst/n56 ), .CE(ceg_net37), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[2]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \reg_addr[2]~FF  (.D(\spi_slave_inst/n96 ), .CE(ceg_net5), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\reg_addr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(114)
    defparam \reg_addr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \reg_addr[2]~FF .CE_POLARITY = 1'b0;
    defparam \reg_addr[2]~FF .SR_POLARITY = 1'b0;
    defparam \reg_addr[2]~FF .D_POLARITY = 1'b1;
    defparam \reg_addr[2]~FF .SR_SYNC = 1'b0;
    defparam \reg_addr[2]~FF .SR_VALUE = 1'b0;
    defparam \reg_addr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[1]~FF  (.D(\spi_slave_inst/n57 ), .CE(ceg_net37), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[1]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_tx_en[1]~FF  (.D(\spi_slave_inst/sync_tx_en[0] ), 
           .CE(1'b1), .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_tx_en[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_tx_en[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \reg_addr[1]~FF  (.D(\spi_slave_inst/n97 ), .CE(ceg_net5), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\reg_addr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(114)
    defparam \reg_addr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \reg_addr[1]~FF .CE_POLARITY = 1'b0;
    defparam \reg_addr[1]~FF .SR_POLARITY = 1'b0;
    defparam \reg_addr[1]~FF .D_POLARITY = 1'b1;
    defparam \reg_addr[1]~FF .SR_SYNC = 1'b0;
    defparam \reg_addr[1]~FF .SR_VALUE = 1'b0;
    defparam \reg_addr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_tx_en[0]_2~FF  (.D(tx_en), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_tx_en[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_tx_en[0]_2~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[0]~FF  (.D(\spi_slave_inst/n58 ), .CE(ceg_net37), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[0]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_mosi[1]~FF  (.D(\spi_slave_inst/sync_mosi[0] ), 
           .CE(1'b1), .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_mosi[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_mosi[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_mosi[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_mosi[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rw_out~FF  (.D(\spi_slave_inst/n73 ), .CE(ceg_net20), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(rw_out)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(103)
    defparam \rw_out~FF .CLK_POLARITY = 1'b1;
    defparam \rw_out~FF .CE_POLARITY = 1'b0;
    defparam \rw_out~FF .SR_POLARITY = 1'b0;
    defparam \rw_out~FF .D_POLARITY = 1'b1;
    defparam \rw_out~FF .SR_SYNC = 1'b0;
    defparam \rw_out~FF .SR_VALUE = 1'b0;
    defparam \rw_out~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \reg_addr[0]~FF  (.D(\spi_slave_inst/n98 ), .CE(ceg_net5), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\reg_addr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(114)
    defparam \reg_addr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \reg_addr[0]~FF .CE_POLARITY = 1'b0;
    defparam \reg_addr[0]~FF .SR_POLARITY = 1'b0;
    defparam \reg_addr[0]~FF .D_POLARITY = 1'b1;
    defparam \reg_addr[0]~FF .SR_SYNC = 1'b0;
    defparam \reg_addr[0]~FF .SR_VALUE = 1'b0;
    defparam \reg_addr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[0]~FF  (.D(\spi_slave_inst/n139 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[0]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[0]~FF  (.D(\spi_slave_inst/n98 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[0]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[0]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[0]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[0]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[0]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[0]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \addr_dv~FF  (.D(\spi_slave_inst/n68 ), .CE(ceg_net31), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(addr_dv)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(155)
    defparam \addr_dv~FF .CLK_POLARITY = 1'b1;
    defparam \addr_dv~FF .CE_POLARITY = 1'b0;
    defparam \addr_dv~FF .SR_POLARITY = 1'b0;
    defparam \addr_dv~FF .D_POLARITY = 1'b0;
    defparam \addr_dv~FF .SR_SYNC = 1'b0;
    defparam \addr_dv~FF .SR_VALUE = 1'b0;
    defparam \addr_dv~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rxdv~FF  (.D(\spi_slave_inst/n68 ), .CE(ceg_net34), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(rxdv)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(165)
    defparam \rxdv~FF .CLK_POLARITY = 1'b1;
    defparam \rxdv~FF .CE_POLARITY = 1'b0;
    defparam \rxdv~FF .SR_POLARITY = 1'b0;
    defparam \rxdv~FF .D_POLARITY = 1'b0;
    defparam \rxdv~FF .SR_SYNC = 1'b0;
    defparam \rxdv~FF .SR_VALUE = 1'b0;
    defparam \rxdv~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_sclk[0]~FF  (.D(SCLK), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_sclk[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_sclk[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[0]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_sclk[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_sclk[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[4]~FF  (.D(\spi_slave_inst/n54 ), .CE(ceg_net37), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[4]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[4]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/bitcnt[3]~FF  (.D(\spi_slave_inst/n55 ), .CE(ceg_net37), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/bitcnt[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/bitcnt[3]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[3]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/bitcnt[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_mosi[0]_2~FF  (.D(MOSI), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_mosi[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_mosi[0]_2~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_ss[0]~FF  (.D(SSB), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\spi_slave_inst/sync_ss[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_ss[0]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_ss[0]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_VALUE = 1'b1;
    defparam \spi_slave_inst/sync_ss[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[1]~FF  (.D(\spi_slave_inst/n138 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[1]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[2]~FF  (.D(\spi_slave_inst/n137 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[2]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[3]~FF  (.D(\spi_slave_inst/n136 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[3]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[3]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[3]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[4]~FF  (.D(\spi_slave_inst/n135 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[4]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[4]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[4]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[5]~FF  (.D(\spi_slave_inst/n134 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[5]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[5]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[5]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[6]~FF  (.D(\spi_slave_inst/n133 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[6]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[6]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[6]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/d_o[7]~FF  (.D(\spi_slave_inst/n132 ), .CE(ceg_net77), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/d_o[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(132)
    defparam \spi_slave_inst/d_o[7]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[7]~FF .CE_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/d_o[7]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/d_o[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[1]~FF  (.D(\spi_slave_inst/n173 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[1]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[1]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[1]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[1]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[1]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[1]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[2]~FF  (.D(\spi_slave_inst/n172 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[2]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[2]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[2]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[2]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[2]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[2]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[3]~FF  (.D(\spi_slave_inst/n171 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[3]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[3]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[3]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[3]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[3]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[3]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[4]~FF  (.D(\spi_slave_inst/n170 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[4]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[4]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[4]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[4]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[4]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[4]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[5]~FF  (.D(\spi_slave_inst/n169 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[5]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[5]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[5]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[5]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[5]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[5]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[6]~FF  (.D(\spi_slave_inst/n168 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[6]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[6]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[6]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[6]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[6]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[6]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \rx_d[7]~FF  (.D(\spi_slave_inst/n167 ), .CE(ceg_net98), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\rx_d[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(143)
    defparam \rx_d[7]~FF .CLK_POLARITY = 1'b1;
    defparam \rx_d[7]~FF .CE_POLARITY = 1'b0;
    defparam \rx_d[7]~FF .SR_POLARITY = 1'b0;
    defparam \rx_d[7]~FF .D_POLARITY = 1'b1;
    defparam \rx_d[7]~FF .SR_SYNC = 1'b0;
    defparam \rx_d[7]~FF .SR_VALUE = 1'b0;
    defparam \rx_d[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_sclk[1]~FF  (.D(\spi_slave_inst/sync_sclk[0] ), 
           .CE(1'b1), .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_sclk[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_sclk[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_sclk[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_sclk[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_sclk[2]~FF  (.D(\spi_slave_inst/sync_sclk[1] ), 
           .CE(1'b1), .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_sclk[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_sclk[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[2]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_sclk[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_VALUE = 1'b0;
    defparam \spi_slave_inst/sync_sclk[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_ss[1]~FF  (.D(\spi_slave_inst/sync_ss[0] ), 
           .CE(1'b1), .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_ss[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_ss[1]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_ss[1]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_VALUE = 1'b1;
    defparam \spi_slave_inst/sync_ss[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \spi_slave_inst/sync_ss[2]~FF  (.D(\spi_slave_inst/sync_ss[1] ), 
           .CE(1'b1), .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\spi_slave_inst/sync_ss[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(62)
    defparam \spi_slave_inst/sync_ss[2]~FF .CLK_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .CE_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_POLARITY = 1'b0;
    defparam \spi_slave_inst/sync_ss[2]~FF .D_POLARITY = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_SYNC = 1'b0;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_VALUE = 1'b1;
    defparam \spi_slave_inst/sync_ss[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[7]~FF  (.D(\led_inst/n41 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[7]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[7]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[7]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[7]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[7]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[7]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[6]~FF  (.D(\led_inst/n42 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[6]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[6]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[6]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[6]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[6]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[6]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[5]~FF  (.D(\led_inst/n43 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[5]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[5]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[5]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[5]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[5]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[5]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[4]~FF  (.D(\led_inst/n44 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[4]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[4]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[4]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[4]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[4]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[4]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[3]~FF  (.D(\led_inst/n45 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[3]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[3]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[3]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[3]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[3]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[3]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[0]~FF  (.D(\led_inst/n48 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[0]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[0]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[0]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[0]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[0]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[0]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[2]~FF  (.D(\led_inst/n46 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[2]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[2]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[2]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[2]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[2]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[2]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_from_led[1]~FF  (.D(\led_inst/n47 ), .CE(1'b0), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\data_from_led[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(58)
    defparam \data_from_led[1]~FF .CLK_POLARITY = 1'b1;
    defparam \data_from_led[1]~FF .CE_POLARITY = 1'b0;
    defparam \data_from_led[1]~FF .SR_POLARITY = 1'b0;
    defparam \data_from_led[1]~FF .D_POLARITY = 1'b1;
    defparam \data_from_led[1]~FF .SR_SYNC = 1'b0;
    defparam \data_from_led[1]~FF .SR_VALUE = 1'b0;
    defparam \data_from_led[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[0]~FF  (.D(\led_inst/n142 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[0]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[0]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[0]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[0]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[0]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[0]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[0]~FF  (.D(\data_to_led[0] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[0]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led0~FF  (.D(led0), .CE(\led_inst/LessThan_21/n48 ), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(led0)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led0~FF .CLK_POLARITY = 1'b1;
    defparam \led0~FF .CE_POLARITY = 1'b1;
    defparam \led0~FF .SR_POLARITY = 1'b0;
    defparam \led0~FF .D_POLARITY = 1'b0;
    defparam \led0~FF .SR_SYNC = 1'b0;
    defparam \led0~FF .SR_VALUE = 1'b0;
    defparam \led0~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led1~FF  (.D(led0), .CE(\led_inst/LessThan_21/n48 ), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(led1)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led1~FF .CLK_POLARITY = 1'b1;
    defparam \led1~FF .CE_POLARITY = 1'b1;
    defparam \led1~FF .SR_POLARITY = 1'b0;
    defparam \led1~FF .D_POLARITY = 1'b1;
    defparam \led1~FF .SR_SYNC = 1'b0;
    defparam \led1~FF .SR_VALUE = 1'b1;
    defparam \led1~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[1]~FF  (.D(\led_inst/n141 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[1]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[1]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[1]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[1]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[1]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[1]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[2]~FF  (.D(\led_inst/n140 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[2]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[2]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[2]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[2]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[2]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[2]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[3]~FF  (.D(\led_inst/n139 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[3]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[3]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[3]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[3]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[3]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[3]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[4]~FF  (.D(\led_inst/n138 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[4]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[4]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[4]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[4]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[4]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[4]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[5]~FF  (.D(\led_inst/n137 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[5]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[5]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[5]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[5]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[5]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[5]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[6]~FF  (.D(\led_inst/n136 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[6]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[6]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[6]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[6]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[6]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[6]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[7]~FF  (.D(\led_inst/n135 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[7]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[7]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[7]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[7]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[7]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[7]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[8]~FF  (.D(\led_inst/n134 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[8]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[8]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[8]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[8]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[8]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[8]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[9]~FF  (.D(\led_inst/n133 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[9]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[9]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[9]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[9]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[9]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[9]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[10]~FF  (.D(\led_inst/n132 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[10]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[10]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[10]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[10]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[10]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[10]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[11]~FF  (.D(\led_inst/n131 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[11] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[11]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[11]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[11]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[11]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[11]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[11]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[12]~FF  (.D(\led_inst/n130 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[12] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[12]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[12]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[12]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[12]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[12]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[12]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[13]~FF  (.D(\led_inst/n129 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[13] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[13]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[13]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[13]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[13]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[13]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[13]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[14]~FF  (.D(\led_inst/n128 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[14] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[14]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[14]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[14]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[14]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[14]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[14]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[15]~FF  (.D(\led_inst/n127 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[15] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[15]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[15]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[15]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[15]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[15]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[15]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[16]~FF  (.D(\led_inst/n126 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[16] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[16]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[16]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[16]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[16]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[16]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[16]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[16]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[17]~FF  (.D(\led_inst/n125 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[17] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[17]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[17]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[17]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[17]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[17]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[17]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[17]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[18]~FF  (.D(\led_inst/n124 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[18] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[18]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[18]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[18]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[18]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[18]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[18]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[18]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[19]~FF  (.D(\led_inst/n123 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[19] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[19]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[19]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[19]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[19]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[19]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[19]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[19]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[20]~FF  (.D(\led_inst/n122 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[20] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[20]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[20]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[20]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[20]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[20]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[20]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[20]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[21]~FF  (.D(\led_inst/n121 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[21] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[21]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[21]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[21]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[21]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[21]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[21]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[21]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[22]~FF  (.D(\led_inst/n120 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[22] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[22]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[22]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[22]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[22]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[22]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[22]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[22]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/counter[23]~FF  (.D(\led_inst/n119 ), .CE(1'b1), .CLK(\INPUT_CLK~O ), 
           .SR(reset_n), .Q(\led_inst/counter[23] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(79)
    defparam \led_inst/counter[23]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/counter[23]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/counter[23]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/counter[23]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/counter[23]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/counter[23]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/counter[23]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[1]~FF  (.D(\data_to_led[1] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[1]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[1]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/ctr_cfg_reg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[2]~FF  (.D(\data_to_led[2] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[2]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[3]~FF  (.D(\data_to_led[3] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[3]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[4]~FF  (.D(\data_to_led[4] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[4]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[4]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[5]~FF  (.D(\data_to_led[5] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[5]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[5]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[5]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/ctr_cfg_reg[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[6]~FF  (.D(\data_to_led[6] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b1, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[6]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[6]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_VALUE = 1'b1;
    defparam \led_inst/ctr_cfg_reg[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \led_inst/ctr_cfg_reg[7]~FF  (.D(\data_to_led[7] ), .CE(rx_en_led), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\led_inst/ctr_cfg_reg[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(46)
    defparam \led_inst/ctr_cfg_reg[7]~FF .CLK_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[7]~FF .CE_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_POLARITY = 1'b0;
    defparam \led_inst/ctr_cfg_reg[7]~FF .D_POLARITY = 1'b1;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_SYNC = 1'b0;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_VALUE = 1'b0;
    defparam \led_inst/ctr_cfg_reg[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[0]~FF  (.D(\data_to_gpo[0] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[0]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[0]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[0]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[1]~FF  (.D(\data_to_gpo[1] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[1]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[1]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[1]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[2]~FF  (.D(\data_to_gpo[2] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[2]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[2]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[2]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[3]~FF  (.D(\data_to_gpo[3] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[3]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[3]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[3]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[4]~FF  (.D(\data_to_gpo[4] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[4]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[4]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[4]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[5]~FF  (.D(\data_to_gpo[5] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[5]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[5]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[5]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[6]~FF  (.D(\data_to_gpo[6] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[6]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[6]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[6]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \gpo_inst/gp_config_reg[7]~FF  (.D(\data_to_gpo[7] ), .CE(rx_en_gpo), 
           .CLK(\INPUT_CLK~O ), .SR(reset_n), .Q(\gpo_inst/gp_config_reg[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\gpo.sv(21)
    defparam \gpo_inst/gp_config_reg[7]~FF .CLK_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[7]~FF .CE_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_POLARITY = 1'b0;
    defparam \gpo_inst/gp_config_reg[7]~FF .D_POLARITY = 1'b1;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_SYNC = 1'b0;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_VALUE = 1'b0;
    defparam \gpo_inst/gp_config_reg[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_ADD \led_inst/add_23/i2  (.I0(\led_inst/counter[1] ), .I1(\led_inst/counter[0] ), 
            .CI(1'b0), .O(n16), .CO(n17)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i2 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i24  (.I0(\led_inst/counter[23] ), .I1(1'b0), 
            .CI(n99), .O(n97)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i24 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i24 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i23  (.I0(\led_inst/counter[22] ), .I1(1'b0), 
            .CI(n101), .O(n98), .CO(n99)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i23 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i23 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i22  (.I0(\led_inst/counter[21] ), .I1(1'b0), 
            .CI(n103), .O(n100), .CO(n101)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i22 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i22 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i21  (.I0(\led_inst/counter[20] ), .I1(1'b0), 
            .CI(n105), .O(n102), .CO(n103)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i21 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i21 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i20  (.I0(\led_inst/counter[19] ), .I1(1'b0), 
            .CI(n107), .O(n104), .CO(n105)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i20 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i20 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i19  (.I0(\led_inst/counter[18] ), .I1(1'b0), 
            .CI(n109), .O(n106), .CO(n107)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i19 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i19 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i18  (.I0(\led_inst/counter[17] ), .I1(1'b0), 
            .CI(n111), .O(n108), .CO(n109)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i18 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i18 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i17  (.I0(\led_inst/counter[16] ), .I1(1'b0), 
            .CI(n113), .O(n110), .CO(n111)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i17 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i17 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i16  (.I0(\led_inst/counter[15] ), .I1(1'b0), 
            .CI(n115), .O(n112), .CO(n113)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i16 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i16 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i15  (.I0(\led_inst/counter[14] ), .I1(1'b0), 
            .CI(n117), .O(n114), .CO(n115)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i15 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i15 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i14  (.I0(\led_inst/counter[13] ), .I1(1'b0), 
            .CI(n119), .O(n116), .CO(n117)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i14 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i14 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i13  (.I0(\led_inst/counter[12] ), .I1(1'b0), 
            .CI(n121), .O(n118), .CO(n119)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i13 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i13 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i12  (.I0(\led_inst/counter[11] ), .I1(1'b0), 
            .CI(n123), .O(n120), .CO(n121)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i12 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i12 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i11  (.I0(\led_inst/counter[10] ), .I1(1'b0), 
            .CI(n125), .O(n122), .CO(n123)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i11 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i11 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i10  (.I0(\led_inst/counter[9] ), .I1(1'b0), 
            .CI(n127), .O(n124), .CO(n125)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i10 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i10 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i9  (.I0(\led_inst/counter[8] ), .I1(1'b0), 
            .CI(n129), .O(n126), .CO(n127)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i9 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i9 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i8  (.I0(\led_inst/counter[7] ), .I1(1'b0), 
            .CI(n131), .O(n128), .CO(n129)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i8 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i8 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i7  (.I0(\led_inst/counter[6] ), .I1(1'b0), 
            .CI(n133), .O(n130), .CO(n131)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i7 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i7 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i6  (.I0(\led_inst/counter[5] ), .I1(1'b0), 
            .CI(n135), .O(n132), .CO(n133)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i6 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i5  (.I0(\led_inst/counter[4] ), .I1(1'b0), 
            .CI(n137), .O(n134), .CO(n135)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i5 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i4  (.I0(\led_inst/counter[3] ), .I1(1'b0), 
            .CI(n139), .O(n136), .CO(n137)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i4 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \led_inst/add_23/i3  (.I0(\led_inst/counter[2] ), .I1(1'b0), 
            .CI(n17), .O(n138), .CO(n139)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\led.sv(78)
    defparam \led_inst/add_23/i3 .I0_POLARITY = 1'b1;
    defparam \led_inst/add_23/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i5  (.I0(\spi_slave_inst/bitcnt[4] ), .I1(1'b0), 
            .CI(n142), .O(n140)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i5 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i4  (.I0(\spi_slave_inst/bitcnt[3] ), .I1(1'b0), 
            .CI(n144), .O(n141), .CO(n142)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i4 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i3  (.I0(\spi_slave_inst/bitcnt[2] ), .I1(1'b0), 
            .CI(n146), .O(n143), .CO(n144)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i3 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \spi_slave_inst/add_29/i2  (.I0(\spi_slave_inst/bitcnt[1] ), .I1(\spi_slave_inst/bitcnt[0] ), 
            .CI(1'b0), .O(n145), .CO(n146)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // C:\Efinity\2022.2\project\WES207_basic\rtl\spi_slave.sv(92)
    defparam \spi_slave_inst/add_29/i2 .I0_POLARITY = 1'b1;
    defparam \spi_slave_inst/add_29/i2 .I1_POLARITY = 1'b1;
    EFX_LUT4 LUT__453 (.I0(\gpo_inst/gp_config_reg[6] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[6])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__453.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__454 (.I0(\gpo_inst/gp_config_reg[5] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[5])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__454.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__455 (.I0(\gpo_inst/gp_config_reg[4] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[4])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__455.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__456 (.I0(\gpo_inst/gp_config_reg[3] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[3])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__456.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__457 (.I0(\gpo_inst/gp_config_reg[2] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__457.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__458 (.I0(\gpo_inst/gp_config_reg[1] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__458.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__459 (.I0(\gpo_inst/gp_config_reg[0] ), .I1(\gpo_inst/gp_config_reg[7] ), 
            .O(gpo_pins[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__459.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__460 (.I0(\spi_slave_inst/sync_ss[1] ), .I1(\spi_slave_inst/sync_ss[2] ), 
            .O(n308)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__460.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__461 (.I0(n308), .I1(n143), .O(\spi_slave_inst/n56 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__461.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__462 (.I0(\spi_slave_inst/sync_sclk[2] ), .I1(\spi_slave_inst/sync_ss[1] ), 
            .I2(\spi_slave_inst/sync_sclk[1] ), .O(n309)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__462.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__463 (.I0(n308), .I1(n309), .O(ceg_net37)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__463.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__464 (.I0(n308), .I1(\reg_addr[1] ), .O(\spi_slave_inst/n96 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__464.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__465 (.I0(\spi_slave_inst/bitcnt[2] ), .I1(\spi_slave_inst/bitcnt[1] ), 
            .I2(\spi_slave_inst/bitcnt[0] ), .O(n310)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__465.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__466 (.I0(n310), .I1(n309), .I2(n307), .I3(n308), .O(ceg_net5)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00bf */ ;
    defparam LUT__466.LUTMASK = 16'h00bf;
    EFX_LUT4 LUT__467 (.I0(n308), .I1(n145), .O(\spi_slave_inst/n57 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__467.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__468 (.I0(n308), .I1(\reg_addr[0] ), .O(\spi_slave_inst/n97 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__468.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__469 (.I0(\reg_addr[1] ), .I1(\reg_addr[2] ), .I2(rw_out), 
            .I3(addr_dv), .O(tx_en)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__469.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__470 (.I0(\spi_slave_inst/bitcnt[0] ), .I1(n308), .O(\spi_slave_inst/n58 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__470.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__471 (.I0(\spi_slave_inst/sync_ss[1] ), .I1(\spi_slave_inst/sync_ss[2] ), 
            .O(\spi_slave_inst/n68 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__471.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__472 (.I0(\spi_slave_inst/n68 ), .I1(\spi_slave_inst/sync_mosi[1] ), 
            .O(\spi_slave_inst/n73 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__472.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__473 (.I0(n307), .I1(n309), .I2(n310), .I3(\spi_slave_inst/n68 ), 
            .O(ceg_net20)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h007f */ ;
    defparam LUT__473.LUTMASK = 16'h007f;
    EFX_LUT4 LUT__474 (.I0(n308), .I1(\spi_slave_inst/sync_mosi[1] ), .O(\spi_slave_inst/n98 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__474.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__475 (.I0(\spi_slave_inst/sync_tx_en[1] ), .I1(\spi_slave_inst/sync_tx_en[0] ), 
            .I2(tx_en), .O(n311)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__475.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__476 (.I0(\gpo_inst/gp_config_reg[0] ), .I1(\data_from_led[0] ), 
            .I2(\reg_addr[0] ), .I3(n311), .O(\spi_slave_inst/n139 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hca00 */ ;
    defparam LUT__476.LUTMASK = 16'hca00;
    EFX_LUT4 LUT__477 (.I0(\spi_slave_inst/sync_tx_en[0] ), .I1(\spi_slave_inst/sync_tx_en[1] ), 
            .I2(n309), .I3(tx_en), .O(ceg_net77)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0d00 */ ;
    defparam LUT__477.LUTMASK = 16'h0d00;
    EFX_LUT4 LUT__478 (.I0(n307), .I1(rw_out), .I2(n309), .I3(n308), 
            .O(ceg_net98)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00ef */ ;
    defparam LUT__478.LUTMASK = 16'h00ef;
    EFX_LUT4 LUT__479 (.I0(\spi_slave_inst/bitcnt[2] ), .I1(\spi_slave_inst/bitcnt[1] ), 
            .I2(\spi_slave_inst/bitcnt[0] ), .O(n312)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__479.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__480 (.I0(\spi_slave_inst/n68 ), .I1(n312), .I2(n307), 
            .O(ceg_net31)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__480.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__481 (.I0(rw_out), .I1(\spi_slave_inst/bitcnt[4] ), .I2(\spi_slave_inst/bitcnt[3] ), 
            .I3(\spi_slave_inst/sync_sclk[1] ), .O(n313)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__481.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__482 (.I0(\spi_slave_inst/sync_sclk[2] ), .I1(n312), .I2(n313), 
            .I3(\spi_slave_inst/n68 ), .O(ceg_net34)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00bf */ ;
    defparam LUT__482.LUTMASK = 16'h00bf;
    EFX_LUT4 LUT__483 (.I0(n308), .I1(n140), .O(\spi_slave_inst/n54 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__483.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__484 (.I0(n308), .I1(n141), .O(\spi_slave_inst/n55 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__484.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__485 (.I0(\spi_slave_inst/sync_tx_en[0] ), .I1(\spi_slave_inst/sync_tx_en[1] ), 
            .I2(n309), .I3(tx_en), .O(n314)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd000 */ ;
    defparam LUT__485.LUTMASK = 16'hd000;
    EFX_LUT4 LUT__486 (.I0(\gpo_inst/gp_config_reg[1] ), .I1(\data_from_led[1] ), 
            .I2(\reg_addr[0] ), .O(n315)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__486.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__487 (.I0(n315), .I1(n311), .I2(\spi_slave_inst/d_o[0] ), 
            .I3(n314), .O(\spi_slave_inst/n138 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__487.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__488 (.I0(\gpo_inst/gp_config_reg[2] ), .I1(\data_from_led[2] ), 
            .I2(\reg_addr[0] ), .O(n316)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__488.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__489 (.I0(n316), .I1(n311), .I2(\spi_slave_inst/d_o[1] ), 
            .I3(n314), .O(\spi_slave_inst/n137 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__489.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__490 (.I0(\gpo_inst/gp_config_reg[3] ), .I1(\data_from_led[3] ), 
            .I2(\reg_addr[0] ), .O(n317)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__490.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__491 (.I0(n317), .I1(n311), .I2(\spi_slave_inst/d_o[2] ), 
            .I3(n314), .O(\spi_slave_inst/n136 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__491.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__492 (.I0(\gpo_inst/gp_config_reg[4] ), .I1(\data_from_led[4] ), 
            .I2(\reg_addr[0] ), .O(n318)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__492.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__493 (.I0(n318), .I1(n311), .I2(\spi_slave_inst/d_o[3] ), 
            .I3(n314), .O(\spi_slave_inst/n135 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__493.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__494 (.I0(\gpo_inst/gp_config_reg[5] ), .I1(\data_from_led[5] ), 
            .I2(\reg_addr[0] ), .O(n319)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__494.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__495 (.I0(n319), .I1(n311), .I2(\spi_slave_inst/d_o[4] ), 
            .I3(n314), .O(\spi_slave_inst/n134 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__495.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__496 (.I0(\gpo_inst/gp_config_reg[6] ), .I1(\data_from_led[6] ), 
            .I2(\reg_addr[0] ), .O(n320)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__496.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__497 (.I0(n320), .I1(n311), .I2(\spi_slave_inst/d_o[5] ), 
            .I3(n314), .O(\spi_slave_inst/n133 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__497.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__498 (.I0(\gpo_inst/gp_config_reg[7] ), .I1(\data_from_led[7] ), 
            .I2(\reg_addr[0] ), .O(n321)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__498.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__499 (.I0(n321), .I1(n311), .I2(\spi_slave_inst/d_o[6] ), 
            .I3(n314), .O(\spi_slave_inst/n132 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf444 */ ;
    defparam LUT__499.LUTMASK = 16'hf444;
    EFX_LUT4 LUT__500 (.I0(n308), .I1(\rx_d[0] ), .O(\spi_slave_inst/n173 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__500.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__501 (.I0(n308), .I1(\rx_d[1] ), .O(\spi_slave_inst/n172 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__501.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__502 (.I0(n308), .I1(\rx_d[2] ), .O(\spi_slave_inst/n171 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__502.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__503 (.I0(n308), .I1(\rx_d[3] ), .O(\spi_slave_inst/n170 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__503.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__504 (.I0(n308), .I1(\rx_d[4] ), .O(\spi_slave_inst/n169 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__504.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__505 (.I0(n308), .I1(\rx_d[5] ), .O(\spi_slave_inst/n168 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__505.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__506 (.I0(n308), .I1(\rx_d[6] ), .O(\spi_slave_inst/n167 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__506.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__507 (.I0(\reg_addr[0] ), .I1(tx_en), .O(n322)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__507.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__508 (.I0(\led_inst/ctr_cfg_reg[7] ), .I1(n322), .O(\led_inst/n41 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__508.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__509 (.I0(\led_inst/ctr_cfg_reg[6] ), .I1(n322), .O(\led_inst/n42 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__509.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__510 (.I0(\led_inst/ctr_cfg_reg[5] ), .I1(n322), .O(\led_inst/n43 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__510.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__511 (.I0(\led_inst/ctr_cfg_reg[4] ), .I1(n322), .O(\led_inst/n44 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__511.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__512 (.I0(\led_inst/ctr_cfg_reg[3] ), .I1(n322), .O(\led_inst/n45 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__512.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__513 (.I0(\led_inst/ctr_cfg_reg[0] ), .I1(n322), .O(\led_inst/n48 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__513.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__514 (.I0(\led_inst/ctr_cfg_reg[2] ), .I1(n322), .O(\led_inst/n46 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__514.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__515 (.I0(\led_inst/ctr_cfg_reg[1] ), .I1(n322), .O(\led_inst/n47 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__515.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__516 (.I0(\led_inst/counter[18] ), .I1(\led_inst/ctr_cfg_reg[2] ), 
            .O(n323)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__516.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__517 (.I0(\led_inst/counter[17] ), .I1(\led_inst/counter[16] ), 
            .I2(\led_inst/ctr_cfg_reg[1] ), .I3(\led_inst/ctr_cfg_reg[0] ), 
            .O(n324)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8eaf */ ;
    defparam LUT__517.LUTMASK = 16'h8eaf;
    EFX_LUT4 LUT__518 (.I0(\led_inst/ctr_cfg_reg[3] ), .I1(\led_inst/counter[19] ), 
            .I2(\led_inst/ctr_cfg_reg[2] ), .I3(\led_inst/counter[18] ), 
            .O(n325)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;
    defparam LUT__518.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__519 (.I0(\led_inst/counter[20] ), .I1(\led_inst/ctr_cfg_reg[4] ), 
            .I2(\led_inst/counter[19] ), .I3(\led_inst/ctr_cfg_reg[3] ), 
            .O(n326)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;
    defparam LUT__519.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__520 (.I0(n323), .I1(n324), .I2(n325), .I3(n326), .O(n327)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__520.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__521 (.I0(\led_inst/ctr_cfg_reg[7] ), .I1(\led_inst/counter[23] ), 
            .I2(\led_inst/ctr_cfg_reg[6] ), .I3(\led_inst/counter[22] ), 
            .O(n328)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;
    defparam LUT__521.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__522 (.I0(\led_inst/ctr_cfg_reg[5] ), .I1(\led_inst/counter[21] ), 
            .I2(\led_inst/ctr_cfg_reg[4] ), .I3(\led_inst/counter[20] ), 
            .O(n329)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0bb */ ;
    defparam LUT__522.LUTMASK = 16'hb0bb;
    EFX_LUT4 LUT__523 (.I0(n328), .I1(n329), .O(n330)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__523.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__524 (.I0(\led_inst/counter[22] ), .I1(\led_inst/counter[21] ), 
            .I2(\led_inst/ctr_cfg_reg[6] ), .I3(\led_inst/ctr_cfg_reg[5] ), 
            .O(n331)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8eaf */ ;
    defparam LUT__524.LUTMASK = 16'h8eaf;
    EFX_LUT4 LUT__525 (.I0(\led_inst/counter[23] ), .I1(\led_inst/ctr_cfg_reg[7] ), 
            .I2(n331), .O(n332)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb2b2 */ ;
    defparam LUT__525.LUTMASK = 16'hb2b2;
    EFX_LUT4 LUT__526 (.I0(n327), .I1(n330), .I2(n332), .I3(\led_inst/counter[0] ), 
            .O(\led_inst/n142 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h004f */ ;
    defparam LUT__526.LUTMASK = 16'h004f;
    EFX_LUT4 LUT__527 (.I0(\reg_addr[1] ), .I1(\reg_addr[2] ), .O(n333)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__527.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__528 (.I0(addr_dv), .I1(rxdv), .O(n334)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__528.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__529 (.I0(rw_out), .I1(\reg_addr[0] ), .I2(n333), .I3(n334), 
            .O(rx_en_led)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__529.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__530 (.I0(\rx_d[0] ), .I1(rx_en_led), .O(\data_to_led[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__530.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__531 (.I0(n327), .I1(n330), .I2(n332), .O(\led_inst/LessThan_21/n48 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb0b0 */ ;
    defparam LUT__531.LUTMASK = 16'hb0b0;
    EFX_LUT4 LUT__532 (.I0(n327), .I1(n330), .I2(n332), .I3(n16), .O(\led_inst/n141 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__532.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__533 (.I0(n327), .I1(n330), .I2(n332), .I3(n138), .O(\led_inst/n140 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__533.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__534 (.I0(n327), .I1(n330), .I2(n332), .I3(n136), .O(\led_inst/n139 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__534.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__535 (.I0(n327), .I1(n330), .I2(n332), .I3(n134), .O(\led_inst/n138 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__535.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__536 (.I0(n327), .I1(n330), .I2(n332), .I3(n132), .O(\led_inst/n137 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__536.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__537 (.I0(n327), .I1(n330), .I2(n332), .I3(n130), .O(\led_inst/n136 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__537.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__538 (.I0(n327), .I1(n330), .I2(n332), .I3(n128), .O(\led_inst/n135 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__538.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__539 (.I0(n327), .I1(n330), .I2(n332), .I3(n126), .O(\led_inst/n134 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__539.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__540 (.I0(n327), .I1(n330), .I2(n332), .I3(n124), .O(\led_inst/n133 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__540.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__541 (.I0(n327), .I1(n330), .I2(n332), .I3(n122), .O(\led_inst/n132 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__541.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__542 (.I0(n327), .I1(n330), .I2(n332), .I3(n120), .O(\led_inst/n131 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__542.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__543 (.I0(n327), .I1(n330), .I2(n332), .I3(n118), .O(\led_inst/n130 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__543.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__544 (.I0(n327), .I1(n330), .I2(n332), .I3(n116), .O(\led_inst/n129 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__544.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__545 (.I0(n327), .I1(n330), .I2(n332), .I3(n114), .O(\led_inst/n128 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__545.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__546 (.I0(n327), .I1(n330), .I2(n332), .I3(n112), .O(\led_inst/n127 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__546.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__547 (.I0(n327), .I1(n330), .I2(n332), .I3(n110), .O(\led_inst/n126 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__547.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__548 (.I0(n327), .I1(n330), .I2(n332), .I3(n108), .O(\led_inst/n125 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__548.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__549 (.I0(n327), .I1(n330), .I2(n332), .I3(n106), .O(\led_inst/n124 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__549.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__550 (.I0(n327), .I1(n330), .I2(n332), .I3(n104), .O(\led_inst/n123 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__550.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__551 (.I0(n327), .I1(n330), .I2(n332), .I3(n102), .O(\led_inst/n122 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__551.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__552 (.I0(n327), .I1(n330), .I2(n332), .I3(n100), .O(\led_inst/n121 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__552.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__553 (.I0(n327), .I1(n330), .I2(n332), .I3(n98), .O(\led_inst/n120 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__553.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__554 (.I0(n327), .I1(n330), .I2(n332), .I3(n97), .O(\led_inst/n119 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f00 */ ;
    defparam LUT__554.LUTMASK = 16'h4f00;
    EFX_LUT4 LUT__555 (.I0(\rx_d[1] ), .I1(rx_en_led), .O(\data_to_led[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__555.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__556 (.I0(\rx_d[2] ), .I1(rx_en_led), .O(\data_to_led[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__556.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__557 (.I0(\rx_d[3] ), .I1(rx_en_led), .O(\data_to_led[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__557.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__558 (.I0(\rx_d[4] ), .I1(rx_en_led), .O(\data_to_led[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__558.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__559 (.I0(\rx_d[5] ), .I1(rx_en_led), .O(\data_to_led[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__559.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__560 (.I0(\rx_d[6] ), .I1(rx_en_led), .O(\data_to_led[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__560.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__561 (.I0(\rx_d[7] ), .I1(rx_en_led), .O(\data_to_led[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__561.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__562 (.I0(rw_out), .I1(\reg_addr[0] ), .I2(n333), .I3(n334), 
            .O(rx_en_gpo)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__562.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__563 (.I0(\rx_d[0] ), .I1(rx_en_gpo), .O(\data_to_gpo[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__563.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__564 (.I0(\rx_d[1] ), .I1(rx_en_gpo), .O(\data_to_gpo[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__564.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__565 (.I0(\rx_d[2] ), .I1(rx_en_gpo), .O(\data_to_gpo[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__565.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__566 (.I0(\rx_d[3] ), .I1(rx_en_gpo), .O(\data_to_gpo[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__566.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__567 (.I0(\rx_d[4] ), .I1(rx_en_gpo), .O(\data_to_gpo[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__567.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__568 (.I0(\rx_d[5] ), .I1(rx_en_gpo), .O(\data_to_gpo[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__568.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__569 (.I0(\rx_d[6] ), .I1(rx_en_gpo), .O(\data_to_gpo[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__569.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__570 (.I0(\rx_d[7] ), .I1(rx_en_gpo), .O(\data_to_gpo[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__570.LUTMASK = 16'h8888;
    EFX_GBUFCE CLKBUF__0 (.CE(1'b1), .I(INPUT_CLK), .O(\INPUT_CLK~O )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_GBUFCE, CE_POLARITY=1'b1 */ ;
    defparam CLKBUF__0.CE_POLARITY = 1'b1;
    
endmodule

//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5cc5d008_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5cc5d008_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5cc5d008_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5cc5d008_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5cc5d008_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_ADD_5cc5d008_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_15
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_16
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_17
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_18
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_19
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_20
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_21
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_22
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5cc5d008_23
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_GBUFCE_5cc5d008_0
// module not written out since it is a black box. 
//

