// Maggie White and Taylor Schoenborn
module hazard_detection(clk, rst, dataDep, cur_Ret, stall);

input clk, rst;
input dataDep, cur_Ret;

output reg stall;

reg [2:0] Stall;
reg Ret;

assign stall = Stall[0] || dataDep;

always @(posedge clk, posedge rst) begin
  if(rst) begin
    Stall <= 3'h0;
  end else if (cur_Ret) begin
    Stall <= 3'b111;
  end else begin
    Stall <= {1'b0, Stall[2:1]};
  end
end

endmodule