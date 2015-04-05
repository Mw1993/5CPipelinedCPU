// Maggie White and Taylor Shoenborn
module EX_slice(clk, rst, WB_in, M_in, EX, PC_inc, r0data, r1data, bcond_in, rt, rd, imm, offset,
                addr, data, result, flags, PCbranch, bcond, WB, M);

input clk, rst;
input [1:0] WB_in;
input [2:0] M_in;
input [7:0] EX;
input [15:0] PC_inc;
input [15:0] r0data, r1data;
input [3:0] rt, rd;
input [2:0] bcond_in;
input [15:0] imm, offset;
output [15:0] addr, data, result;
output [2:0] flags;//zero, neg, overflow;
output [15:0] PCbranch;
output [2:0] bcond;
output [1:0] WB;
output [2:0] M;

wire [3:0] ALUOp;
wire [3:0] shamt;
wire [1:0] ALUSrc;

wire zr, neg, ov;

reg [15:0] a, b;

assign ALUOp = EX[3:0];
assign ALUSrc = EX[5:4];
assign SPAddr = EX[6];
assign PCToMem = EX[7];

assign PCbranch = PC_inc + offset + 1;

assign bcond = bcond_in;
assign WB = WB_in;
assign M = M_in;
assign flags = {zr, neg, ov};

assign a = r0data;
assign b = (ALUSrc == 2'b00) ? r1data :
           (ALUSrc == 2'b01) ? imm  :
           (ALUSrc == 2'b10) ? offset :
            16'h0001;

assign addr = SPAddr ? r0data : result;
assign data = PCToMem ? PC_inc : r1data;

ALU alu(.a(a), .b(b), .operation(ALUOp), .shamt(imm[3:0]), .result(result),
    .zr(zr), .neg(neg), .ov(ov));

// Insert forwarding module here

endmodule

module ALU(a, b, operation, shamt, result, zr, neg, ov);

input [15:0] a, b;
input [3:0] operation;
input [3:0] shamt;
output reg [15:0] result;
output zr, neg, ov;

wire [7:0] s0, s1, s2;
wire asign, bsign, shift;

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

assign shift = (operation == SLL || operation == SRL || operation == SRA);

assign ov = shift ? 1'b0 : (bsign && asign && !result[15]) || (!bsign && !asign && result[15]);
assign zr = shift ? 1'b0 : ~|result;
assign neg = shift ? 1'b0 : result[15];

endmodule
