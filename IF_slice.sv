// Maggie White and Taylor Schoenborn
module IF_slice(clk, rst, stall, flush, CallRet, Call, PCcall, Branch, PCbranch, Ret, PCret,
                PC_inc, instr);

input clk, rst;
input stall;
input flush;
input Call, Branch, Ret;
input CallRet;
input [15:0] PCcall, PCbranch, PCret; // ALU output, Mem output
output reg [15:0] PC_inc;
output [15:0] instr;

reg [15:0] PC;
wire [15:0] tmpPC, tmpPC_inc;

assign PC_inc = PC + 1;
assign tmpPC = Call ? PCcall : 
               Branch ? PCbranch : 
               Ret ? PCret :
               stall ? PC :
               PC_inc;

always @(posedge clk, posedge rst) begin
  if(rst)
    PC <= 16'h0000;
  else
    PC <= tmpPC;
end

IM instMem (.clk(clk),.addr(PC),.rd_en(!rst),.instr(instr));

endmodule