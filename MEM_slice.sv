// Maggie White and Taylor Shoenborn
module MEM_slice(clk, rst, stall, M_in, WB_in, flags_in, addr_in, bcond_in, wdata_in, PCbranch_in, ALU_in,
                 rdata, PCbranch, PCret, ALU, WB, Branch);

input clk, rst, stall;
input [2:0] M_in;
input [6:0] WB_in;
input [2:0] flags_in, bcond_in;
input [15:0] addr_in, wdata_in, PCbranch_in, ALU_in;
output [15:0] rdata;
output [15:0] PCbranch, PCret;
output [15:0] ALU;
output [6:0] WB;
output reg Branch; // take the branch

wire MemRead, MemWrite;
wire zr, neg, ov;

reg [2:0] M;
reg [6:0] WB;
reg [2:0] flags, bcond;
reg [15:0] addr, wdata, PCbranch, ALU;

assign MemRead = M[0];
assign MemWrite = M[1];
assign branch = M[2]; // is this a branch instruction?

assign zr = flags[2];
assign neg = flags[1];
assign ov = flags[0];

always @(posedge clk, posedge rst) begin
  if(rst) begin
    M <= 3'h0;
    WB <= 7'h0;
    flags <= 3'h0;
    bcond <= 3'h0;
    addr <= 16'h0000;
    wdata <= 16'h0000;
    PCbranch <= 16'h0000;
    ALU <= 16'h0000;
  end else begin
    M <= M_in;
    WB <= WB_in;
    flags <= flags_in;
    bcond <= bcond_in;
    addr <= addr_in;
    wdata <= wdata_in;
    PCbranch <= PCbranch_in;
    ALU <= ALU_in;
  end
end

assign PCret = rdata;

typedef enum bit [2:0] {EQ = 3'h0, LT = 3'h1, GT = 3'h2, OV = 3'h3, NE = 3'h4, GE = 3'h5,
                LE = 3'h6, UNCOND = 3'h7} cond;
cond ebcond;
assign ebcond = cond'(bcond);
always @(*) begin
  Branch = 0; //default
  if(branch) begin 
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
