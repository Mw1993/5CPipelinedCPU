// Maggie White and Taylor Shoenborn
module IF_slice(clk, rst, stall, Call, PCcall, Branch, PCbranch, Ret, PCret,
                PC_inc, instr);

input clk, rst;
input stall;
input Call, Branch, Ret;
input [15:0] PCcall, PCbranch, PCret; // ALU output, Mem output
output [15:0] PC_inc;
output [15:0] instr;

reg [15:0] PC;
wire [15:0] tmpPC;

assign PC_inc = PC + 1;
assign tmpPC = Call ? PCcall : (Branch ? PCbranch : (Ret ? PCret : PC_inc));

always @(posedge clk, posedge rst) begin
  if(rst)
    PC <= 16'h0000;
  else if(stall)
    PC <= PC;
  else
    PC <= tmpPC;
end

IM instMem (.clk(clk),.addr(PC),.rd_en(!rst),.instr(instr));

endmodule