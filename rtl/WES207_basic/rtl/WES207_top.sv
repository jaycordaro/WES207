module WES207_top(
		//input INPUT_CLK,
		input pll_clk,
		input reset_n,
		input tx_slowclk,    // slowclk to LVDS block
		//input logic sclk,
		//input logic ws,
		//output logic sdo,
		output logic led0, led1,
		input logic SCLK, 
		input logic SSB,
		input logic MOSI,
		output logic MISO,
		output logic [6:0] gpo_pins,
		output [1:0] lvds_tx_inst1_DATA
		);
		
	logic clk;
	//logic clk_90;

	logic [6:0] reg_addr;
	
	logic [7:0] tx_d;
	logic [7:0] rx_d;
	logic [7:0] data_from_gpo;
	logic [7:0] data_in;
	logic [7:0] data_out;
	logic [7:0] data_to_gpo;
	logic [7:0] data_to_led;
	logic [7:0] data_from_led;
	logic [7:0] data_from_fifo;
	logic [7:0] data_to_fifo;
	logic [7:0] data_from_fifo_length;
	logic [7:0] data_to_fifo_length;
	
	logic tx_slowclk;
	
	assign clk = pll_clk;
	//assign clk_90 = pll_clk_90;
	
	//assign tx_en_lvds = 1'b1;
	
	logic [1:0] to_lvds;
	
	assign lvds_tx_inst1_DATA = to_lvds;
	
	//logic tx_en_lvds;

	spi_slave #(
	.pktsz(16),
	.header(8),
	.payload(8),
	.addrsz(7)
	)spi_slave_inst  (
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
	.rx_en_status		 (rx_en_status),
	.rx_en_tx_packet_len (rx_en_tx_packet_len),
	.rx_en_tx_packet	 (rx_en_tx_packet),
	.rx_en_rx_packet_len (rx_en_rx_packet_len),
	.rx_en_rx_packet	 (rx_en_rx_packet),
	.rx_en_led		(rx_en_led),
	.rx_en_dac		(rx_en_dac),
	.rx_en_fifo     (rx_en_fifo),
	.rx_en_fifo_length (rx_en_fifo_length),
	.tx_en_gpo		(tx_en_gpo),
	.tx_en_status	(tx_en_status),
	.tx_en_tx_packet_len (tx_en_tx_packet_len),
	.tx_en_tx_packet	 (tx_en_tx_packet),
	.tx_en_rx_packet_len (tx_en_rx_packet_len),
	.tx_en_rx_packet	 (tx_en_rx_packet),
	.tx_en_led		(tx_en_led),
	.tx_en_dac		(tx_en_dac),
	.tx_en_fifo     (tx_en_fifo),
	.tx_en_fifo_length (tx_en_fifo_length),
	.tx_d			(tx_d),
	.tx_en			(tx_en),
	.reg_addr		(reg_addr),
	.addr_dv		(addr_dv),
	.rxdv			(rxdv),
	.rw_out			(rw_out),
	.rx_d			(rx_d),
	.data_from_gpo	(data_from_gpo),
	.data_from_status_reg 		 (data_from_status_reg),
	.data_from_tx_packet_len_reg (data_from_tx_packet_len_reg),
	.data_from_tx_packet_reg 	 (data_from_tx_packet_reg),
	.data_from_rx_packet_len_reg (data_from_rx_packet_len_reg),
	.data_from_rx_packet_reg 	 (data_from_rx_packet_reg),
	.data_from_led	(data_from_led),
	.data_from_dac	(data_from_dac),
	.data_from_fifo (data_from_fifo),
	.data_from_fifo_length (data_from_fifo_length),
	.data_to_gpo	(data_to_gpo),
	.data_to_status_reg (data_to_status_reg),
	.data_to_tx_packet_len_reg	(data_to_tx_packet_len_reg),
	.data_to_tx_packet_reg		(data_to_tx_packet_reg),
	.data_to_rx_packet_len_reg	(data_to_rx_packet_len_reg),
	.data_to_rx_packet_reg		(data_to_rx_packet_reg),
	.data_to_led	(data_to_led),
	.data_to_dac	(data_to_dac),
	.data_to_fifo   (data_to_fifo),
	.data_to_fifo_length (data_to_fifo_length)
	);
	
tx_dac_fsm tx_dac_fsm_inst (
	.clk				(tx_slowclk),
	.reset_n 			(reset_n),
	.rd_en				(tx_en_dac),
	.wr_en				(rx_en_dac),
	.dacreg_data_in		(data_to_dac),
	.dacreg_data_out	(data_from_dac),
	.to_lvds			(to_lvds)
	);
	
fifo fifo_inst(
	.clk  			(clk),
	.reset_n 		(reset_n),
	.rd_en 			(tx_en_fifo),
	.wr_en			(rx_en_fifo),
	.data_in		(data_to_fifo),
	.data_out		(data_from_fifo),
	.length_rd_en 	(tx_en_fifo_length),
	.length_wr_en	(rx_en_fifo_length),
	.length_in		(data_to_fifo_length),
	.length_out		(data_from_fifo_length),
	.full           (fifo_full),
	.read_complete  (fifo_read_complete)
	);
	
	
endmodule : WES207_top