module regwrap_tb();
`timescale 1ns / 100ps

logic clk;
logic reset_n;
logic rd_en_gpo;
logic rd_en_led;
logic wr_en_gpo;
logic wr_en_led;
logic [7:0] tx_d;
logic [6:0] addr;
logic addr_dv;
logic rxdv;
logic rw_out;
logic [7:0] rx_d;
logic [7:0] data_out_gpo;
logic [7:0] data_out_led;
logic [7:0] data_in_gpo;
logic [7:0] data_in_led;

regwrap regwrap_inst (
    .clk     	(clk),
    .reset_n 	(reset_n),
	.rd_en_gpo		(rd_en_gpo),
	.rd_en_led		(rd_en_led),
	.wr_en_gpo		(wr_en_gpo),
	.wr_en_led		(wr_en_led),
	.tx_d			(tx_d),
	.addr			(addr),
	.addr_dv		(addr_dv),
	.rxdv			(rxdv),
	.rw_out			(rw_out),
	.rx_d			(rx_d),
	.data_out_gpo	(data_out_gpo),
	.data_out_led	(data_out_led),
	.data_in_gpo	(data_in_gpo),
	.data_in_led	(data_in_led)

	);
	
	always #10 clk = ~clk;  
	
	initial begin
		
		#3 clk = 1'b0;
		
		#4 reset_n = 1'b0;
		#40 reset_n = 1'b1;
		#1  addr_dv = 1'b0;
		#1  rxdv = 1'b0;
		#1  rw_out = 1'b0;
		#1 rx_d = 8'b1010_0101;
		#1 data_out_gpo = 8'b0101_0101;
		#1 data_out_led = 8'b1010_1010;
		
		#60 addr = 7'b111_0101;
		#50 addr_dv = 1'b1;
		#1  rxdv = 1'b1;

		
		#80 rxdv= 1'b0;
		addr_dv = 1'b0;
		rw_out = 1'b1;
		#80 addr = 8'b10100100;
		addr_dv = 1'b1;
		rxdv = 1'b1;
		#80 rw_out = 1'b0;

	end
	
endmodule