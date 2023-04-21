// create testbench

module i2s_ctr_tb();

logic clk;
logic reset_n;


logic  sclk_out;
logic ws_out;

i2s_clk_divide spi_slave_inst(
    .clk(clk),
    .reset_n(reset_n),
    .sclk_out(sclk_out),
    .ws_out(ws_out)
);

always #1 clk = ~clk;  

  initial begin

    clk = 1'b0;
    reset_n = 1'b0;
    #97;
    reset_n = 1'b1;
    #2000000;
    $finish;
  end

  endmodule : i2s_ctr_tb