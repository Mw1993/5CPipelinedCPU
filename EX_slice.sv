// Maggie White and Taylor Shoenborn
module EX_slice(WB_in, M_in, EX, reg0, reg1, rt, rd, zero, neg, overflow, clk, rst, WB, M);

input clk, rst;
input W;
input M;
input [8:0] EX;
input [15:0] reg0, reg1;
input [3:0] rt, rd;
input [15:0] imm, offset;
output [15:0] result;
output [2:0] flags;//zero, neg, overflow;
output WB, M;

wire [2:0] ALUOp;
wire [3:0] shamt;
wire [1:0] ALUSrc;

reg [15:0] a, b;

assign ALUOp = EX[2:0];
assign shamt = EX[6:3];
assign ALUSrc = EX[8:7];

assign a = reg0;
assign b = (ALUSrc == 2'b00) ? reg1 :
           (ALUSrc == 2'b01) ? imm  :
           (ALUSrc == 2'b10) ? offset :
           (ALUSrc == 2'b11) ? 16'h0001;

ALU(.a(reg0), .b(reg1), .operation(ALUOp), .shamt(shamt), zero, neg, overflow);

// Insert forwarding module here

endmodule

module ALU(a, b, operation, shamt, result, zero, neg, overflow);

input [15:0] a, b;
input [3:0] operation;
input [3:0] shamt;
output reg [15:0] result;
output zero, neg, overflow;

wire [7:0] s0, s1, s2;
wire asign, bsign, shift;

enum logic [3:0] { ADD = 4'h0, SUB = 4'h1, NAND = 4'h2, XOR = 4'h3,
                   SRA = 4'h5, SRL = 4'h6, SLL  = 4'h7, LHB = 4'hA,
                   LLB = 4'hB } ALUOp;

always @(*) begin
  case(operation)
    ADD: result <= a + b;
    SUB: result <= a - b;
    LHB: result <= {b[7:0], a[7:0]};
    LLB: result <= {a[15:8], b[7:0]};
    NAND: result <= ~(a & b);
    XOR: result <= a ^ b;
    NOR: result <=  ~(a | b);
    SLL: result <= a << shamt;
    SRL: result <= a >> shamt;
    SRA: result <= {$signed(a) >> shamt};
    default: result = 16'h0000;
  endcase
end

// 0x8000 doesn't have a positive complement
assign bsign = (operation == SUB) ? ~b[15] : b[15];
assign asign = a[15];

assign shift = (operation == SLL || operation == SRL || operation == SRA);

assign overflow = shift ? 1'b0 : (bsign && asign && !result[15]) || (!bsign && !asign && result[15]);
assign zero = shift ? 1'b0 : ~|result;
assign negative = shift ? 1'b0 : result[15];

endmodule
