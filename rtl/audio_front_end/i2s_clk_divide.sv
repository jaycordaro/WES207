module i2s_clk_divide(
		input logic clk,
		input logic reset_n,
		output logic sclk_out,
		output logic ws_out);
		
		logic [7:0] sclk_ctr;
		logic [5:0] ws_ctr;
		logic [1:0] sync_sclk;
		
		// 16 kHz × 16 × 2 = 512 kHz
		// 38.4 MHz master clock need divide by 75
		// WS is on falling edge of SCLK @ 16kHz
		
	always_ff @ (posedge clk or negedge reset_n)
	   begin
		if (~reset_n)
			begin
				sclk_ctr <= 8'b0000_0000;
				ws_ctr <= 0;
			end
		else if(sclk_ctr == 7'd74)
				begin
					sclk_ctr <= 8'b0000_0000;
					ws_ctr <= ws_ctr + 1;
				end
		else begin
				sclk_ctr <= sclk_ctr + 1;
				ws_ctr <= ws_ctr;
			end
		end
				
	always_ff @ (posedge(clk) or negedge reset_n)
	begin
		if (~reset_n)
			sclk_out <= 0;
		else if (sclk_ctr == 7'd74)
			sclk_out <= ~sclk_out;
		else
			sclk_out <= sclk_out;
	end
	
	always_ff @ (posedge clk or negedge reset_n)
    	begin
		if (~reset_n)
		    begin
			sync_sclk <= 2'b00;
		    end
		else
		    begin
			sync_sclk <= {sync_sclk[1], sclk_out};
		    end
    	end
	
	 assign sync_sclk_fe = (sync_sclk[1:0]==2'b10) ? 1'b1 : 1'b0;  	// falling edge
	
	/* always_ff @ (posedge clk  or negedge reset_n)
	begin
		if (~reset_n)
			ws_out <= 0;
		else if (ws_ctr == 4'b0000 & sclk_ctr[0]==1'b0)
			ws_out <= ~ws_out;
		else
			ws_out <= ws_out;
	end */
	
	always_comb begin
		if (ws_ctr < 6'b100000)
			ws_out = 1'b0;
		else
			ws_out = 1'b1;		
		end
		
	
	
endmodule : i2s_clk_divide