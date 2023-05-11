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
module tx_dac_fsm(
    input clk,
    input reset_n,
	//tx_en,
	input logic rd_en,
	input logic wr_en,
    input logic [7:0] dacreg_data_in,
	output  [7:0] dacreg_data_out,
    output reg [1:0] to_lvds
);

// register configuration
logic [7:0] dac_config_reg;
logic tx_en;

assign tx_en = (dac_config_reg[0]) ? 1'b1 : 1'b0; 

always_ff @(posedge clk or negedge reset_n)
	if (~reset_n)
		begin
			dac_config_reg <= 8'b0000_0000;
		end
	else if (wr_en == 1'b1)
		begin
			dac_config_reg <= dacreg_data_in;
		end
		
assign dacreg_data_out = (rd_en) ? dac_config_reg : 8'b0000_0000;		

// Define states
typedef enum logic [3:0] {
    IDLE,
    TX_PREP,
    GET_TX_DATA,
    TX_1_START,
	TX_1_MID,
	TX_1_END,
	TX_0_START,
	TX_0_MID,
	SEND_Q_HEAD,
	SEND_Q_DATA
} fsm_state_t;

fsm_state_t state_reg, next_state;

// Define state register
//logic [3:0] state_reg;

logic [5:0] zctr;  // send 32 zeros to 'warm up' the Atmel part
logic [5:0] dctr;  // send 16 bits for I channel and then 16 bits for Q Channel

logic dctr_en;
logic zctr_en;
logic ld_sym;

logic [1:0] data_out;

logic curr_sym;

logic [4:0] sym_ctr;
logic [3:0] sym_pos;

localparam [14:0] symbol = 15'b111_1010_1100_1000;

always_ff @ (posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        sym_ctr <= 0;
		sym_pos <= 0;
	end else if (tx_en && (zctr == 15 || dctr == 15)) begin
		sym_ctr <= sym_ctr +3;
		if (sym_ctr >= 5'd20) begin 
			sym_ctr <= sym_ctr - 5'd20;  // we are transmitting 600kchip/s symbols at 4MS/s (20/3 interpolation)
			sym_pos <= sym_pos+1;
			if (sym_pos > 15) begin
				sym_pos <= 0;
			end
		end
	end
end

assign curr_sym =  symbol[14-sym_pos];

always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        state_reg <= IDLE;
    end else begin
        state_reg <= next_state;
    end
end

// Define next state logic
//logic [2:0] next_state;
always_comb begin
    case (state_reg)
        IDLE: begin
            if (tx_en) begin
                next_state = TX_PREP;
            end else begin
                next_state = IDLE;
            end
        end
        TX_PREP: begin
            if (tx_en && zctr < 16) begin
                next_state = TX_PREP;
            end else if ( tx_en && zctr == 16 ) begin
				next_state = GET_TX_DATA;			
			end else 
                next_state = IDLE;
        end
		GET_TX_DATA: begin
			if (tx_en && curr_sym == 1'b0) begin
				next_state = TX_0_START;
			end else if (tx_en && curr_sym == 1'b1) begin
				next_state = TX_1_START;
			end
		end
        TX_0_START: begin
			next_state = TX_0_MID;
            end 
		TX_0_MID: begin
			if (dctr < 5)
				next_state = TX_0_MID;
			else if (dctr == 5)
				next_state = TX_1_END;       
        end
		TX_1_START: begin
			next_state = TX_1_MID;
		end
		TX_1_MID: begin
			if (dctr < 5)
				next_state = TX_1_MID;
			else if (dctr == 5)
				next_state = TX_1_END; 			
		end	
		TX_1_END: begin
			next_state = SEND_Q_HEAD;
		end		
		SEND_Q_HEAD: begin
			next_state = SEND_Q_DATA;
		end		
		SEND_Q_DATA: begin
			if (dctr < 14) 
				next_state = SEND_Q_DATA;
			else
				next_state = GET_TX_DATA;
		end		
        default: next_state = IDLE;
    endcase
end

// Define output logic based on current state
always_comb begin
    case (state_reg)
        IDLE: 		{data_out, zctr_en, dctr_en, ld_sym} = 'b00_0_0_0;
		TX_PREP: 	{data_out, zctr_en, dctr_en, ld_sym} = 'b00_1_0_0;
		GET_TX_DATA:{data_out, zctr_en, dctr_en, ld_sym} = 'b01_0_0_1;
		TX_1_START: {data_out, zctr_en, dctr_en, ld_sym} = 'b10_0_1_0;
		TX_1_MID: 	{data_out, zctr_en, dctr_en, ld_sym} = 'b00_0_1_0;
		TX_1_END: 	{data_out, zctr_en, dctr_en, ld_sym} = 'b11_0_1_0;
		TX_0_START: {data_out, zctr_en, dctr_en, ld_sym} = 'b01_0_1_0;
		TX_0_MID: 	{data_out, zctr_en, dctr_en, ld_sym} = 'b11_0_1_0;
		SEND_Q_HEAD:{data_out, zctr_en, dctr_en, ld_sym} = 'b10_0_1_0;
		SEND_Q_DATA:{data_out, zctr_en, dctr_en, ld_sym} = 'b00_0_1_0;
    endcase
end

always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        zctr <= 'h0;
    end else begin
        if (zctr_en == 1'b1) 
			zctr <= zctr + 1;
		else 
			zctr <= 'h0;
    end
end

always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        dctr <= 'h0;
    end else begin
        if (dctr_en == 1'b1) 
			dctr <= dctr + 1;
		else 
			dctr <= 'h0;
    end
end

assign to_lvds = (tx_en == 1'b1) ? data_out : 2'b00;

endmodule : tx_dac_fsm