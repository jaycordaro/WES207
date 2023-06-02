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

module polyphase_ds_decim(input logic clk,
						  input logic reset_n,
						  input logic x_in,    
						  output logic signed [15:0] pcm_out,
						  input logic from_aready,
						  output logic to_avalid);
  
  logic [1:0] count;
  logic [3:0] outcount;
  
  logic signed [15:0] out0;
  logic signed [15:0] out1;
  logic signed [15:0] out2;
  logic signed [15:0] out3;
  logic signed [15:0] out4;
  logic signed [15:0] out5;
  logic signed [15:0] out6;
  logic signed [15:0] out7;
  logic signed [15:0] out8;
  logic signed [15:0] out9;
  logic signed [15:0] outA;
  logic signed [15:0] outB;
  
  logic signed [15:0]     a1, a2, a3, a4, a5, a6, a7, a8, a9, aA, aB;
  logic signed [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, rA;//, rB;
  
  logic signed [15:0] y;
  logic signed [15:0] accum_out;
  
  logic signed [15:0] w0 [7:0] = '{16'b1111111111110101,
							16'b0000000000001011,
							16'b0000000000101001,
							16'b1111111111010111,
							16'b0001011000001110,
							16'b1110100111110010,
							16'b1111111101000001,
							16'b0000000010111111};
							    
  logic signed [15:0] w1 [7:0] = '{16'b1111111111100010,
							16'b0000000000011110,
							16'b0000000101111001,
							16'b1111111010000111,
							16'b0001010101010111,
							16'b1110101010101001,
							16'b1111111010110110,
							16'b0000000101001010};

  logic signed [15:0] w2 [7:0] = '{16'b1111111111000100,
							16'b0000000000111100,
							16'b0000001100110010,
							16'b1111110011001110,
							16'b0001001111111000,
							16'b1110110000001000,
							16'b1111111001111000,
							16'b0000000110001000};
							
  logic signed [15:0] w3 [7:0] = '{16'b1111111110011001,
							16'b0000000001100111,
							16'b0000010101001101,
							16'b1111101010110011,
							16'b0001001000001000,
							16'b1110110111111000,
							16'b1111111001110110,
							16'b0000000110001010};
							
  logic signed [15:0] w4 [7:0] = '{16'b1111111101100001,
							16'b0000000010011111,
							16'b0000011110111010,
							16'b1111100001000110,
							16'b0000111110101110,
							16'b1111000001010010,
							16'b1111111010011101,
							16'b0000000101100011};
							
  logic signed [15:0] w5 [7:0] = '{16'b1111111100011111,
							16'b0000000011100001,
							16'b0000101001011100,
							16'b1111010110100100,
							16'b0000110100010000,
							16'b1111001011110000,
							16'b1111111011011010,
							16'b0000000100100110};
  
  // create a counter to select which tap of polyphase for that leg gets selected
  
  always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
      count <= 2'b00;
    end else begin
      count <= count + 1;
    end
  end
  
  always_comb begin
    case ({count, x_in})
      3'b000: out0 = w0[0]; // filter value if '0' selected
      3'b001: out0 = w0[1]; // 2's complement if '1' selected
      3'b010: out0 = w0[2];
      3'b011: out0 = w0[3];
      3'b100: out0 = w0[4];
      3'b101: out0 = w0[5];
      3'b110: out0 = w0[6];
      3'b111: out0 = w0[7];
      default: out0 = 'x;
    endcase
  end
  
  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r0 <= '{default: 16'b0000000000000000};
	else	
		r0 <= {r0[10:0], out0};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out1 = w1[0];
      3'b001: out1 = w1[1];
      3'b010: out1 = w1[2];
      3'b011: out1 = w1[3];
      3'b100: out1 = w1[4];
      3'b101: out1 = w1[5];
      3'b110: out1 = w1[6];
      3'b111: out1 = w1[7];
      default: out1 = 'x;
    endcase
  end
 
  assign a1 = r0[11] + out1;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r1 <= '{default: 16'b0000000000000000};
	else	
		r1 <= {r1[10:0], a1};
		
  always_comb begin
    case ({count, x_in})
      3'b000: out2 = w2[0];
      3'b001: out2 = w2[1];
      3'b010: out2 = w2[2];
      3'b011: out2 = w2[3];
      3'b100: out2 = w2[4];
      3'b101: out2 = w2[5];
      3'b110: out2 = w2[6];
      3'b111: out2 = w2[7];
      default: out2 = 'x;
    endcase
  end
  
  assign a2 = r1[11] + out2;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r2 <= '{default: 16'b0000000000000000};
	else	
		r2 <= {r2[10:0], a2};
		
  always_comb begin
    case ({count, x_in})
      3'b000: out3 = w3[0];
      3'b001: out3 = w3[1];
      3'b010: out3 = w3[2];
      3'b011: out3 = w3[3];
      3'b100: out3 = w3[4];
      3'b101: out3 = w3[5];
      3'b110: out3 = w3[6];
      3'b111: out3 = w3[7];
      default: out3 = 'x;
    endcase
  end
  
  assign a3 = r2[11] + out3;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r3 <= '{default: 16'b0000000000000000};
	else	
		r3 <= {r3[10:0], a3};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out4 = w4[0];
      3'b001: out4 = w4[1];
      3'b010: out4 = w4[2];
      3'b011: out4 = w4[3];
      3'b100: out4 = w4[4];
      3'b101: out4 = w4[5];
      3'b110: out4 = w4[6];
      3'b111: out4 = w4[7];
      default: out4 = 'x;
    endcase
  end
    
  assign a4 = r3[11] + out4;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r4 <= '{default: 16'b0000000000000000};
	else	
		r4 <= {r4[10:0], a4};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out5 = w5[0];
      3'b001: out5 = w5[1];
      3'b010: out5 = w5[2];
      3'b011: out5 = w5[3];
      3'b100: out5 = w5[4];
      3'b101: out5 = w5[5];
      3'b110: out5 = w5[6];
      3'b111: out5 = w5[7];
      default: out5 = 'x;
    endcase
  end
    
  assign a5 = r4[11] + out5;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r5 <= '{default: 16'b0000000000000000};
	else	
		r5 <= {r5[10:0], a5};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out6 = w5[6];
      3'b001: out6 = w5[7];
      3'b010: out6 = w5[4];
      3'b011: out6 = w5[5];
      3'b100: out6 = w5[2];
      3'b101: out6 = w5[3];
      3'b110: out6 = w5[0];
      3'b111: out6 = w5[1];
      default: out6 = 'x;
    endcase
  end
    
  assign a6 = r5[11] + out6;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r6 <= '{default: 16'b0000000000000000};
	else	
		r6 <= {r6[10:0], a6};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out7 = w4[6];
      3'b001: out7 = w4[7];
      3'b010: out7 = w4[4];
      3'b011: out7 = w4[5];
      3'b100: out7 = w4[2];
      3'b101: out7 = w4[3];
      3'b110: out7 = w4[0];
      3'b111: out7 = w4[1];
      default: out7 = 'x;
    endcase
  end
    
  assign a7 = r6[11] + out7;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r7 <= '{default: 16'b0000000000000000};
	else	
		r7 <= {r7[10:0], a7};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out8 = w3[6];
      3'b001: out8 = w3[7];
      3'b010: out8 = w3[4];
      3'b011: out8 = w3[5];
      3'b100: out8 = w3[2];
      3'b101: out8 = w3[3];
      3'b110: out8 = w3[0];
      3'b111: out8 = w3[1];
      default: out8 = 'x;
    endcase
  end
    
  assign a8 = r7[11] + out8;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r8 <= '{default: 16'b0000000000000000};
	else	
		r8 <= {r8[10:0], a8};
  
  always_comb begin
    case ({count, x_in})
      3'b000: out9 = w2[6];
      3'b001: out9 = w2[7];
      3'b010: out9 = w2[4];
      3'b011: out9 = w2[5];
      3'b100: out9 = w2[2];
      3'b101: out9 = w2[3];
      3'b110: out9 = w2[0];
      3'b111: out9 = w2[1];
      default: out9 = 'x;
    endcase
  end
    
  assign a9 = r8[11] + out9;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		r9 <= '{default: 16'b0000000000000000};
	else	
		r9 <= {r9[10:0], a9};
  
  always_comb begin
    case ({count, x_in})
      3'b000: outA = w1[6];
      3'b001: outA = w1[7];
      3'b010: outA = w1[4];
      3'b011: outA = w1[5];
      3'b100: outA = w1[2];
      3'b101: outA = w1[3];
      3'b110: outA = w1[0];
      3'b111: outA = w1[1];
      default: outA = 'x;
    endcase
  end
    
  assign aA = r9[11] + outA;

  always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		rA <= '{default: 16'b0000000000000000};
	else	
		rA <= {rA[10:0], aA};
  
  always_comb begin
    case ({count, x_in})
      3'b000: outB = w0[6];
      3'b001: outB = w0[7];
      3'b010: outB = w0[4];
      3'b011: outB = w0[5];
      3'b100: outB = w0[2];
      3'b101: outB = w0[3];
      3'b110: outB = w0[0];
      3'b111: outB = w0[1];
      default: outB = 'x;
    endcase
  end
  
  assign aB = rA[11] + outB;

  /* always_ff @(posedge clk or negedge reset_n) 
	if (~reset_n)
		rB <= '{default: 16'b0000000000000000};
	else	
		rB <= {rB[10:0], aB};
  */
  
  always_ff @(posedge clk or negedge reset_n)
	if (~reset_n)
		accum_out <= 0;
	else 
		accum_out <= accum_out + aB;
  
  always_ff @(posedge clk or negedge reset_n) begin
		if (~reset_n) begin
			pcm_out <=0;
			outcount <= 0;
			to_avalid <= 1'b0;
		end else if (outcount == 11 && from_aready == 1'b1) begin
			outcount <=0;
			pcm_out <= accum_out;
			to_avalid <= 1'b1;
		end else begin
			outcount <= outcount + 1;
			to_avalid <= 1'b0;
		end
	end
  
  
  /*always_ff @(posedge clk or negedge reset_n)
	if (~reset_n)
			y <= 0;
	else if (count == 2'b11)
			y <= accum_out;
   */
	
	// assign pcm_out = y;
   
  
endmodule : polyphase_ds_decim