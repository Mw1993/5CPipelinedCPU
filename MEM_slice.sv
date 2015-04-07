// Maggie White and Taylor Shoenborn
module MEM_slice(clk, rst, stall, M_in, WB_in, flags_in, addr_in, 
                 wdata_in, ALU_in,
                 rdata, PCret, ALU, flags, WB);

input clk, rst, stall;
input [1:0] M_in;
input [6:0] WB_in;
input [15:0] addr_in, wdata_in, ALU_in;
input [2:0] flags_in;
output [15:0] rdata;
output [15:0] PCret;
output [15:0] ALU;
output [2:0] flags;
output [6:0] WB;

wire MemRead, MemWrite;
wire zr, neg, ov;

reg [2:0] M;
reg [6:0] WB;
reg [2:0] flags;
reg [15:0] addr, wdata, ALU;

assign MemRead = M[0];
assign MemWrite = M[1];

always @(posedge clk, posedge rst) begin
  if(rst) begin
    M <= 2'h0;
    WB <= 7'h0;
    flags <= 3'h0;
    addr <= 16'h0000;
    wdata <= 16'h0000;
    ALU <= 16'h0000;
  end else begin
    M <= M_in;
    WB <= WB_in;
    flags <= flags_in;
    addr <= addr_in;
    wdata <= wdata_in;
    ALU <= ALU_in;
  end
end

assign PCret = rdata;

DM data(.clk(clk),.addr(addr),.re(MemRead),.we(MemWrite),.wrt_data(wdata),.rd_data(rdata));

endmodule
