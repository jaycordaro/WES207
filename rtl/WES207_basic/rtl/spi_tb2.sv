// spi_tb
// jay cordaro
//
// Testbench for spi.sv module

`timescale 1ns / 100ps

module spi_tb2();

logic clk;
logic reset_n;

logic SCLK;
logic SSB;
logic MOSI;
logic MISO;
logic [7:0] tx_d;
logic [6:0] reg_addr;
logic addr_dv;
logic [7:0] rx_d;
logic rxdv;
logic [7:0] check_data;

	logic [7:0] data_from_gpo;

	logic [7:0] data_to_gpo;
	logic [7:0] data_to_led;
	logic [7:0] data_from_led;
	logic [7:0] data_from_fifo;
	logic [7:0] data_to_fifo;
	logic [7:0] data_from_fifo_length;
	logic [7:0] data_to_fifo_length;
	logic [7:0] data_from_status_reg;
	logic [7:0] data_from_tx_packet_len_reg;
	logic [7:0] data_from_tx_packet_reg;
	logic [7:0] data_from_rx_packet_len_reg;
	logic [7:0] data_from_rx_packet_reg;
	logic [7:0] data_to_status_reg;
	logic [7:0] data_to_tx_packet_len_reg;
	logic [7:0] data_to_tx_packet_reg;
	logic [7:0] data_to_rx_packet_len_reg;
	logic [7:0] data_to_rx_packet_reg;

logic [6:0] gpo_pins;
spi_slave #(
  .pktsz   ( 16 ),
  .header  ( 8 ),
  .payload ( 8 ),
  .addrsz  ( 7 )
  ) 
  spi_slave_inst  (
  .clk     	(clk),
  .reset_n 	(reset_n),
  .SCLK	   	(SCLK),
  .SSB		(SSB),
  .MOSI		(MOSI),
  .MISO		(MISO),
  .tx_d		(tx_d),
  .tx_en	(tx_en),
  .reg_addr (reg_addr),
  .addr_dv	(addr_dv),
  .rx_d		(rx_d),
  //.rxer	(rxer)
  .rxdv		(rxdv),
  .rw_out	(rw_out)
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
	.input_en_tx_packet_len (input_en_tx_packet_len),
	.input_en_tx_packet	 (input_en_tx_packet),
	.input_en_rx_packet_len (input_en_rx_packet_len_null),
	.input_en_rx_packet	 (input_en_rx_packet_null),
	.rx_en_led		(rx_en_led),
	.rx_en_dac		(rx_en_dac),
	.rx_en_fifo     (rx_en_fifo),
	.rx_en_fifo_length (rx_en_fifo_length),
	.tx_en_gpo		(tx_en_gpo),
	.tx_en_status	(tx_en_status),
	.output_en_tx_packet_len (output_en_tx_packet_len_null),
	.output_en_tx_packet	 (output_en_tx_packet_null),
	.output_en_rx_packet_len (output_en_rx_packet_len),
	.output_en_rx_packet	 (output_en_rx_packet),
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
	.data_from_tx_packet_len_reg (data_from_tx_packet_len_reg_null),
	.data_from_tx_packet_reg 	 (data_from_tx_packet_reg_null),
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
	.data_to_rx_packet_len_reg	(data_to_rx_packet_len_reg_null),
	.data_to_rx_packet_reg		(data_to_rx_packet_reg_null),
	.data_to_led	(data_to_led),
	.data_to_dac	(data_to_dac),
	.data_to_fifo   (data_to_fifo),
	.data_to_fifo_length (data_to_fifo_length),
	.tx_rdy         (tx_fifo_read_complete),
	.rx_rdy			(rx_fifo_full),
	.rx_n_rdy		(rx_fifo_read_complete)
	);
	
	
fifo fifo_inst(
	.clk  			(clk),
	.reset_n 		(reset_n),
	.output_en 		(tx_en_fifo),
	.input_en		(rx_en_fifo),
	.data_in		(data_to_fifo),
	.data_out		(data_from_fifo),
	.length_output_en (tx_en_fifo_length),
	.length_input_en (rx_en_fifo_length),
	.length_in		(data_to_fifo_length),
	.length_out		(data_from_fifo_length),
	.full           (fifo_full),
	.read_complete  (fifo_read_complete)
	);
	

  	always #10 clk = ~clk;  

task do_spi_read;
	input [7:0] from_host;
	input [7:0] data_to_host;
	int i;
	
	begin
	#1 SSB =1'b1;
       MOSI = 1'b0;
	#5 SCLK = 1'b0;
	   check_data = 0;
	#40 SSB = 1'b0;
	tx_d=data_to_host;
		for (i=0;i<8;i++)
		begin
		    if (i==0)
			    MOSI = 1'b0;
			#55 SCLK = 1'b0;
			MOSI = from_host[7-i];
			#55 SCLK = 1'b1;
		end
		for (i=0;i<=7;i++)
		begin
			#55 SCLK = 1'b0;
			#55 SCLK = 1'b1;
			check_data = {check_data[6:0], MISO};
		end
		
	if (check_data != data_to_host)
		$display("ERROR: SPI READ expected %b, got %b", data_to_host, check_data);
	else
		$display("Success:  SPI READ expected %b, got %b", data_to_host, check_data);
	MOSI=1'b0;
	//	check_data = {check_data[6:0], MISO};
	#50 SCLK=1'b0;
		MOSI=1'b0;
	#50 SCLK=1'b0;
	#50 SSB=1'b1;
	#50 SSB=1'b1;
	end
endtask

task do_spi_write;
	input [15:0] from_host;

	int i;
	
	begin
	#1 SSB =1'b1;
       MOSI = 1'b0;
	#5 SCLK = 1'b0;
	   check_data = 0;
	#40 SSB = 1'b0;

		for (i=0;i<8;i++)
		begin
		    if (i==0)
			    MOSI = 1'b0;
			#55 SCLK = 1'b0;
			MOSI = from_host[15-i];
			check_data = {check_data[6:0], MOSI};
			#55 SCLK = 1'b1;
		end
		
		#55
		
		if (reg_addr != check_data[6:0])
			$display("ERROR: ADDRESS for WRITE expected %b, got %b", check_data[6:0], reg_addr);
		else
			$display("Success: ADDRESS for WRITE expected %b, got %b", check_data[6:0], reg_addr);
		check_data = 0;
		for (i=8;i<=15;i++)
		begin
			#55 SCLK = 1'b0;
			#55 SCLK = 1'b1;
			MOSI = from_host[15-i];
			check_data = {check_data[6:0], MOSI};
			#55 SCLK = 1'b1;
			
		end
	
	MOSI=1'b0;
	//	check_data = {check_data[6:0], MISO};
	#50 SCLK=1'b0;
		
	if (rx_d != from_host[7:0])
				$display("ERROR: write expected %b, got %b", from_host[7:0], rx_d);
		else
			$display("Success: write expected %b, got %b", from_host[7:0], rx_d);
		MOSI=1'b0;
	#50 SCLK=1'b0;
	#50 SSB=1'b1;
	#50 SSB=1'b1;
	end
endtask


	
  initial begin   // 
  
  
 // create 50MHz clock
    $dumpfile("clk_tb.vcd");
	$display($time, " << Starting the Simulation >>");
    $dumpvars;
	#3 clk = 1'b0;
	
	#4 reset_n = 0;
	#10 MOSI=1'b0;
	#40 reset_n = 1;
	
	$display($time, " << spi_write length >>");
	do_spi_write(16'b0000_1001_0000_0011);
	MOSI= 1'b1;
	
	$display($time, " << spi_read length >>");
	do_spi_read(8'b1000_1001, 8'b0000_0011);
	MOSI= 1'b1;
	
	$display($time, " << 1 spi_write >>");
	do_spi_write(16'b0000_1000_0000_0001);
	MOSI= 1'b1;
	
	#50
	$display($time, " << 2 spi_write >>");
	do_spi_write(16'b0000_1000_0000_0010);
	MOSI= 1'b1;
	
	#50
	$display($time, " << 3 spi_write >>");
	do_spi_write(16'b0000_1000_0000_0011);
	MOSI= 1'b1;
	
	if(fifo_full != 1'b1)
			$display("ERROR: fifo full is not indicated!");
		else
			$display("Success: fifo full is set");
	
	#50
	$display($time, " << 4 spi_read >>");
	do_spi_read(8'b1000_1000, 8'b0000_0001);
	MOSI= 1'b1;
	
	#50
	$display($time, " << 5 spi_read >>");
	do_spi_read(8'b1000_1000, 8'b0000_0010);
	MOSI= 1'b1;
	
	#50 
	$display($time, " << 6 spi_read >>");
	do_spi_read(8'b1000_1000, 8'b0000_0011);
	MOSI= 1'b1;
	
	#55
	
	if(fifo_read_complete != 1'b1)
			$display("ERROR: read complete is not indicated!");
		else
			$display("Success: read complete is set");
	
	end
endmodule