module regwrap(
		input logic clk,
		input logic reset_n,
		output logic rx_en_gpo,
		output logic rx_en_led,
		output logic tx_en_gpo,
		output logic tx_en_led,
		output logic [7:0] tx_d,
		input logic [6:0] reg_addr,
		input logic addr_dv,
		input logic rxdv,
		input logic rw_out,
		input logic [7:0] rx_d,
		input logic [7:0] data_from_gpo,
		input logic [7:0] data_from_led,
		output logic [7:0] data_to_gpo,
		output logic [7:0] data_to_led,
		output logic tx_en
		);
		
// logic [7:0] data_from_slave;
//logic [7:0] data_in;
//logic [6:0] addr_in;

//assign addr_in = addr;


/* send data from master to slave */
assign rx_en_gpo = (addr_dv && rxdv && reg_addr[2:0]==3'b100 && ~rw_out) ? 1'b1 : 1'b0;
assign rx_en_led = (addr_dv && rxdv && reg_addr[2:0]==3'b101 && ~rw_out) ? 1'b1 : 1'b0;

/* req data from slave */
assign tx_en_gpo = (addr_dv && reg_addr[2:0]==3'b100 && rw_out) ? 1'b1 : 1'b0;
assign tx_en_led = (addr_dv && reg_addr[2:0]==3'b101 && rw_out) ? 1'b1 : 1'b0;


always_ff @(posedge clk or negedge reset_n)
begin
	if (~reset_n )
		begin
			tx_d <= 8'b0000_0000;
			tx_en<= 1'b0;
		end
	else if (~rw_out)
		begin
			tx_d <= 8'b0000_0000;
			tx_en<= 1'b0;
		end
	else if (tx_en_gpo) 
		begin
			tx_d <= data_from_gpo;
			tx_en<= 1'b1;
		end
	else if (tx_en_led)
		begin
			tx_d <= data_from_led;
			tx_en<= 1'b1;
		end
end

// assign tx_d = data_from_slave;

assign data_to_gpo = (rx_en_gpo) ? rx_d : 8'b0000_0000;
assign data_to_led = (rx_en_led) ? rx_d : 8'b0000_0000;

endmodule : regwrap