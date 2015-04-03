module IF_slice(clk, rst, PCSrc, PCld, PC_inc, instr);

input clk, rst;
input PCSrc;
input [15:0] PCld;
output [15:0] PC_inc;
output [15:0] instr;

reg [15:0] PC;
wire [15:0] tmpPC;

assign tmpPC = PCSrc ? PCld : PC_inc;
assign PC_inc = PC + 4;

always @(posedge clk, posedge rst) begin
  if(rst)
    PC <= 16'h0000;
  else
    PC <= tmpPC;
end

IM instMem (.clk(clk),.addr(PC),.rd_en(!rst),.instr(instr));

endmodule