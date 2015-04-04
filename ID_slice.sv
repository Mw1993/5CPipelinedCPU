module ID_slice(clk, rst, PC_inc_in, instr_in, write_data_in, RegWrite_in, regWriteEn_in
                PC_inc, p0, p1, imm, rt, rd, EX, M, WB);

input clk, rst;
input [15:0] PC_inc, instr, write_data;
input [3:0] RegWrite;
input regWriteEn;

output reg [15:0] PC_inc;
output [15:0] p0, p1;
output [31:0] imm;
output [3:0] rt, rd;
output [8:0] EX;
output [1:0] M;
output [1:0] WB;



reg [15:0] instr, write_data;
reg [3:0] RegWrite;
wire [3:0] rs, shamt;
wire [5:0] opcode, funct;
wire [25:0] addr;
wire [15:0] immediate;
wire regWriteEn;
wire [3:0] p0_addr, p1_addr;

// Parts of instruction
assign opcode = instr[15:12];
assign rd = instr[11:8];
assign rs = instr[7:4];
assign rt = instr[3:0];
assign boffset = instr[7:0]; // branch offset, not sign extended
assign offset = {8{instr[7]}, instr[7:0]}; // sign extended immediate for ld/sw
assign imm = {12{offset[3]}, instr[3:0]}; // sign extended immediate for ALU
assign addr = instr[11:0]; // for call

enum logic [3:0] { ADD = 4'h0, SUB = 4'h1, NAND = 4'h2, XOR = 4'h3,
                   SRA = 4'h5, SRL = 4'h6, SLL  = 4'h7, LHB = 4'hA,
                   LLB = 4'hB } ALUOp;

assign p0_addr = ReadRd ? rd : rs;
assign p1_addr = LoadStore ? 4'hE : rt;
rf regFile(.clk(clk),.p0_addr(p0_addr),.p1_addr(p1_addr),.p0(p0),.p1(p1),.re0(1),.re1(1),
           .dst_addr(write_data),.dst(RegWrite),.we(regWriteEn),.hlt(0));

// Control logic
control ctrl(.opcode(opcode), 

endmodule

module control(opcode, RegWrite, ALUSrc, MemRead, MemToReg, LoadStore, PCSrc,
               MemWrite, ALUOp, ReadRd, Reg0Read, Reg1Read, Halt) begin

input [3:0] opcode;
output [1:0] PCSrc, ALUSrc;
output RegWrite, MemRead, MemToReg, LoadStore, MemWrite, ReadRd;
output Reg0Read, Reg1Read, Halt;
output logic [2:0] ALUOp;

enum {ADD = 4'h0, SUB  = 4'h1, NAND = 4'h2, XOR   = 4'h3, INC = 4'h4, SRA = 4'h5,
      SRL = 4'h6, SLL  = 4'h7, LW   = 4'h8, SW    = 4'h9, LHB = 4'hA, LLB = 4'hB,
      B   = 4'hC, CALL = 4'hD, RET  = 4'hE, FLUSH = 4'hF} opcode;

enum logic [3:0] { ADD = 4'h0, SUB = 4'h1, NAND = 4'h2, XOR = 4'h3,
                   SRA = 4'h5, SRL = 4'h6, SLL  = 4'h7, LHB = 4'hA,
                   LLB = 4'hB } ALUOp;

always @(*) begin
  ALUOp = 3'h0;
  ALUsrc = 2'b00;
  PCSrc = 2'b00;
  RegWrite = 0;
  MemRead = 0;
  MemToReg = 0;
  LoadStore = 0;
  MemWrite = 0;
  ReadRd = 0;
  Reg0Read = 1;
  Reg1Read = 1;
  Halt = 0;
  case(opcode)
    ADD:
    SUB:
    NAND:
    XOR:
      RegWrite = 1;
      ALUOp = opcode;
    INC:
      RegWrite = 1;
      ALUSrc = 1;
      ALUOp = ADD;
      Reg1Read = 0;
    SRA:
    SRL:
    SLL:
      RegWrite = 1;
      ALUSrc = 1;
      ALUOp = opcode;
      Reg1Read = 0;
    LW:
      RegWrite = 1;
      MemRead = 1;
      MemToReg = 1;
      Reg1Read = 0;
      LoadStore = 1;
      ALUSrc = 1;
      ALUOp = ADD;
    SW:
      MemWrite = 1;
      LoadStore = 1;
      ALUSrc = 1;
      ALUOp = ADD;
    LHB:
    LLB:
      RegWrite = 1;
      ALUSrc = 2'b10;
      ALUOp = opcode;
      ReadRd = 1;
      Reg1Read = 0;
    B:
      PCSrc = 2'b01;
      Reg0Read = 0;
      Reg1Read = 0;
    CALL:
      RegWrite = 1;
      ALUSrc = 2'b11;
      PCSrc = 2'b10;
      MemWrite = 1;
      ALUOp = SUB;
      Reg1Read = 0;
    RET:
      RegWrite = 1;
      ALUSrc = 2'b11;
      MemRead = 1;
      PCSrc = 2'b11;
      ALUOp = ADD;
      Reg1Read = 0;
    FLUSH:
  endcase
end

endmodule
