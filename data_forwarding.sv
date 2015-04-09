module data_forwarding(clk, rst, FWD_in, r0_fwd, r1_fwd, dataDep);
input clk, rst;
input [13:0] FWD_in;

output reg [1:0] r0_fwd, r1_fwd;
output reg dataDep;

reg [7:0] write_addr;   // past two write addresses
reg [1:0] RegWrite;
reg [1:0] MemToReg;
reg [13:0] FWD;

wire doublewrite;

always @(posedge clk, posedge rst) begin
  if(rst) begin
    write_addr   <= 8'h00;
    RegWrite     <= 2'h0;
    MemToReg     <= 2'h0;
    FWD          <= 14'h000;
  end else begin
    write_addr   <= {write_addr[3:0], FWD[11:8]};
    RegWrite     <= {RegWrite[0], FWD[12]};
    MemToReg     <= {MemToReg[0], FWD[13]};
    FWD          <= FWD_in;
  end
end

assign doublewrite = ((write_addr[7:4] == write_addr[3:0]) && (&RegWrite));
assign dataDep = ((FWD[12] && FWD[13]) && 
                  ((FWD_in[3:0] == FWD_in[3:0]) || (FWD_in[7:4] == FWD_in[3:0])));

always @(*) begin
  r0_fwd = 2'b00;
  r1_fwd = 2'b00;
  if(RegWrite[0]) begin   // last instruction writes to a register
    if(MemToReg[0]) begin // last instruction writes to reg from memory
      if(FWD[3:0] == write_addr[3:0]) begin
        r0_fwd = 2'b10; // still needs one cycle of stall
      end
      if(FWD[7:4] == write_addr[3:0]) begin
        r1_fwd = 2'b10; // still needs one cycle of stall
      end
    end else begin
      if(FWD[3:0] == write_addr[3:0]) begin
        r0_fwd = 2'b01;
      end
      if(FWD[7:4] == write_addr[3:0]) begin
        r1_fwd = 2'b01;
      end
    end
  end
  if(RegWrite[1] && !doublewrite) begin
    if(FWD[3:0] == write_addr[7:4]) begin
      r0_fwd = 2'b10;
    end
    if(FWD[7:4] == write_addr[7:4]) begin
      r1_fwd = 2'b10;
    end
  end
end

endmodule