// Maggie White and Taylor Shoenborn
module EX_slice(clk, rst, stall, WB_in, M_in, EX_in, PC_inc_in, r0data_in, r1data_in, bcond_in, rt_in, rd_in, imm_in, offset_in,
                addr, data, result, flags, PCbranch, bcond, WB, M);

input clk, rst, stall;
input [6:0] WB_in;
input [2:0] M_in;
input [8:0] EX_in;
input [15:0] PC_inc_in;
input [15:0] r0data_in, r1data_in;
input [3:0] rt_in, rd_in;
input [2:0] bcond_in;
input [15:0] imm_in, offset_in;
output [15:0] addr, data, result;
output [2:0] flags;//zero, neg, overflow
output [15:0] PCbranch;
output [2:0] bcond;
output [6:0] WB;
output [2:0] M;

wire [3:0] ALUOp;
wire [3:0] shamt;
wire [1:0] ALUSrc;
wire CallRet, PCToMem, SPAddr, nArithInstr;

reg [6:0] WB;
reg [2:0] M;
reg [8:0] EX;
reg [15:0] PC_inc;
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

assign PCbranch = PC_inc + offset + 1;

always @(posedge clk, posedge rst) begin
  if(rst) begin
    WB <= 7'h0;
    M <= 3'h0;
    EX <= 9'h0;
    PC_inc <= 16'h0000;
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

ALU alu(.nArithInstr(nArithInstr), .a(a), .b(b), .operation(ALUOp), .shamt(imm[3:0]), .result(result),
    .zr(zr), .neg(neg), .ov(ov));

// Insert forwarding module here

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
