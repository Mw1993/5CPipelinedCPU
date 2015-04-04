// Maggie White and Taylor Shoenborn
module ID_slice(clk, rst, PC_inc, instr, write_data,
                PC, r0data, r1data, imm, offset, rt, rd, SPToPC, EX, M, WB);

input clk, rst;
input [15:0] PC_inc, instr, write_data;

output reg [15:0] PC;
output [15:0] r0data, r1data;
output [15:0] imm, offset;
output [3:0] rt, rd;
output SPToPC;
output [7:0] EX;
output [1:0] M;
output WB;

reg [15:0] instr, write_data;
wire [3:0] rs;
wire [5:0] opcode, funct;
wire [25:0] addr;
wire [15:0] immediate;
wire [3:0] r0_addr, r1_addr;

wire RegWrite, ALUSrc, MemRead, MemToReg, LoadStore, MemWrite, ReadRd,
     PCToMem, SPToMem, SPAddr, SPToPC, Reg0Read, Reg1Read, Halt;
wire [1:0] PCSrc;

// Parts of instruction
assign opcode = instr[15:12];
assign rd     = instr[11:8]; // write register
assign rs     = instr[7:4];
assign rt     = instr[3:0];
assign offset = {{8{instr[7]}}, instr[7:0]}; // sign extended immediate for ld/sw
assign imm    = {{12{offset[3]}}, instr[3:0]}; // sign extended immediate for ALU
assign addr   = instr[11:0]; // for call

enum logic [3:0] { ADD = 4'h0, SUB = 4'h1, NAND = 4'h2, XOR = 4'h3,
                   SRA = 4'h5, SRL = 4'h6, SLL  = 4'h7, LHB = 4'hA,
                   LLB = 4'hB } ALUOp;

assign r1_addr = ReadRd    ? rd   : rt;
assign r0_addr = LoadStore ? 4'hE : rs;
rf regFile(.clk(clk),.p0_addr(r0_addr),.p1_addr(r1_addr),.p0(r0data),.p1(r1data),.re0(1),.re1(1),
           .dst_addr(rd),.dst(write_data),.we(RegWrite),.hlt(0));

// PC calculation
assign PC = (PCSrc == 2'b00) ? PC_inc :
            (PCSrc == 2'b01) ? {PC_inc[15:11], addr} :
            (PCSrc == 2'b10) ? PC_inc + offset : PC_inc;

// Control logic
control ctrl(.opcode(opcode), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemRead(MemRead),
             .MemToReg(MemToReg), .LoadStore(LoadStore), .PCSrc(PCSrc),.MemWrite(MemWrite),
             .ALUOp(ALUOp), .ReadRd(ReadRd), .PCToMem(PCToMem), .SPToMem(SPToMem),
             .SPAddr(SPAddr), .SPToPC(SPToPC), .Reg0Read(Reg0Read), .Reg1Read(Reg1Read),
             .Halt);

assign EX = {PCToMem, SPAddr, ALUSrc, ALUOp};
assign M = {MemWrite, MemRead};
assign WB = MemToReg;

endmodule

module control(opcode, RegWrite, ALUSrc, MemRead, MemToReg, LoadStore, PCSrc,
               MemWrite, ALUOp, ReadRd, PCToMem, SPToMem, SPAddr, SPToPC, Reg0Read,
               Reg1Read, Halt);

input  [3:0] opcode;
output reg [1:0] PCSrc, ALUSrc;
output reg RegWrite, MemRead, MemToReg, LoadStore, MemWrite, ReadRd, PCToMem,
       SPToMem, SPAddr, SPToPC;
output reg Reg0Read, Reg1Read, Halt;
output [3:0] ALUOp;

enum bit [3:0] {ADD = 4'h0, SUB  = 4'h1, NAND = 4'h2, XOR   = 4'h3, INC = 4'h4, SRA = 4'h5,
      SRL = 4'h6, SLL  = 4'h7, LW   = 4'h8, SW    = 4'h9, LHB = 4'hA, LLB = 4'hB,
      B   = 4'hC, CALL = 4'hD, RET  = 4'hE, FLUSH = 4'hF} opcode;

logic [3:0] ALUOp;

always @(*) begin
  ALUOp = 3'h0;
  ALUSrc = 2'b00;
  PCSrc = 2'b00;
  RegWrite = 0;
  MemRead = 0;
  MemToReg = 0;
  LoadStore = 0;
  MemWrite = 0;
  ReadRd = 0;
  Reg0Read = 1;
  Reg1Read = 1;
  PCToMem = 0;
  SPAddr = 0;
  Halt = 0;
  case(opcode)
    ADD, SUB, NAND, XOR: begin
      RegWrite = 1;
      ALUOp = opcode;
    end INC: begin
      RegWrite = 1;
      ALUSrc = 2'b01;
      ALUOp = ADD;
      Reg1Read = 0;
    end SRA, SRL, SLL: begin
      RegWrite = 1;
      ALUSrc = 2'b01;
      ALUOp = opcode;
      Reg1Read = 0;
    end LW: begin
      RegWrite = 1;
      MemRead = 1;
      MemToReg = 1;
      Reg1Read = 0;
      LoadStore = 1;
      ALUSrc = 2'b01;
      ALUOp = ADD;
    end SW: begin
      MemWrite = 1;
      LoadStore = 1;
      ALUSrc = 2'b01;
      ReadRd = 1;
      ALUOp = ADD;
    end LHB, LLB: begin
      RegWrite = 1;
      ALUSrc = 2'b10;
      ALUOp = opcode;
      ReadRd = 1;
      Reg1Read = 0;
    end B: begin
      PCSrc = 2'b01;
      Reg0Read = 0;
      Reg1Read = 0;
    end CALL: begin
      RegWrite = 1;
      ALUSrc = 2'b11;
      PCSrc = 2'b10;
      MemWrite = 1;
      ALUOp = SUB;
      Reg1Read = 0;
      PCToMem = 1;
      SPAddr = 1;
    end RET: begin
      RegWrite = 1;
      ALUSrc = 2'b11;
      MemRead = 1;
      PCSrc = 2'b11;
      ALUOp = ADD;
      Reg1Read = 0;
      SPAddr = 1;
    end FLUSH: begin
      Reg0Read = 0;
      Reg1Read = 0;
    end
  endcase
end

endmodule
