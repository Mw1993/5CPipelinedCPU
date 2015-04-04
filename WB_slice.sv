// Maggie White and Taylor Shoenborn
module WB_slice(clk, rst, WB, ALU, MemData, RegData);

input clk, rst;
input WB;
input [15:0] ALU, MemData;
output [15:0] RegData;

wire MemToReg;
assign MemToReg = WB;

assign RegData = MemToReg ? MemData : ALU;

endmodule
