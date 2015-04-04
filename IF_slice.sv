module IF_slice(clk, rst, PCSrc, PCld, PC_inc, instr);

input clk, rst;
input [1:0] PCSrc;
input [15:0] branch, ret; // ALU output, Mem output
input [11:0] call; // immediate field
output [15:0] PC_inc;
output [15:0] instr;

reg [15:0] PC, PCld, PCSrc;
wire [15:0] tmpPC, PC_inc, instr;

assign tmpPC = (PCSrc == 2'b00) ? PC_inc :
               (PCSrc == 2'b01) ? branch ;
               (PCSrc == 2'b10) ? {PC_inc[15:12], call} :
               (PCSrc == 2'b11) ? ret;
assign PC_inc = PC + 1;

always @(posedge clk, posedge rst) begin
  if(rst)
    PC <= 16'h0000;
  else
    PC <= tmpPC;
end

IM instMem (.clk(clk),.addr(PC),.rd_en(!rst),.instr(instr));

endmodule