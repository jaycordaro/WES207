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

module generate_clks( input logic i2s_clk,
		    input logic reset_n,
		    output logic pll_0p064,
			output logic pll_0p032);
					
	logic [3:0] ctr;  // counter counts from 0 to 31

	always_ff @(posedge i2s_clk or negedge reset_n) 
		begin
			if (~reset_n) begin
					ctr <= '0;
					pll_0p064 <= 1'b0;
				end
			else if (ctr == '0 || ctr == 8) begin
					pll_0p064 <= ~pll_0p064;
					ctr <= 0;
				end
			else
				ctr <= ctr + 1'b1;
		end
		
	always_ff @(posedge i2s_clk or negedge reset_n) begin
		if (~reset_n)
			pll_0p032 <= 1'b0;
		else
			pll_0p032 <= ~pll_0p032;
		end
	
endmodule : generate_clks