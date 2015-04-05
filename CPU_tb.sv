module CPU_tb();

reg clk, rst, hlt;

initial clk = 0;
always
    #20 clk = ~clk; // 50 MHz clock

CPU iDUT(clk, rst, hlt);

always begin
  rst = 1;
  repeat(2) @(posedge clk);
  rst = 0;
  repeat(10) @(posedge clk);
end

endmodule