/*  Register Wrapper
	copyright 2023 Jay Cordaro
	Redistribution and use in source and binary forms, with or without modification, 
	are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright notice, 
	this list of conditions and the following disclaimer.

	2. Redistributions in binary form must reproduce the above copyright notice, 
	this list of conditions and the following disclaimer in the documentation 
	and/or other materials provided with the distribution.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS" 
	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
	ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
	LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
	GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
	HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY 
	OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	handles the mux/demux of registers throughout the design to the spi_slave block

*/
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


/* send data from master to slave 
0 == send data from master to the slave RW==0. write from host to target*/
assign rx_en_gpo = (addr_dv && rxdv && reg_addr[2:0]==3'b100 && ~rw_out) ? 1'b1 : 1'b0;
assign rx_en_led = (addr_dv && rxdv && reg_addr[2:0]==3'b101 && ~rw_out) ? 1'b1 : 1'b0;

/* req data from slave (RW == 1, READ to host)*/
assign tx_en_gpo = (addr_dv && reg_addr[2:0]==3'b100 && rw_out) ? 1'b1 : 1'b0;
assign tx_en_led = (addr_dv && reg_addr[2:0]==3'b101 && rw_out) ? 1'b1 : 1'b0;


always_comb 
	begin
		if (tx_en_gpo )
			begin
				tx_d = data_from_gpo;
				tx_en = 1'b1;
			end
		else if (tx_en_led)
			begin
				tx_d = data_from_led;
				tx_en = 1'b1;
			end
		else
			begin
				tx_en = 1'b0;
				tx_d = 8'b0000_0000;
			end
	end
			
assign data_to_gpo = (rx_en_gpo) ? rx_d : 8'b0000_0000;
assign data_to_led = (rx_en_led) ? rx_d : 8'b0000_0000;

endmodule : regwrap