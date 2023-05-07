/* Copyright 2019 Jay Cordaro

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
*/

module led (input logic clk,
            input logic reset_n,
			input logic rd_en,
			input logic wr_en,
			input   [7:0] data_in,
			output logic [7:0] data_out,
            output logic led0,
	        output logic led1);
			
logic [7:0] ctr_cfg_reg;
logic [24:0] max_cnt;
logic [24:0] counter;

always_ff @(posedge clk or negedge reset_n)
	if (~reset_n)
		begin
			ctr_cfg_reg <= 8'b0101_1101;
		end
	else if (wr_en == 1'b1)
		begin
			ctr_cfg_reg <= data_in;
		end

always_ff @(posedge clk or negedge reset_n)
	if (~reset_n)
		begin
			data_out <= 8'b0000_0000;
		end
	else if (rd_en == 1'b1)
		begin
			data_out <= ctr_cfg_reg;
		end
	else if (~rd_en)
			data_out <= 8'b0000_0000;

assign max_cnt = {ctr_cfg_reg, 16'b0000_0000_0000_0000};

 always_ff @ (posedge clk or negedge reset_n)
    begin
        if (~reset_n)
			begin
				counter <= 0;
				led0 <=0;
				led1 <=1;
			end
        else if (counter >= max_cnt)
			begin
				led0 <= (~led0);
				counter <= 0;
				led1 <= (led0);
			end
		  else
			begin
				counter <= counter + 1;	
			end
	end

endmodule:led


