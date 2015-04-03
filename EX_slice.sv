module ALU(a, b, operation, shamt, result, zero, neg, overflow);

input [15:0] a, b;
input [2:0] operation;
input [3:0] shamt;
output reg [15:0] result;
output zero, neg, overflow;

wire [7:0] s0, s1, s2;
wire asign, bsign, cornerCase;

typedef enum logic [2:0] { ADD, SUB, NAND, XOR, NOR, SLL, SRL, SRA } state_t;

always @(*) begin
  case(operation)
    ADD: result <= a + b;
    SUB: result <= a - b;
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

assign overflow = (bsign && asign && !result[15]) || (!bsign && !asign && result[15]);
assign zero = ~|result;
assign negative = result[15];

endmodule
