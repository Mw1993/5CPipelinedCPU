module ALU(a, b, operation, result) begin

input [15:0] a, b;
input [3:0] operation;
output [15:0] result;

typedef enum logic [2:0] { IDLE, CMD, SPI, RD_EEP, UART } state_t;

always @(*) begin
  case(operation)
    
  endcase
end

endmodule
