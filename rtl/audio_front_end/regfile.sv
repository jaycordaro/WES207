module regfile
  (input logic clk,
   input logic reset_n,
   input logic write,
   input logic re,
   input logic WE_O,
	input logic CYC_O,
	input logic STB_O,
	input logic [15:0] ADR_O,
	input logic [15:0] DAT_O,
   output logic [15:0] DAT_I,
	output logic ACK_I
	);

   logic [15:0] regfile [0:7];

   assign rdData = re ? regfile[rdAddr] : 7'b000_0000;


   always_ff @(posedge clk or negedge reset_n) begin
      if (reset_n) begin
			 regfile[0] <= 0;
			 regfile[1] <= 0;
			 regfile[2] <= 0;
			 regfile[3] <= 0;
			 regfile[4] <= 0;
			 regfile[5] <= 0;
			 regfile[6] <= 0;
			 regfile[7] <= 0;
		end 
		else 
			begin
				if (we) regfile[wrAddr] <= wrData;
			end // else: !if(reset)
   end
	
endmodule:regfile
