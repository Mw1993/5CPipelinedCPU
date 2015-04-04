// Maggie White and Taylor Shoenborn
module MEM_slice(clk, rst, M, WB_in, flags_in, addr, wdata, PC_in, ALU_in, PC,
                 rdata, ALU, WB, flags);

input clk, rst;
input [1:0] M;
input WB_in;
input [2:0] flags_in;
input [15:0] addr, wdata, PC_in, ALU_in;
output [15:0] PC, rdata;
output [15:0] ALU;
output WB;
output [2:0] flags;

wire MemRead, MemWrite, SPToPC;
wire zr, neg, ov;

assign MemRead = M[0];
assign MemWrite = M[1];

assign zr = flags[2];
assign neg = flags[1];
assign ov = flags[0];

assign WB = WB_in;
assign flags = flags_in;

DM data(.clk(clk),.addr(addr),.re(MemRead),.we(MemWrite),.wrt_data(wdata),.rd_data(rdata));

endmodule
