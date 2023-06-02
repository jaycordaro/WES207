//  1-deep / 2-register FIFO synchronizer
module multibit_fifo_sync #(
  parameter DATA_WIDTH = 32
) (
  input  logic                  aclk,
  input  logic                  areset_n,
  input  logic                  avalid,
  input  logic [DATA_WIDTH-1:0] adata,
  output logic                  aready,
  input  logic                  bclk,
  input  logic                  breset_n,
  output logic                  bvalid,
  output logic [DATA_WIDTH-1:0] bdata,
  input  logic                  bready
);
  
  logic wptr,r_wptr;
  logic rptr,w_rptr;
  // generate wptr using toggle-FF
  always_ff @(posedge aclk or negedge areset_n) begin
    if (~areset_n) begin
      wptr <= 1'b0;
    end else begin
      wptr <= wptr^(avalid&aready);
    end
  end
  assign aready = ~(wptr^w_rptr);
  // generate rptr using toggle-FF
  always_ff @(posedge bclk or negedge breset_n) begin
    if (~breset_n) begin
      rptr <= 1'b0;
    end else begin
      rptr <= rptr^(bvalid&bready);
    end
  end
  assign bvalid = rptr^r_wptr;
  // 1-deep DPRAM
  multibit_fifo_dpram #(
    .DATA_WIDTH(DATA_WIDTH)
  ) multibit_fifo_dpram_innst (
    .clk(aclk),
    .wen(avalid&aready),
    .waddr(wptr),
    .wdata(adata),
    .raddr(rptr),
    .rdata(bdata)
  );
  // Sync rptr to aclk
  multibit_fifo_double_sync
  multibit_fifo_double_sync_w_rptr (
    .clk(aclk),
    .reset_n(areset_n),
    .d(rptr),
    .q(w_rptr)
  );
  // Sync wptr to bclk
  multibit_fifo_double_sync
  multibit_fifo_double_sync_r_wptr (
    .clk(bclk),
    .reset_n(breset_n),
    .d(wptr),
    .q(r_wptr)
  );
  
endmodule

module multibit_fifo_dpram #(
  parameter DATA_WIDTH = 8
) (
  input  logic                  clk,
  input  logic                  wen,
  input  logic                  waddr,
  input  logic [DATA_WIDTH-1:0] wdata,
  input  logic                  raddr,
  output logic [DATA_WIDTH-1:0] rdata
);
  
  logic [DATA_WIDTH-1:0] mem[0:1];
  
  always_ff @(posedge clk) begin
    if (wen) begin
      mem[waddr] <= wdata;
    end
  end
  
  assign rdata = mem[raddr];
  
endmodule

module multibit_fifo_double_sync (
  input  logic clk,
  input  logic reset_n,
  input  logic d,
  output logic q
);
  
  logic q0;
  // Double Sync-Single-bit-CDC
  always_ff @(posedge clk or reset_n) begin
    if (~reset_n) begin
      q <= 1'b0;
      q0 <= 1'b0;
    end else begin
      q<= q0;
      q0 <= d;
    end
  end
  
endmodule