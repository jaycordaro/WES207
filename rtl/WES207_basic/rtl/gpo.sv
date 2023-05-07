module gpo(input logic clk,     // system clock
			input logic reset_n,
			input logic rd_en,
			input logic wr_en,
			input logic [7:0] data_in,
			output  [7:0] data_out,
			output logic [6:0] gpo_pins);
			
logic [7:0] gp_config_reg;

assign gpo_pins = (gp_config_reg[7]) ? gp_config_reg[6:0] : 7'b000_0000; 

always_ff @(posedge clk or negedge reset_n)
	if (~reset_n)
		begin
			gp_config_reg <= 8'b0000_0000;
		end
	else if (wr_en == 1'b1)
		begin
			gp_config_reg <= data_in;
		end
				
assign data_out = (rd_en) ? gp_config_reg : 8'b0000_0000;		
		
endmodule : gpo