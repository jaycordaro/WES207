// lvds_tb
// jay cordaro
// 
// testbench for tx_dac_fsm.sv module

module lvds_tb();

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
logic [7:0] data_to_dac;
logic [7:0] data_from_dac;
logic [7:0] data_from_led;
logic [1:0] to_lvds;

tx_dac_fsm tx_dac_fsm_inst (
	.clk				(clk),
	.reset_n 			(reset_n),
	//.tx_en			(tx_en),
	.rd_en				(tx_en_dac),
	.wr_en				(rx_en_dac),
	.dacreg_data_in		(data_to_dac),
	.dacreg_data_out	(data_from_dac),
	.to_lvds 			(to_lvds)	
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
	.tx_en_gpo		(tx_en_gpo),
	.tx_en_status	(tx_en_status),
	.tx_en_tx_packet_len (tx_en_tx_packet_len),
	.tx_en_tx_packet	 (tx_en_tx_packet),
	.tx_en_rx_packet_len (tx_en_rx_packet_len),
	.tx_en_rx_packet	 (tx_en_rx_packet),
	.tx_en_led		(tx_en_led),
	.tx_en_dac		(tx_en_dac),
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
	.data_to_gpo	(data_to_gpo),
	.data_to_tx_packet_len_reg	(data_to_tx_packet_len_reg),
	.data_to_tx_packet_reg		(data_to_tx_packet_reg),
	.data_to_rx_packet_len_reg	(data_to_rx_packet_len_reg),
	.data_to_rx_packet_reg		(data_to_rx_packet_reg),
	.data_to_led	(data_to_led),
	.data_to_dac	(data_to_dac)
	);
	
always #15 clk = ~clk; 


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
		
		if (reg_addr != check_data[7:1])
			$display("ERROR: ADDRESS for WRITE expected %b, got %b", check_data[7:1], reg_addr);
		else
			$display("Success: ADDRESS for WRITE expected %b, got %b", check_data[7:1], reg_addr);
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

task do_transmit_lvds;
	begin
	
	do_spi_write(16'b0100_0110_0000_0001);  // turn TX_EN on
	#5000

	do_spi_write(16'b0100_0110_0000_0000);  // turn TX_EN off
	
	end
endtask
	
	 initial 
	 begin   // 
  
  
 // create 50MHz clock
    $dumpfile("lvds_tb.vcd");
	$display($time, " << Starting the Simulation >>");
    $dumpvars;
	#3 clk = 1'b0;
	
	#40 reset_n = 0;
	#40 MOSI=1'b0;
	#88 reset_n = 1;

	$display($time, " << start lvds transaction >>");
	#50
	MOSI= 1'b1;
	
	#50
	do_transmit_lvds();
	#400
	do_transmit_lvds();
	#500
	do_transmit_lvds();
	#666
	do_transmit_lvds();
	MOSI= 1'b1;

	end
	
endmodule 