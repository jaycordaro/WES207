module fifo_transfer(input logic clk,     
			input logic reset_n,
			output logic output_en,
			output logic input_en,
			input logic [7:0] data_in,
			output logic [7:0] data_out,
			output logic length_output_en,
			output logic length_input_en,
			input logic [7:0] length_in,
			output logic [7:0] length_out,
			input start,
			input stop);
			
logic active;
logic read;
logic [7:0] transfer_byte;


always_ff @(posedge clk or negedge reset_n)
	begin
		if (~reset_n)
			begin
				active <= 1'b0;
				read <= 1'b0;
				transfer_byte <= 8'b0000_0000;
				length_input_en <= 0;
				length_output_en <= 0;
				output_en <= 0;
				input_en <= 0;
			end
		else
			begin
				if (!stop && !active && start && !length_input_en)
					begin
						length_input_en <= 1'b1;
					end
				if (!stop && !active && start && length_in != 8'b0000_0000)
					begin
						active <= 1'b1;
						input_en <= 1'b1;
						read <= 1'b1;
						length_out <= length_in;
						length_output_en <= 1'b1;
						length_input_en <= 1'b0;
					end
				else if (stop)
					begin
						active <= 1'b0;
					end
				else if (active)
					begin
						if (read)
							begin
								transfer_byte <= data_in;
								output_en <= 1'b0;
								input_en <= 1'b0;
								read <= 1'b0;
								length_output_en <= 0;
							end
						else
							begin
								data_out <= transfer_byte;
								output_en <= 1'b1;
								input_en <= 1'b1;
								read <= 1'b1;
							end
					end
			end
					
	end
		
endmodule : fifo_transfer