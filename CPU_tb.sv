`timescale 1ns/1ns
module CPU_tb();

reg clk, rst, hlt;
reg [7:0] cycleNum;

initial clk = 0;
always
    #20 clk = ~clk; // 50 MHz clock

CPU iDUT(clk, rst, hlt);

always begin
  rst = 1;
  repeat(2) @(posedge clk);
  rst = 0;
  repeat(20) @(posedge clk);
end

always @(posedge clk, posedge rst) begin
  if (rst) begin
    cycleNum <= 8'h01;
  end else begin
    cycleNum <= cycleNum + 1;
    end
end
endmodule