module CPU();



//IF
assign tmpPC = PCSrc ? PCld : PC_inc;
assign PC_inc = PC + 4;

always @(posedge clk, posedge rst) begin
  if(rst)
    PC <= 16'h0000;
  else
    PC <= tmpPC;
end

IM instMem (.clk(clk),.addr(PC),.rd_en(!rst),.instr(instr));

endmodule
