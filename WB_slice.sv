// Maggie White and Taylor Shoenborn
module WB_slice(clk, rst, stall, PCret_in, WB_in, ALU_in, MemData_in, RegData, Ret, PCret, write_addr, RegWrite);

input clk, rst, stall;
input [6:0] WB_in;
input [15:0] PCret_in;
input [15:0] ALU_in, MemData_in;
output [15:0] RegData;
output [15:0] PCret;
output [3:0] write_addr;
output RegWrite;
output Ret;

reg [6:0] WB;
reg [15:0] PCret;
reg [15:0] ALU, MemData;

wire MemToReg;
assign MemToReg = WB[0];
assign Ret = WB[1];
assign RegWrite = WB[2];
assign write_addr = WB[6:3];

always @(posedge clk, posedge rst) begin
  if(rst) begin
    WB <= 7'h0;
    PCret <= 16'h0000;
    ALU <= 16'h0000;
    MemData <= 16'h0000;
  end else begin
    WB <= WB_in;
    PCret <= PCret_in;
    ALU <= ALU_in;
    MemData <= MemData_in;
  end
end

assign RegData = MemToReg ? MemData : ALU;

endmodule
