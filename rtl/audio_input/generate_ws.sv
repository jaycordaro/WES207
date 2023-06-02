/* BSD 2-Clause License

Copyright (c) 2023 Jay Cordaro
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */

module generate_ws( input logic i2s_clk,
		    input logic reset_n,
		    output logic ws_out);
					
	logic [4:0] ws_ctr;  // counter counts from 0 to 31
	logic ws;
	
	always_ff @(posedge i2s_clk or negedge reset_n) 
		begin
			if (~reset_n) begin
					ws_ctr <= '0;
					ws <= 1'b0;
				end
			else if (ws_ctr == '0 || ws_ctr == 16) begin
					ws <= ~ws;
					ws_ctr <= ws_ctr +1;
				end
			else
				ws_ctr <= ws_ctr + 1'b1;
		end
		
	assign ws_out = ws;
	
endmodule : generate_ws