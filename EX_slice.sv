// Maggie White and Taylor Shoenborn
module EX_slice(clk, rst, stall, WB_in, M_in, EX_in, PC_inc_in, PCbranch_in, 
                r0data_in,
                r1data_in, bcond_in, rt_in, rd_in, imm_in, offset_in,
                flags_prv, addr, data, result, flags, PCbranch, Branch,
                WB, M, flush);

input clk, rst;
input stall;
input [6:0] WB_in;
input [1:0] M_in;
input [9:0] EX_in;
input [15:0] PC_inc_in, PCbranch_in;
input [15:0] r0data_in, r1data_in;
input [2:0] bcond_in;
input [3:0] rt_in, rd_in;
input [15:0] imm_in, offset_in;
input [2:0] flags_prv;
output [15:0] addr, data, result;
output [2:0] flags;//zero, neg, overflow
output [15:0] PCbranch;
output Branch;
output [6:0] WB;
output [1:0] M;
output [4:0] flush;

wire [3:0] ALUOp;
wire [3:0] shamt;
wire [1:0] ALUSrc;
wire CallRet, PCToMem, SPAddr, nArithInstr;

reg [6:0] WB;
reg [1:0] M;
reg [9:0] EX;
reg [15:0] PC_inc, PCbranch;
reg [15:0] r0data, r1data;
reg [3:0] rt, rd;
reg [2:0] bcond;
reg [15:0] imm, offset;

wire zr, neg, ov;

reg [15:0] a, b;

assign ALUOp = EX[3:0];
assign ALUSrc = EX[5:4];
assign PCToMem = EX[6];
assign SPAddr = EX[7];
assign nArithInstr = EX[8];
assign binstr = EX[9];

always @(posedge clk, posedge rst) begin
  if(rst) begin
    WB <= 7'h0;
    M <= 2'h0;
    EX <= 10'h000;
    PC_inc <= 16'h0000;
    PCbranch <= 16'h0000;
    r0data <= 16'h0000;
    r1data <= 16'h0000;
    rt <= 4'h0;
    rd <= 4'h0;
    bcond <= 3'h0;
    imm <= 16'h0000;
    offset <= 16'h0000;
  end else begin
    WB <= WB_in;
    M <= M_in;
    EX <= EX_in;
    PC_inc <= PC_inc_in;
    PCbranch <= PCbranch_in;
    r0data <= r0data_in;
    r1data <= r1data_in;
    rt <= rt_in;
    rd <= rd_in;
    bcond <= bcond_in;
    imm <= imm_in;
    offset <= offset_in;
  end
end
assign flags = {zr, neg, ov};

assign a = r0data;
assign b = (ALUSrc == 2'b00) ? r1data :
           (ALUSrc == 2'b01) ? imm  :
           (ALUSrc == 2'b10) ? offset :
            16'h0001;

assign addr = SPAddr ? r0data : result;
assign data = PCToMem ? PC_inc : r1data;

decideBranch db(.binstr(binstr), .bcond(bcond), .flags(flags_prv), .branch(Branch));

ALU alu(.nArithInstr(nArithInstr), .a(a), .b(b), .operation(ALUOp), .shamt(imm[3:0]), .result(result),
    .zr(zr), .neg(neg), .ov(ov));

// Insert forwarding module here

endmodule

module decideBranch(binstr, bcond, flags, branch);
  input binstr;
  input [2:0] bcond, flags;
  
  output reg branch;
  
  wire binstr, zr, neg, ov;
  
  assign zr = flags[2];
  assign neg = flags[1];
  assign ov = flags[0];
  
  typedef enum bit [2:0] {EQ = 3'h0, LT = 3'h1, GT = 3'h2, OV = 3'h3, NE = 3'h4, GE = 3'h5,
                  LE = 3'h6, UNCOND = 3'h7} cond;
  cond ebcond;
  assign ebcond = cond'(bcond);
  always @(*) begin
    branch = 0; //default
    if(binstr) begin 
        case(ebcond)
          EQ:
            if(zr) branch = 1;
          LT:
            if(neg && !ov) branch = 1;
          GT:
            if(!neg && !ov && !zr) branch = 1;
          OV:
            if(ov) branch = 1;
          NE:
            if(!zr) branch = 1;
          GE:
            if(!neg & ov) branch = 1;
          LE:
            if((neg & ov) | zr) branch = 1;
          UNCOND:
            branch = 1;
        endcase
    end
end
endmodule

module ALU(nArithInstr, a, b, operation, shamt, result, zr, neg, ov);

input nArithInstr;
input [15:0] a, b;
input [3:0] operation;
input [3:0] shamt;
output reg [15:0] result;
output zr, neg, ov;

wire [7:0] s0, s1, s2;
wire asign, bsign, dnset;

typedef enum logic [3:0] { ADD = 4'h0, SUB = 4'h1, NAND = 4'h2, XOR = 4'h3,
                   SRA = 4'h5, SRL = 4'h6, SLL  = 4'h7, LHB = 4'hA,
                   LLB = 4'hB } opcode;
opcode ALUOp;
assign ALUOp = opcode'(operation);

always @(*) begin
  case(operation)
    ADD: result <= a + b;
    SUB: result <= a - b;
    LHB: result <= {b[7:0], a[7:0]};
    LLB: result <= {a[15:8], b[7:0]};
    NAND: result <= ~(a & b);
    XOR: result <= a ^ b;
    SLL: result <= a << shamt;
    SRL: result <= a >> shamt;
    SRA: result <= {$signed(a) >>> shamt};
    default: result = 16'h0000;
  endcase
end

// 0x8000 doesn't have a positive complement - does this really matter?
assign bsign = (operation == SUB) ? ~b[15] : b[15];
assign asign = a[15];

assign dnset = nArithInstr || (operation == SLL || operation == SRL || operation == SRA);
assign addsub = ~(|operation[3:1]); // is the operation add or sub?

assign ov = dnset ? ov : // shift or non-arithmetic instruction, maintain value
       !addsub ? 1'b0  : // if NAND/XOR, clear
       (bsign && asign && !result[15]) || (!bsign && !asign && result[15]);
assign zr = dnset ? zr : ~|result;
assign neg = dnset ? neg : // shift or non-arithmetic instruction, maintain value
             !addsub ? 1'b0 : // if NAND/XOR, clear
             neg;

endmodule
