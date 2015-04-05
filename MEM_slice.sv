// Maggie White and Taylor Shoenborn
module MEM_slice(clk, rst, M, WB_in, flags_in, addr, wdata, PCbranch_in, ALU_in,
                 rdata, PCbranch, PCret, ALU, WB, Branch);

input clk, rst;
input [2:0] M;
input [1:0] WB_in;
input [2:0] flags_in;
input [15:0] addr, wdata, PCbranch_in, ALU_in;
output [15:0] rdata;
output [15:0] PCbranch, PCret;
output [15:0] ALU;
output [1:0] WB;
output Branch;

wire MemRead, MemWrite;
wire zr, neg, ov;

assign MemRead = M[0];
assign MemWrite = M[1];
assign Branch = M[2];

assign WB = WB_in;
assign PCbranch = PCbranch_in;
assign PCret = rd_data;

DM data(.clk(clk),.addr(addr),.re(MemRead),.we(MemWrite),.wrt_data(wdata),.rd_data(rdata));

endmodule
