module fifo(input logic clk,     
			input logic reset_n,
			input logic output_en,
			input logic input_en,
			input logic [7:0] data_in,
			output  [7:0] data_out,
			input logic length_output_en,
			input logic length_input_en,
			input logic [7:0] length_in,
			output [7:0] length_out,
			output full,
			output read_complete);
			
logic [7:0] buff_head;

logic [7:0] buff [127:0];

logic [7:0] wr_index;

logic [7:0] rd_index;

logic [7:0] length;

logic sync_input;
logic sync_output;

always_ff @(posedge clk or negedge reset_n)
	begin
		if (~reset_n)
			begin
				buff_head <= 8'b0000_0000;
				wr_index <= 8'b0000_0000;
				rd_index <= 8'b0000_0000;
				length <= 8'b0000_0000;
				sync_input <= 2'b00;
				sync_output <= 2'b00;
			end
		else
			begin
				sync_input <= input_en;
				sync_output <= output_en;
		
				if (sync_input == 1'b0 && input_en == 1'b1)
					begin
						buff[wr_index] <= data_in;
						if (rd_index == wr_index)
							begin
								buff_head <= data_in;
							end
							
						wr_index <= wr_index + 1;
						
					end
				else if (sync_output == 1'b1 && output_en == 1'b0)
					begin
						if (rd_index != wr_index)
							begin
								buff_head <= buff[rd_index + 1];
								rd_index <= rd_index + 1;
							end
						else
							begin
								buff_head <= 8'b0000_0000;
							end
					end
					
				if (length_input_en == 1'b1)
				begin
					length <= length_in;
					
					// writing the length resets the fifo
					buff_head <= 8'b0000_0000;
					wr_index <= 8'b0000_0000;
					rd_index <= 8'b0000_0000;
				end
			end
	end

	
assign data_out = (output_en) ? buff_head : 8'b0001_1111;

assign length_out = (length_output_en) ? length : 8'b0000_0000;

assign full = wr_index >= length && !input_en && wr_index > 0;

assign read_complete = rd_index >= length && !output_en;
		
endmodule : fifo