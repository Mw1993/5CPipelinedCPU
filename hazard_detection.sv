// Maggie White and Taylor Schoenborn
module hazard_detection(instr, stall, ID_Dwrite, ID_flush);

input [15:0] instr; // obtained from ID stage

output reg stall;
output ID_Dwrite; // inverse of stall?
output ID_flush;

assign stall = 0;
assign ID_Dwrite = 0;
assign ID_flush = 0;

endmodule