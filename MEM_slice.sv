module MEM_slice(clk, rst, M, WB_in, flags, addr, wdata, PC_in, PC_out, ALU_in,
                 ALU_out, rdata, WB_out);

input clk, rst;
input [2:0] M;
input WB_in;
input [2:0] flags;
input [15:0] addr, wdata, PC_in, ALU_in;
output [15:0] PC_out, rdata, ALU_out;
output WB_out;

wire MemRead, MemWrite, SPToPC;
wire zr, neg, ov;

assign MemRead = M[0];
assign MemWrite = M[1];
assign SPToPC = M[2];

assign zr = flags[2];
assign neg = flags[1];
assign ov = flags[0];

assign WB_out = WB_in;
assign ALU_out = ALU_in;

assign PC_out = SPToPC ? PC_in : rdata;

DM data(.clk(clk),.addr(addr),.re(MemRead),.we(MemWrite),.wrt_data(wdata),rd_data(rdata));

endmodule
