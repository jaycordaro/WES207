module top_tb();
`timescale 1ns / 1ps

logic clk;
logic reset_n;

logic [15:0] word_data;
logic  [4:0] addr;
logic sclk;
logic ws;
logic sdo;


i2srom	i2srom_inst (
		.address 	(addr),	
		.clock		(clk),
		.q			(word_data)
		);

i2s_play i2s_play_inst(
		.clk 		(clk),
		.sclk		(sclk),
		.reset_n 	(reset_n),
		.addr		(addr),
		.word_data	(word_data),
		.ws			(ws),
		.sdo		(sdo)	
		);
	
always #10 clk = ~clk; 

task do_ws_high();
int i;

begin
	sclk=1'b1;
	ws=1'b1;
	for (i=0;i<31;i++)
	begin
		#488.281 sclk=1'b0;
		#488.281 sclk=1'b1;
	end
end
endtask

task do_ws_low();
int i;

begin
	sclk=1'b1;
	ws=1'b0;
	for (i=0;i<31;i++)
	begin
		#488.281 sclk=1'b0;
		#488.281 sclk=1'b1;
	end
end
endtask

initial begin //

    $dumpfile("i2s_tb.vcd");
	$display($time, " << Starting the Simulation >>");
    $dumpvars;

	#3 clk = 1'b0;
	
	#4 reset_n = 0;
	#40 reset_n = 1;
	#10 sclk = 1'b0;
	#50
	$display($time, " << rising edge WS >>");
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	do_ws_high();
	do_ws_low();
	end
endmodule : top_tb