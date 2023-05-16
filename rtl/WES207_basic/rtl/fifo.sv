module fifo(input logic clk,     
			input logic reset_n,
			input logic rd_en,
			input logic wr_en,
			input logic [7:0] data_in,
			output  [7:0] data_out,
			input logic length_rd_en,
			input logic length_wr_en,
			input logic [7:0] length_in,
			output [7:0] length_out,
			output full,
			output read_complete);
			
logic [7:0] buff_head;

logic [7:0] buff [127:0];

logic [7:0] wr_index;

logic [7:0] rd_index;

logic [7:0] length;

logic [1:0] sync_wr;
logic [1:0] sync_rd;

always_ff @(posedge clk or negedge reset_n)
	begin
		if (~reset_n)
			begin
				buff_head <= 8'b0000_0000;
				wr_index <= 8'b0000_0000;
				rd_index <= 8'b0000_0000;
				length <= 8'b0000_0000;
				sync_wr <= 2'b00;
				sync_rd <= 2'b00;
			end
		else
			begin
				sync_wr <= {sync_wr[0], wr_en};
				sync_rd <= {sync_rd[0], rd_en};
		
				if (sync_wr == 2'b01)
					begin
						buff[wr_index] <= data_in;
						if (rd_index == wr_index)
							begin
								buff_head <= data_in;
							end
							
						wr_index <= wr_index + 1;
						
					end
				else if (sync_rd == 2'b10)
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
					
				if (length_wr_en == 1'b1)
				begin
					length <= length_in;
					
					// writing the length resets the fifo
					buff_head <= 8'b0000_0000;
					wr_index <= 8'b0000_0000;
					rd_index <= 8'b0000_0000;
				end
			end
	end

	
assign data_out = (rd_en) ? buff_head : 8'b0001_1111;

assign length_out = (length_rd_en) ? length : 8'b0000_0000;

assign full = wr_index >= length;

assign read_complete = rd_index >= length;
		
endmodule : fifo