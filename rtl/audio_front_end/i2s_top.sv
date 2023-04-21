module i2s_top(
		input INPUT_CLK,
		input reset_n,
		input logic sclk,
		input logic ws,
		output logic sdo,
		output logic led0, led1,
		input logic SCLK, 
		input logic SSB,
		input logic MOSI,
		output logic MISO,
		output logic [6:0] gpo_pins
		);
		
	logic clk;
	logic [15:0] word_data;
	logic [4:0] addr;
	logic [6:0] reg_addr;
	
	//logic [31:0] word_data;
	
	pll	pll_inst (
		.inclk0 ( INPUT_CLK ),
		.c0 	( clk ),
		);
	
	i2srom	i2srom_inst (
		.address	(addr),	
		.clock		(clk),
		.q			(word_data)
	);
		
	i2s_play i2s_play_inst(
		.clk 			(clk),
		.sclk			(sclk),
		.reset_n 		(reset_n),
		.addr			(addr),
		.word_data		(word_data),
		.ws				(ws),
		.sdo			(sdo)	
	);
	
	spi_slave #(
	.pktsz   ( 16 ),
	.header  ( 8 ),
	.payload ( 8 ),
	.addrsz  ( 7 )
	) 
  
	spi_slave_inst  (
	.clk     	(clk),
	.reset_n 	(reset_n),
	.SCLK	    (SCLK),
	.SSB		(SSB),
	.MOSI		(MOSI),
	.MISO		(MISO),
	.tx_d		(tx_d),
	.tx_en		(tx_en),
	.reg_addr 		(reg_addr),
	.addr_dv	(addr_dv),
	.rx_d		(rx_d),
	.rxdv		(rxdv),
	.rw_out		(rw_out)
	);
			
led led_inst(
	.clk  			(clk),
	.reset_n 		(reset_n),
	.rd_en 			(tx_en_led),
	.wr_en			(rx_en_led),
	.data_in		(data_to_led),
	.data_out		(data_from_led),
	.led0       	(led0),
	.led1       	(led1)
	);
	
gpo gpo_inst(
	.clk  			(clk),
	.reset_n 		(reset_n),
	.rd_en 			(tx_en_gpo),
	.wr_en			(rx_en_gpo),
	.data_in		(data_to_gpo),
	.data_out		(data_from_gpo),
	.gpo_pins		(gpo_pins)
	);
	
regwrap regwrap_inst (
    .clk     		(clk),
    .reset_n 		(reset_n),
	.rx_en_gpo		(rx_en_gpo),
	.rx_en_led		(rx_en_led),
	.tx_en_gpo		(tx_en_gpo),
	.tx_en_led		(tx_en_led),
	.tx_d			(tx_d),
	.tx_en			(tx_en),
	.reg_addr		(reg_addr),
	.addr_dv		(addr_dv),
	.rxdv			(rxdv),
	.rw_out			(rw_out),
	.rx_d			(rx_d),
	.data_from_gpo	(data_from_gpo),
	.data_from_led	(data_from_led),
	.data_to_gpo	(data_to_gpo),
	.data_to_led	(data_to_led)
	);
	
	
endmodule : i2s_top