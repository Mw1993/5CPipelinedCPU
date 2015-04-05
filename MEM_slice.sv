// Maggie White and Taylor Shoenborn
module MEM_slice(clk, rst, M, WB_in, flags_in, addr, bcond, wdata, PCbranch_in, ALU_in,
                 rdata, PCbranch, PCret, ALU, WB, Branch);

input clk, rst;
input [2:0] M;
input [1:0] WB_in;
input [2:0] flags_in, bcond;
input [15:0] addr, wdata, PCbranch_in, ALU_in;
output [15:0] rdata;
output [15:0] PCbranch, PCret;
output [15:0] ALU;
output [1:0] WB;
output reg Branch; // take the branch

wire MemRead, MemWrite;
wire zr, neg, ov;

assign MemRead = M[0];
assign MemWrite = M[1];
assign branch = M[2]; // is this a branch instruction?

assign WB = WB_in;
assign PCbranch = PCbranch_in;
assign ALU = ALU_in;
assign PCret = rdata;

typedef enum bit [2:0] {EQ = 3'h0, LT = 3'h1, GT = 3'h2, OV = 3'h3, NE = 3'h4, GE = 3'h5,
                LE = 3'h6, UNCOND = 3'h7} cond;
cond ebcond = cond'(bcond);
always @(*) begin
  if(!branch)
    Branch = 0;
  else begin 
      case(ebcond)
        EQ:
          if(zr) Branch = 1;
        LT:
          if(neg && !ov) Branch = 1;
        GT:
          if(!neg && !ov && !zr) Branch = 1;
        OV:
          if(ov) Branch = 1;
        NE:
          if(!zr) Branch = 1;
        GE:
          if(!neg & ov) Branch = 1;
        LE:
          if((neg & ov) | zr) Branch = 1;
        UNCOND:
          Branch = 1;
      endcase
  end
end

DM data(.clk(clk),.addr(addr),.re(MemRead),.we(MemWrite),.wrt_data(wdata),.rd_data(rdata));

endmodule
