module WES207_pdm_top(
					input pll_15p36,    // 15.36MHz SYSCLK
					input pll_p768,		// 768kHz PDMCLK
					input pll_p512,		// 512kHz I2S CLK
					input reset_n,
					output logic led0, led1,
					input  logic SCLK, 
					input  logic SSB,
					input  logic MOSI,
					output logic MISO,
					output logic SDO,
					output logic i2s_clk,
					output logic WS,
					input  logic PDMDAT,
					output logic PDMCLK);	
				
	logic [31:0] data_to_led;
	logic [31:0] data_from_led;
	
	logic [6:0] reg_addr;
	
	logic [31:0] tx_d;
	logic [31:0] rx_d;
	
	logic [31:0] data_to_egress_FIFO;
	logic [31:0] data_from_egress_FIFO;
	
	logic [15:0] pcm_out;
	logic [15:0] hb_1_in;
	logic [15:0] hb_1_out;
	
	logic [15:0] hb_2_in;
	logic [15:0] hb_2_out;
	logic [15:0] word_data;
	
	assign i2s_clk = pll_p512;
	assign clk = pll_15p36;

	always_ff @(posedge pll_p768 or negedge reset_n)
		if (~reset_n)
			PDMCLK <= 1'b0;
		else
			PDMCLK = ~PDMCLK;
	
	generate_clks generate_clks_inst(
		.i2s_clk	(i2s_clk),
		.reset_n	(reset_n),
		.pll_0p064	(pll_0p064),
		.pll_0p032	(pll_0p032)
	);
	
	spi_slave #(
		.pktsz(40),
		.header(8),
		.payload(32),
		.addrsz(7)
	)spi_slave_inst  (
		.clk     	(pll_15p36),
		.reset_n 	(reset_n),
		.SCLK	    (SCLK),
		.SSB		(SSB),
		.MOSI		(MOSI),
		.MISO		(MISO),
		.tx_d		(tx_d),
		.tx_en		(tx_en),
		.reg_addr 	(reg_addr),
		.addr_dv	(addr_dv), 
		.rx_d		(rx_d),
		.rxdv		(rxdv),
		.rw_out		(rw_out)
	);
	
	regwrap regwrap_inst (
		.clk     		(clk),
		.reset_n 		(reset_n),
		.rx_en_led		(rx_en_led),
		.tx_en_led		(tx_en_led),
		.tx_d			(tx_d),
		.tx_en			(tx_en),
		.reg_addr		(reg_addr),
		.addr_dv		(addr_dv),
		.rxdv			(rxdv),
		.rw_out			(rw_out),
		.rx_d			(rx_d),
		.data_from_led	(data_from_led),
		.data_to_led	(data_to_led)
	);
	
	// generate WS 
	generate_ws generate_ws_inst(
		.i2s_clk	(i2s_clk),
		.reset_n	(reset_n),
		.ws_out		(ws_out)
	);
	
	assign WS = ws_out;
	
	led led_inst(
		.clk 		 	(pll_15p36),
		.reset_n 		(reset_n),
		.rd_en 			(tx_en_led),
		.wr_en			(rx_en_led),
		.data_in		(data_to_led),
		.data_out		(data_from_led),
		.led0       	(led0),
		.led1       	(led1)
	);
	
	polyphase_ds_decim polyphase_ds_decim(
		.clk			(pll_p768),
		.reset_n		(reset_n),
		.x_in			(PDMDAT),  
		.pcm_out		(pcm_out),
		.to_avalid		(avalid1),
		.from_aready	(aready1)
	);
		
  multibit_fifo_sync #(
		.DATA_WIDTH(16)
	) 	fifo_inst_1 (
		.aclk			(pll_p768),
		.areset_n		(reset_n),
		.avalid			(avalid1),
		.adata			(pcm_out),
		.aready			(aready1),
		.bclk		 	(pll_0p064),
		.breset_n		(reset_n),
		.bvalid			(bvalid1),
		.bdata			(hb_1_in),
		.bready			(bready1)
  );
	
	hb_filter hb_filter_inst1(
		.clk			(pll_0p064),
		.reset_n		(reset_n),
		.x_in			(hb_1_in),    
		.y_out			(hb_1_out),
		.to_bready		(bready1),
		.from_bvalid	(bvalid1),
		.to_avalid		(avalid2),
		.from_aready	(aready2)
	);
	
	multibit_fifo_sync #(
		.DATA_WIDTH(16)
	) 	fifo_inst_2 (
		.aclk			(pll_0p064),
		.areset_n		(reset_n),
		.avalid			(avalid2),
		.adata			(hb_1_out),
		.aready			(aready2),
		.bclk			(pll_0p032),
		.breset_n		(reset_n),
		.bvalid			(bvalid2),
		.bdata			(hb_2_in),
		.bready			(bready2)
  );
		
	hb_filter hb_filter_inst2(
		.clk			(pll_0p032),
		.reset_n		(reset_n),
		.x_in			(hb_2_in),    
		.y_out			(hb_2_out),
		.to_bready		(bready2),
		.from_bvalid	(bvalid2),
		.to_avalid		(avalid3),
		.from_aready	(aready3)
	);
	
	multibit_fifo_sync #(
		.DATA_WIDTH(16)
	) 	fifo_inst_3 (
		.aclk			(pll_0p032),
		.areset_n		(areset3),
		.avalid			(avalid3),
		.adata			(hb_2_out),
		.aready			(aready3),
		.bclk			(WS),
		.breset_n		(breset3),
		.bvalid			(bvalid3),
		.bdata			(word_data),
		.bready			(bready3)
  );
				
	i2s_player i2s_player_inst(
		.clk			(pll_15p36),
		.sclk			(i2s_clk),
		.reset_n		(reset_n),
		.word_data		(word_data),
		.ws				(WS),
		.sdo			(SDO),
		.from_bvalid	(bvalid3),
		.to_bready		(bready3)
	);	

endmodule : WES207_pdm_top
				