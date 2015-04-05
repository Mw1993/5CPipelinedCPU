module CPU(clk, rst, hlt);

input clk, rst, hlt;

wire SPToPC;
wire [15:0] ID_PC, ret, PC_inc_IFID, instr_IFID;
wire [15:0] write_data_WB, r0data, r1data, imm_IDEX, offset_IDEX;
wire [7:0] EX_IDEX;
wire [1:0] M_IDEX, M_EXMEM;
wire WB_IDEX, WB_EXMEM, WB_MEMWB;
wire [2:0] flags_EXMEM;
wire [3:0] rt, rd;
wire [15:0] addr_EXMEM, data_EXMEM, ALU_EXMEM;
wire [15:0] rdata, ALU_MEMWB;

wire stall;

IF_slice(.clk(clk), .rst(rst), .SPToPC(SPToPC), .stall(stall), .Call(Call), .PCcall(PCcall),
         .Branch(Branch), .PCbranch(PCbranch), .Ret(Ret),  .PCret(PCret), .PC_inc(PC_inc_IFID), .instr(instr_IFID));

ID_slice(.clk, .rst(rst), .PC_inc(PC_inc_IFID), .instr(instr_IFID),
         .write_data(write_data_WB), .PC(ID_PC), .r0data(r0data),
         .r1data(r1data), .imm(imm_IDEX), .offset(offset_IDEX), .addr(), .rs(), .rt(rt),
         .rd(rd), .PCcall(PCcall_IDEX), .EX(EX_IDEX), .M(M_IDEX), .WB(WB_IDEX));

EX_slice(.clk(clk), .rst(rst), .WB_in(WB_IDEX), .M_in(M_IDEX), .EX(EX_IDEX),
         .r0data(r0data), .r1data(r1data), .rt(rt), .rd(rd), .imm(imm_IDEX),
         .offset(offset_IDEX), .addr(addr_EXMEM),
         .data(data_EXMEM), .result(ALU_EXMEM), .flags(flags_EXMEM),
         .PCcall_in(PCcall_IDEX), .PCcall(PCcall), .PCbranch(PCbranch_EXMEM), .Call(call), .WB(WB_EXMEM), .M(M_EXMEM));

MEM_slice(.clk(clk), .rst(rst), .M(M_EXMEM), .WB_in(WB_EXMEM),
          .flags_in(flags_EXMEM), .addr(addr_EXMEM), .wdata(data_EXMEM),
          .PCbranch_in(PCbranch_EXMEM), .ALU_in(ALU_EXMEM),
          .rdata(rdata), .PCbranch(PCbranch), .PCret(PCret_MEMWB), .ALU(ALU_MEMWB),
          .WB(WB_MEMWB), .Branch(Branch));

WB_slice(.clk(clk), .rst(rst), PCret_in(PCret_MEMWB), .WB(WB_MEMWB), .ALU(ALU_MEMWB), .MemData(rdata),
         .RegData(write_data_WB), .Ret(Ret), .PCret(PCret)));

endmodule
