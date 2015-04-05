// Maggie White and Taylor Shoenborn
module WB_slice(clk, rst, PCret_in, WB, ALU, MemData, RegData, Ret, PCret);

input clk, rst;
input [1:0] WB;
input [15:0] PCret_in;
input [15:0] ALU, MemData;
output [15:0] RegData;
output [15:0] PCret;
output Ret;

wire MemToReg;
assign MemToReg = WB[0];
assign Ret = WB[1];

assign PCret = PCret_in;

assign RegData = MemToReg ? MemData : ALU;

endmodule
