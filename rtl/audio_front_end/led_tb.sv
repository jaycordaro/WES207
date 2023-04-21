module led_tb();
`timescale 1ns / 100ps

logic clk;
logic reset_n;
logic rd_en;
logic wr_en;
logic [7:0] data_in;
logic [7:0] data_out;
logic led0, led1;

led led_inst (
    .clk     	(clk),
    .reset_n 	(reset_n),
	.rd_en		(rd_en),
	.wr_en		(wr_en),
	.data_in	(data_in),
	.data_out	(data_out),
	.led0		(led0),
	.led1		(led1)
	);
	
	always #10 clk = ~clk;  
	
	initial begin
		
		#3 clk = 1'b0;
		
		#4 reset_n = 1'b0;
		#40 reset_n = 1'b1;
		#50 wr_en = 1'b0;
		#10 rd_en = 1'b0;
		#20 data_in = 8'b1010_1010;
		#50  wr_en = 1'b1;	

		#150 wr_en = 1'b0;

		#200 rd_en = 1'b1;
		#200 rd_en = 1'b0;
	end
	
endmodule