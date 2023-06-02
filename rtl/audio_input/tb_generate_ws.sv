module tb_generate_ws;

  // Declare the signals to connect to the module under test
  logic sclk; // The input clock signal
  logic reset_n; // The reset signal
  logic ws_out; // The output clock signal

  // Instantiate the module under test
  generate_ws generate_ws_inst (
    .sclk(sclk),
    .reset_n(reset_n),
    .ws_out(ws_out)
  );

  // Generate a 512 kHz input clock signal
  always #976.5625 sclk = ~sclk;


  // Generate a reset signal for one input clock cycle
  initial begin
    $dumpfile("clk.vcd");
	$display($time, " << Starting the Simulation >>");
    $dumpvars;
    reset_n = '1;
	#3 sclk = 1'b0;
    #31 reset_n = '0;
	#310 reset_n = '1;
  end

  // Monitor the output clock signal and print its value and period
  /*initial begin
    $monitor("At time %0t, clk_out = %b", $time, ws_out);
    $display("The expected period of clk_out is %0t", 250 * 976.5625);
    $display("The expected frequency of clk_out is %0f", (1 / (250 * 976.5625)) * 1e9);
  end */

endmodule