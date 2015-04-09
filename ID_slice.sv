// Maggie White and Taylor Schoenborn
module ID_slice(clk, rst, ID_Dwrite, flush, stall, PC_inc_in, instr_in, write_addr, write_data,
                RegWrite_in, instr, PC_inc, PCbranch, r0data, r1data, imm,
                offset, Call, PCcall, rs, rt, rd, bcond, EX, M, WB, FWD);

input clk, rst;
input ID_Dwrite, flush, stall;
input [15:0] PC_inc_in, instr_in, write_data;
input [3:0] write_addr;
input RegWrite_in;

output [15:0] instr; // for hazard detection
output [15:0] PC_inc, PCbranch;
output [15:0] r0data, r1data;
output [15:0] imm, offset;
output Call;
output [15:0] PCcall; // calculated address for call instruction
output [3:0] rs, rt, rd;
output [2:0] bcond; // branch condition
output [9:0] EX;
output [1:0] M;
output [6:0] WB;
output [13:0] FWD;

reg [15:0] instr, PC_inc;
wire [3:0] opcode;
wire [3:0] r0_addr, r1_addr, dst_addr;
wire [11:0] addr;
wire re0, re1, hlt;

wire RegWrite, MemRead, MemToReg, LoadStore, 
     MemWrite, ReadRd, PCToMem, SPToMem, CallRet,
     Branch, Ret, LoadByte, SPAddr;
wire [1:0] ALUSrc;

assign PCcall = {PC_inc_in[15:12], addr};
assign PCbranch = PC_inc + offset + 1;

always @(posedge clk, posedge rst) begin
  if(rst) begin
    PC_inc <= 16'h0000;
    instr <= 16'h0000;
  end else begin
    PC_inc <= PC_inc_in;
    instr <= instr_in;
  end
end

// Parts of instruction
assign opcode = instr[15:12];
assign rd     = instr[11:8]; // write register
assign rs     = instr[7:4];
assign rt     = instr[3:0];
assign bcond  = instr[10:8];
assign offset = {{8{instr[7]}}, instr[7:0]}; // sign extended immediate for ld/sw
assign imm    = {{12{offset[3]}}, instr[3:0]}; // sign extended immediate for ALU
assign addr   = instr[11:0]; // for call

wire [3:0] ALUOp;

assign r0_addr = LoadByte ? rd :
                 LoadStore ? 4'hE :
                 CallRet ? 4'hF :
                 rs;
assign r1_addr = ReadRd    ? rd   : rt;
assign dst_addr = CallRet  ? 4'hF : rd;
assign re0 = 1;
assign re1 = 1;
assign hlt = 0;
assign rst_ctrl = stall || rst;
rf regFile(.clk(clk),.p0_addr(r0_addr),.p1_addr(r1_addr),.p0(r0data),.p1(r1data),.re0(re0),.re1(re1),
           .dst_addr(write_addr),.dst(write_data),.we(RegWrite_in),.hlt(hlt));

// Control logic
control ctrl(.rst(rst_ctrl), .opcode(opcode), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemRead(MemRead),
             .MemToReg(MemToReg), .LoadStore(LoadStore), .MemWrite(MemWrite),
             .ALUOp(ALUOp), .ReadRd(ReadRd), .PCToMem(PCToMem), .SPToMem(SPToMem),
             .Call(Call), .Branch(Branch), .Ret(Ret), .CallRet(CallRet), .LoadByte(LoadByte),
             .SPAddr(SPAddr), .Reg0Read(Reg0Read), .Reg1Read(Reg1Read), .Halt());

assign EX = {Branch, instr[15], SPAddr, PCToMem, ALUSrc, ALUOp};
assign M = {MemWrite, MemRead};
assign WB = {dst_addr, RegWrite, Ret, MemToReg};
assign FWD = {MemToReg, RegWrite, dst_addr, r1_addr, r0_addr};

endmodule

module control(rst, opcode, RegWrite, ALUSrc, MemRead, MemToReg, LoadStore,
               MemWrite, ALUOp, ReadRd, PCToMem, SPToMem, CallRet,
               Call, Branch, Ret, LoadByte, SPAddr, Reg0Read, Reg1Read, Halt);

input rst;
input  [3:0] opcode;
output reg [1:0] ALUSrc;
output reg RegWrite, MemRead, MemToReg, LoadStore, MemWrite, ReadRd, PCToMem,
       SPToMem, CallRet, Call, Branch, Ret, LoadByte, SPAddr;
output reg Reg0Read, Reg1Read, Halt;
output [3:0] ALUOp;

typedef enum bit [3:0] { ADD = 4'h0, SUB = 4'h1, NAND = 4'h2, XOR = 4'h3,
                   INC = 4'h4, SRA = 4'h5, SRL = 4'h6, SLL  = 4'h7, LW = 4'h8,
                   SW = 4'h9, LHB = 4'hA, LLB = 4'hB, B = 4'hC, CALL = 4'hD,
                   RET = 4'hE, FLUSH = 4'hF } opcd;
opcd opcod;
assign opcod = rst ? FLUSH : opcd'(opcode);
logic [3:0] ALUOp;

always @(*) begin
  ALUOp = 4'h0;
  ALUSrc = 2'b00;
  RegWrite = 0;
  MemRead = 0;
  MemToReg = 0;
  LoadStore = 0;
  MemWrite = 0;
  ReadRd = 0;
  Reg0Read = 1;
  Reg1Read = 1;
  PCToMem = 0;
  CallRet = 0;
  Halt = 0;
  Call = 0;
  Branch = 0;
  Ret = 0;
  LoadByte = 0;
  SPAddr = 0;
  case(opcod)
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
      ALUOp = 4'h0; // ADD
    end SW: begin
      MemWrite = 1;
      LoadStore = 1;
      ALUSrc = 2'b01;
      ReadRd = 1;
      ALUOp = 4'h0; // ADD
    end LHB, LLB: begin
      RegWrite = 1;
      ALUSrc = 2'b10;
      ALUOp = opcode;
      ReadRd = 1;
      Reg1Read = 0;
      LoadByte = 1;
    end B: begin
      Reg0Read = 0;
      Reg1Read = 0;
      Branch = 1;
    end CALL: begin
      RegWrite = 1;
      ALUSrc = 2'b11;
      MemWrite = 1;
      ALUOp = 4'h1; // SUB
      Reg1Read = 0;
      PCToMem = 1;
      CallRet = 1;
      Call = 1;
      SPAddr = 1;
    end RET: begin
      RegWrite = 1;
      ALUSrc = 2'b11;
      MemRead = 1;
      ALUOp = 4'h0; // ADD
      Reg1Read = 0;
      CallRet = 1;
      Ret = 1;
    end FLUSH: begin
      Reg0Read = 0;
      Reg1Read = 0;
    end
  endcase
end

endmodule
