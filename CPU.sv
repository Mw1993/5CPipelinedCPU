module CPU(clk, rst, hlt);

input clk, rst, hlt;

/*wire SPToPC;
wire [15:0] ID_PC, Ret, PC_inc_IFID, instr_IFID;
wire [15:0] write_data_WB, r0data, r1data, imm_IDEX, offset_IDEX;
wire [7:0] EX_IDEX;
wire [1:0] M_IDEX, M_EXMEM;
wire WB_IDEX, WB_EXMEM, WB_MEMWB;
wire [2:0] flags_EXMEM;
wire [3:0] rt, rd;
wire [15:0] addr_EXMEM, data_EXMEM, ALU_EXMEM;
wire [15:0] rdata, ALU_MEMWB;*/

// IF ports
wire [15:0] PCcall, PCbranch, PCbranch_IDEX, ALU_EXMEM, ALU_MEMWB, PCret, PCret_MEMWB;
wire [15:0] PC_inc_IDEX, PC_inc, PC_inc_IFID, instr_IFID, instr_ID;

// ID ports
wire [15:0] write_data_WB, r0data, r1data;
wire [15:0] imm_IDEX, offset_IDEX;
wire [3:0] rs, rt, rd, write_addr;

// EX ports
wire [2:0] bcond_IDEX;
wire [1:0] M_EXMEM, M_IDEX;
wire [6:0] WB_EXMEM, WB_IDEX, WB_MEMWB;
wire [9:0] EX_IDEX;
wire [15:0] addr_EXMEM, data_EXMEM;
wire [2:0] flags_EXMEM, flags_MEMEX;

// MEM ports
wire [15:0] rdata;

wire stall; // sent by hazard detection unit, received by IF & ID

wire [4:0] flush; // sent by EX slice after branch decision is made (assume not taken)
wire ID_flush, hd_ID_flush;
assign ID_flush = hd_ID_flush || flush[3];

// some of these signals are not connected to anything, see figure 4.66 for reference
hazard_detection HD(.instr(instr_ID), .stall(stall), .ID_Dwrite(ID_Dwrite), .ID_flush(hd_ID_flush));

IF_slice IF(.clk(clk), .rst(rst), .stall(stall), .flush(flush[4]), .Call(Call), .PCcall(PCcall),
         .Branch(Branch), .PCbranch(PCbranch), .Ret(Ret),  .PCret(PCret), .PC_inc(PC_inc_IFID), .instr(instr_IFID));

ID_slice ID(.clk(clk), .rst(rst), .ID_Dwrite(ID_Dwrite), .flush(ID_flush), .stall(stall),
            .PC_inc_in(PC_inc_IFID), .instr_in(instr_IFID),
           .write_addr(write_addr), .write_data(write_data_WB), .RegWrite_in(RegWrite), .instr(instr_ID),
           .PC_inc(PC_inc_IDEX),
           .PCbranch(PCbranch_IDEX), .r0data(r0data),
           .r1data(r1data), .imm(imm_IDEX), .offset(offset_IDEX), .Call(Call), .PCcall(PCcall),
           .rs(rs), .rt(rt), .rd(rd), .bcond(bcond_IDEX), .EX(EX_IDEX),
           .M(M_IDEX), .WB(WB_IDEX));

EX_slice EX(.clk(clk), .rst(rst), .stall(stall), .WB_in(WB_IDEX), .M_in(M_IDEX), .EX_in(EX_IDEX),
         .PC_inc_in(PC_inc_IDEX), .PCbranch_in(PCbranch_IDEX), .r0data_in(r0data),
         .r1data_in(r1data), .bcond_in(bcond_IDEX),
         .rt_in(rt), .rd_in(rd), .imm_in(imm_IDEX), .offset_in(offset_IDEX),
         .flags_prv(flags_MEMEX), .addr(addr_EXMEM), .data(data_EXMEM), .result(ALU_EXMEM),
         .flags(flags_EXMEM), .PCbranch(PCbranch), .Branch(Branch),
         .WB(WB_EXMEM), .M(M_EXMEM), .flush(flush));

MEM_slice MEM(.clk(clk), .rst(rst), .stall(stall), .flush(flush[1]), .M_in(M_EXMEM), .WB_in(WB_EXMEM),
          .flags_in(flags_EXMEM), .addr_in(addr_EXMEM), .wdata_in(data_EXMEM),
          .ALU_in(ALU_EXMEM),
          .rdata(rdata), .PCret(PCret_MEMWB), .ALU(ALU_MEMWB),
          .flags(flags_MEMEX), .WB(WB_MEMWB));

WB_slice WB(.clk(clk), .rst(rst), .stall(stall), .flush(flush[0]), .PCret_in(PCret_MEMWB), .WB_in(WB_MEMWB),
            .ALU_in(ALU_MEMWB), .MemData_in(rdata),
            .RegData(write_data_WB), .Ret(Ret), .PCret(PCret), .write_addr(write_addr), .RegWrite(RegWrite));

endmodule
