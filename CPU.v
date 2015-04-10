
module IF_slice_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  XOR2D1BWP U1 ( .A1(carry[15]), .A2(A[15]), .Z(SUM[15]) );
  HA1D0BWP U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  HA1D0BWP U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  HA1D0BWP U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  HA1D0BWP U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  HA1D0BWP U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  HA1D0BWP U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  HA1D0BWP U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  HA1D0BWP U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  HA1D0BWP U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  HA1D0BWP U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  HA1D0BWP U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  HA1D0BWP U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  HA1D0BWP U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  HA1D0BWP U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  INVD1BWP U2 ( .I(A[0]), .ZN(SUM[0]) );
endmodule


module CPU_sim ( clk, rst, hlt );
  input clk, rst, hlt;
  wire   cur_Ret, Call, Branch, Ret, RegWrite, \HD/N4 , \HD/N3 , \DF/FWD[0] ,
         \DF/FWD[1] , \DF/FWD[2] , \DF/FWD[3] , \DF/FWD[4] , \DF/FWD[5] ,
         \DF/FWD[6] , \DF/FWD[7] , \DF/FWD[8] , \DF/FWD[9] , \DF/FWD[10] ,
         \DF/FWD[11] , \DF/FWD[12] , \DF/FWD[13] , \DF/MemToReg[0] ,
         \DF/RegWrite[0] , \DF/RegWrite[1] , \DF/write_addr[0] ,
         \DF/write_addr[1] , \DF/write_addr[2] , \DF/write_addr[3] ,
         \DF/write_addr[4] , \DF/write_addr[5] , \DF/write_addr[6] ,
         \DF/write_addr[7] , \IF/n54 , \IF/n53 , \IF/n52 , \IF/n51 , \IF/n50 ,
         \IF/n49 , \IF/n48 , \IF/n47 , \IF/n46 , \IF/n45 , \IF/n44 , \IF/n43 ,
         \IF/n42 , \IF/n41 , \IF/n40 , \IF/n39 , \IF/PC[0] , \IF/PC[1] ,
         \IF/PC[2] , \IF/PC[3] , \IF/PC[4] , \IF/PC[5] , \IF/PC[6] ,
         \IF/PC[7] , \IF/PC[8] , \IF/PC[9] , \IF/PC[10] , \IF/PC[11] ,
         \IF/PC[12] , \IF/PC[13] , \IF/PC[14] , \IF/PC[15] ,
         \ID/add_1_root_add_39_2/carry[1] , \ID/add_1_root_add_39_2/carry[2] ,
         \ID/add_1_root_add_39_2/carry[3] , \ID/add_1_root_add_39_2/carry[4] ,
         \ID/add_1_root_add_39_2/carry[5] , \ID/add_1_root_add_39_2/carry[6] ,
         \ID/add_1_root_add_39_2/carry[7] , \ID/add_1_root_add_39_2/carry[8] ,
         \ID/add_1_root_add_39_2/carry[9] , \ID/add_1_root_add_39_2/carry[10] ,
         \ID/add_1_root_add_39_2/carry[11] ,
         \ID/add_1_root_add_39_2/carry[12] ,
         \ID/add_1_root_add_39_2/carry[13] ,
         \ID/add_1_root_add_39_2/carry[14] ,
         \ID/add_1_root_add_39_2/carry[15] , \ID/rst_ctrl , \ID/ReadRd ,
         \ID/CallRet , \ID/LoadStore , \ID/LoadByte , \ID/BCR , \ID/tmpBCR ,
         \EX/imm[0] , \EX/imm[1] , \EX/imm[2] , \EX/imm[3] , \EX/imm[4] ,
         \EX/imm[5] , \EX/imm[6] , \EX/imm[7] , \EX/imm[8] , \EX/imm[9] ,
         \EX/imm[10] , \EX/imm[11] , \EX/imm[12] , \EX/imm[13] , \EX/imm[14] ,
         \EX/imm[15] , \EX/ALUSrc[0] , \EX/ALUSrc[1] , \EX/EX[6] , \EX/EX[7] ,
         \EX/EX[8] , \EX/EX[9] , \WB/WB[0] , n89, n90, n91, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405;
  wire   [13:0] FWD;
  wire   [15:0] PCcall;
  wire   [15:0] PCbranch;
  wire   [15:0] PCret;
  wire   [15:0] PC_inc_IFID;
  wire   [15:0] instr_IFID;
  wire   [3:0] write_addr;
  wire   [15:0] PC_inc_IDEX;
  wire   [15:0] PCbranch_IDEX;
  wire   [15:0] r0data;
  wire   [15:0] r1data;
  wire   [9:0] EX_IDEX;
  wire   [1:0] M_IDEX;
  wire   [6:0] WB_IDEX;
  wire   [15:0] ALU_MEMWB;
  wire   [2:0] flags_MEMEX;
  wire   [15:0] addr_EXMEM;
  wire   [15:0] data_EXMEM;
  wire   [15:0] ALU_EXMEM;
  wire   [2:0] flags_EXMEM;
  wire   [6:0] WB_EXMEM;
  wire   [1:0] M_EXMEM;
  wire   [15:0] rdata;
  wire   [6:0] WB_MEMWB;
  wire   [2:0] \HD/Stall ;
  wire   [14:12] \ID/instr ;
  wire   [15:0] \EX/b ;
  wire   [15:0] \EX/r0data_fwd ;
  wire   [15:0] \EX/offset ;
  wire   [2:0] \EX/bcond ;
  wire   [15:0] \EX/r1data ;
  wire   [15:0] \EX/r0data ;
  wire   [15:0] \EX/PC_inc ;
  wire   [3:0] \EX/ALUOp ;
  wire   [15:0] \MEM/wdata ;
  wire   [15:0] \MEM/addr ;
  wire   [1:0] \MEM/M ;
  wire   [15:0] \WB/MemData ;
  wire   [15:0] \WB/ALU ;

  OR2D1BWP U105 ( .A1(n266), .A2(n250), .Z(n157) );
  OR2D1BWP U115 ( .A1(\HD/Stall [2]), .A2(cur_Ret), .Z(\HD/N4 ) );
  OR2D1BWP U116 ( .A1(\HD/Stall [1]), .A2(cur_Ret), .Z(\HD/N3 ) );
  XOR2D1BWP U150 ( .A1(\DF/write_addr[5] ), .A2(\DF/FWD[1] ), .Z(n178) );
  XOR2D1BWP U151 ( .A1(\DF/write_addr[4] ), .A2(\DF/FWD[0] ), .Z(n177) );
  XNR2D1BWP U153 ( .A1(\DF/write_addr[7] ), .A2(\DF/FWD[3] ), .ZN(n184) );
  XNR2D1BWP U154 ( .A1(\DF/write_addr[6] ), .A2(\DF/FWD[2] ), .ZN(n182) );
  XNR2D1BWP U155 ( .A1(\DF/write_addr[3] ), .A2(\DF/FWD[3] ), .ZN(n180) );
  XNR2D1BWP U156 ( .A1(n331), .A2(\DF/FWD[2] ), .ZN(n174) );
  XNR2D1BWP U158 ( .A1(\DF/write_addr[1] ), .A2(\DF/FWD[1] ), .ZN(n171) );
  XNR2D1BWP U159 ( .A1(\DF/write_addr[0] ), .A2(\DF/FWD[0] ), .ZN(n170) );
  XNR2D1BWP U234 ( .A1(\DF/write_addr[1] ), .A2(\DF/FWD[5] ), .ZN(n223) );
  XNR2D1BWP U235 ( .A1(\DF/write_addr[3] ), .A2(\DF/FWD[7] ), .ZN(n224) );
  XNR2D1BWP U236 ( .A1(\DF/write_addr[0] ), .A2(\DF/FWD[4] ), .ZN(n226) );
  XNR2D1BWP U237 ( .A1(n331), .A2(\DF/FWD[6] ), .ZN(n227) );
  XOR2D1BWP U238 ( .A1(\DF/write_addr[5] ), .A2(\DF/FWD[5] ), .Z(n230) );
  XOR2D1BWP U239 ( .A1(\DF/write_addr[4] ), .A2(\DF/FWD[4] ), .Z(n229) );
  XNR2D1BWP U241 ( .A1(\DF/write_addr[7] ), .A2(\DF/FWD[7] ), .ZN(n234) );
  OA31D1BWP U242 ( .A1(n235), .A2(n236), .A3(n237), .B(\DF/RegWrite[1] ), .Z(
        n183) );
  XOR2D1BWP U243 ( .A1(\DF/write_addr[5] ), .A2(\DF/write_addr[1] ), .Z(n237)
         );
  XOR2D1BWP U244 ( .A1(\DF/write_addr[4] ), .A2(\DF/write_addr[0] ), .Z(n236)
         );
  XNR2D1BWP U246 ( .A1(\DF/write_addr[6] ), .A2(\DF/write_addr[2] ), .ZN(n239)
         );
  XNR2D1BWP U247 ( .A1(\DF/write_addr[7] ), .A2(\DF/write_addr[3] ), .ZN(n238)
         );
  XNR2D1BWP U248 ( .A1(\DF/write_addr[6] ), .A2(\DF/FWD[6] ), .ZN(n233) );
  IM \IF/instMem  ( .clk(clk), .addr({\IF/PC[15] , \IF/PC[14] , \IF/PC[13] , 
        \IF/PC[12] , \IF/PC[11] , \IF/PC[10] , \IF/PC[9] , \IF/PC[8] , 
        \IF/PC[7] , \IF/PC[6] , \IF/PC[5] , \IF/PC[4] , \IF/PC[3] , \IF/PC[2] , 
        \IF/PC[1] , \IF/PC[0] }), .rd_en(n293), .instr(instr_IFID) );
  control \ID/ctrl  ( .rst(\ID/rst_ctrl ), .opcode({EX_IDEX[8], \ID/instr }), 
        .RegWrite(WB_IDEX[2]), .ALUSrc(EX_IDEX[5:4]), .MemRead(M_IDEX[0]), 
        .MemToReg(WB_IDEX[0]), .LoadStore(\ID/LoadStore ), .MemWrite(M_IDEX[1]), .ALUOp(EX_IDEX[3:0]), .ReadRd(\ID/ReadRd ), .PCToMem(EX_IDEX[6]), .CallRet(
        \ID/CallRet ), .Call(Call), .Branch(EX_IDEX[9]), .Ret(cur_Ret), 
        .LoadByte(\ID/LoadByte ), .SPAddr(EX_IDEX[7]) );
  rf \ID/regFile  ( .clk(clk), .p0_addr(FWD[3:0]), .p1_addr(FWD[7:4]), .p0(
        r0data), .p1(r1data), .re0(n324), .re1(n324), .dst_addr(write_addr), 
        .dst({n404, n403, n402, n401, n400, n399, n398, n397, n396, n395, n394, 
        n393, n392, n391, n390, n389}), .we(RegWrite), .hlt(n323) );
  ALU \EX/alu  ( .nArithInstr(\EX/EX[8] ), .a(\EX/r0data_fwd ), .b(\EX/b ), 
        .operation(\EX/ALUOp ), .shamt({\EX/imm[3] , \EX/imm[2] , \EX/imm[1] , 
        \EX/imm[0] }), .result(ALU_EXMEM), .zr(flags_EXMEM[2]), .neg(
        flags_EXMEM[1]), .ov(flags_EXMEM[0]) );
  decideBranch \EX/db  ( .binstr(\EX/EX[9] ), .bcond(\EX/bcond ), .flags(
        flags_MEMEX), .branch(Branch) );
  DM \MEM/data  ( .clk(clk), .addr(\MEM/addr ), .re(\MEM/M [0]), .we(
        \MEM/M [1]), .wrt_data(\MEM/wdata ), .rd_data(rdata) );
  IF_slice_DW01_inc_0 \IF/add_17  ( .A({\IF/PC[15] , \IF/PC[14] , \IF/PC[13] , 
        \IF/PC[12] , \IF/PC[11] , \IF/PC[10] , \IF/PC[9] , \IF/PC[8] , 
        \IF/PC[7] , \IF/PC[6] , \IF/PC[5] , \IF/PC[4] , \IF/PC[3] , \IF/PC[2] , 
        \IF/PC[1] , \IF/PC[0] }), .SUM(PC_inc_IFID) );
  DFCNQD1BWP \EX/r0data_reg[13]  ( .D(r0data[13]), .CP(clk), .CDN(n284), .Q(
        \EX/r0data [13]) );
  DFCNQD1BWP \EX/r0data_reg[14]  ( .D(r0data[14]), .CP(clk), .CDN(n284), .Q(
        \EX/r0data [14]) );
  DFCNQD1BWP \EX/r0data_reg[15]  ( .D(r0data[15]), .CP(clk), .CDN(n284), .Q(
        \EX/r0data [15]) );
  DFCNQD1BWP \WB/PCret_reg[12]  ( .D(rdata[12]), .CP(clk), .CDN(n291), .Q(
        PCret[12]) );
  DFCNQD1BWP \WB/PCret_reg[13]  ( .D(rdata[13]), .CP(clk), .CDN(n291), .Q(
        PCret[13]) );
  DFCNQD1BWP \WB/PCret_reg[14]  ( .D(rdata[14]), .CP(clk), .CDN(n302), .Q(
        PCret[14]) );
  DFCNQD1BWP \WB/PCret_reg[15]  ( .D(rdata[15]), .CP(clk), .CDN(n304), .Q(
        PCret[15]) );
  DFCNQD1BWP \WB/PCret_reg[0]  ( .D(rdata[0]), .CP(clk), .CDN(n290), .Q(
        PCret[0]) );
  DFCNQD1BWP \WB/PCret_reg[1]  ( .D(rdata[1]), .CP(clk), .CDN(n290), .Q(
        PCret[1]) );
  DFCNQD1BWP \WB/PCret_reg[2]  ( .D(rdata[2]), .CP(clk), .CDN(n290), .Q(
        PCret[2]) );
  DFCNQD1BWP \WB/PCret_reg[3]  ( .D(rdata[3]), .CP(clk), .CDN(n290), .Q(
        PCret[3]) );
  DFCNQD1BWP \WB/PCret_reg[4]  ( .D(rdata[4]), .CP(clk), .CDN(n290), .Q(
        PCret[4]) );
  DFCNQD1BWP \WB/PCret_reg[5]  ( .D(rdata[5]), .CP(clk), .CDN(n290), .Q(
        PCret[5]) );
  DFCNQD1BWP \WB/PCret_reg[6]  ( .D(rdata[6]), .CP(clk), .CDN(n291), .Q(
        PCret[6]) );
  DFCNQD1BWP \WB/PCret_reg[7]  ( .D(rdata[7]), .CP(clk), .CDN(n291), .Q(
        PCret[7]) );
  DFCNQD1BWP \WB/PCret_reg[8]  ( .D(rdata[8]), .CP(clk), .CDN(n291), .Q(
        PCret[8]) );
  DFCNQD1BWP \WB/PCret_reg[9]  ( .D(rdata[9]), .CP(clk), .CDN(n291), .Q(
        PCret[9]) );
  DFCNQD1BWP \WB/PCret_reg[10]  ( .D(rdata[10]), .CP(clk), .CDN(n291), .Q(
        PCret[10]) );
  DFCNQD1BWP \WB/PCret_reg[11]  ( .D(rdata[11]), .CP(clk), .CDN(n291), .Q(
        PCret[11]) );
  DFCNQD1BWP \EX/r1data_reg[13]  ( .D(r1data[13]), .CP(clk), .CDN(n285), .Q(
        \EX/r1data [13]) );
  DFCNQD1BWP \EX/r1data_reg[14]  ( .D(r1data[14]), .CP(clk), .CDN(n285), .Q(
        \EX/r1data [14]) );
  DFCNQD1BWP \EX/r1data_reg[15]  ( .D(r1data[15]), .CP(clk), .CDN(n285), .Q(
        \EX/r1data [15]) );
  DFCNQD1BWP \WB/MemData_reg[9]  ( .D(rdata[9]), .CP(clk), .CDN(n288), .Q(
        \WB/MemData [9]) );
  DFCNQD1BWP \EX/r0data_reg[0]  ( .D(r0data[0]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [0]) );
  DFCNQD1BWP \EX/r0data_reg[1]  ( .D(r0data[1]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [1]) );
  DFCNQD1BWP \EX/r0data_reg[2]  ( .D(r0data[2]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [2]) );
  DFCNQD1BWP \EX/r0data_reg[3]  ( .D(r0data[3]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [3]) );
  DFCNQD1BWP \EX/r0data_reg[4]  ( .D(r0data[4]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [4]) );
  DFCNQD1BWP \EX/r0data_reg[5]  ( .D(r0data[5]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [5]) );
  DFCNQD1BWP \EX/r0data_reg[6]  ( .D(r0data[6]), .CP(clk), .CDN(n286), .Q(
        \EX/r0data [6]) );
  DFCNQD1BWP \EX/r0data_reg[7]  ( .D(r0data[7]), .CP(clk), .CDN(n285), .Q(
        \EX/r0data [7]) );
  DFCNQD1BWP \EX/r0data_reg[8]  ( .D(r0data[8]), .CP(clk), .CDN(n285), .Q(
        \EX/r0data [8]) );
  DFCNQD1BWP \EX/r0data_reg[9]  ( .D(r0data[9]), .CP(clk), .CDN(n285), .Q(
        \EX/r0data [9]) );
  DFCNQD1BWP \EX/r0data_reg[10]  ( .D(r0data[10]), .CP(clk), .CDN(n285), .Q(
        \EX/r0data [10]) );
  DFCNQD1BWP \EX/r0data_reg[11]  ( .D(r0data[11]), .CP(clk), .CDN(n285), .Q(
        \EX/r0data [11]) );
  DFCNQD1BWP \EX/r0data_reg[12]  ( .D(r0data[12]), .CP(clk), .CDN(n284), .Q(
        \EX/r0data [12]) );
  DFCNQD1BWP \WB/MemData_reg[0]  ( .D(rdata[0]), .CP(clk), .CDN(n288), .Q(
        \WB/MemData [0]) );
  DFCNQD1BWP \WB/MemData_reg[1]  ( .D(rdata[1]), .CP(clk), .CDN(n288), .Q(
        \WB/MemData [1]) );
  DFCNQD1BWP \WB/MemData_reg[2]  ( .D(rdata[2]), .CP(clk), .CDN(n288), .Q(
        \WB/MemData [2]) );
  DFCNQD1BWP \WB/MemData_reg[3]  ( .D(rdata[3]), .CP(clk), .CDN(n288), .Q(
        \WB/MemData [3]) );
  DFCNQD1BWP \WB/MemData_reg[4]  ( .D(rdata[4]), .CP(clk), .CDN(n288), .Q(
        \WB/MemData [4]) );
  DFCNQD1BWP \WB/MemData_reg[5]  ( .D(rdata[5]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [5]) );
  DFCNQD1BWP \WB/MemData_reg[6]  ( .D(rdata[6]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [6]) );
  DFCNQD1BWP \WB/MemData_reg[7]  ( .D(rdata[7]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [7]) );
  DFCNQD1BWP \WB/MemData_reg[8]  ( .D(rdata[8]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [8]) );
  DFCNQD1BWP \WB/MemData_reg[10]  ( .D(rdata[10]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [10]) );
  DFCNQD1BWP \WB/MemData_reg[11]  ( .D(rdata[11]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [11]) );
  DFCNQD1BWP \WB/MemData_reg[12]  ( .D(rdata[12]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [12]) );
  DFCNQD1BWP \WB/MemData_reg[13]  ( .D(rdata[13]), .CP(clk), .CDN(n289), .Q(
        \WB/MemData [13]) );
  DFCNQD1BWP \WB/MemData_reg[14]  ( .D(rdata[14]), .CP(clk), .CDN(n290), .Q(
        \WB/MemData [14]) );
  DFCNQD1BWP \WB/MemData_reg[15]  ( .D(rdata[15]), .CP(clk), .CDN(n290), .Q(
        \WB/MemData [15]) );
  DFCNQD1BWP \EX/r1data_reg[0]  ( .D(r1data[0]), .CP(clk), .CDN(n292), .Q(
        \EX/r1data [0]) );
  DFCNQD1BWP \EX/r1data_reg[1]  ( .D(r1data[1]), .CP(clk), .CDN(n292), .Q(
        \EX/r1data [1]) );
  DFCNQD1BWP \EX/r1data_reg[2]  ( .D(r1data[2]), .CP(clk), .CDN(n292), .Q(
        \EX/r1data [2]) );
  DFCNQD1BWP \EX/r1data_reg[3]  ( .D(r1data[3]), .CP(clk), .CDN(n292), .Q(
        \EX/r1data [3]) );
  DFCNQD1BWP \EX/r1data_reg[4]  ( .D(r1data[4]), .CP(clk), .CDN(n293), .Q(
        \EX/r1data [4]) );
  DFCNQD1BWP \EX/r1data_reg[5]  ( .D(r1data[5]), .CP(clk), .CDN(n293), .Q(
        \EX/r1data [5]) );
  DFCNQD1BWP \EX/r1data_reg[6]  ( .D(r1data[6]), .CP(clk), .CDN(n293), .Q(
        \EX/r1data [6]) );
  DFCNQD1BWP \EX/r1data_reg[7]  ( .D(r1data[7]), .CP(clk), .CDN(n293), .Q(
        \EX/r1data [7]) );
  DFCNQD1BWP \EX/r1data_reg[8]  ( .D(r1data[8]), .CP(clk), .CDN(n287), .Q(
        \EX/r1data [8]) );
  DFCNQD1BWP \EX/r1data_reg[9]  ( .D(r1data[9]), .CP(clk), .CDN(n287), .Q(
        \EX/r1data [9]) );
  DFCNQD1BWP \EX/r1data_reg[10]  ( .D(r1data[10]), .CP(clk), .CDN(n287), .Q(
        \EX/r1data [10]) );
  DFCNQD1BWP \EX/r1data_reg[11]  ( .D(r1data[11]), .CP(clk), .CDN(n287), .Q(
        \EX/r1data [11]) );
  DFCNQD1BWP \EX/r1data_reg[12]  ( .D(r1data[12]), .CP(clk), .CDN(n286), .Q(
        \EX/r1data [12]) );
  FA1D0BWP \ID/U55  ( .A(PC_inc_IDEX[14]), .B(n241), .CI(
        \ID/add_1_root_add_39_2/carry[14] ), .CO(
        \ID/add_1_root_add_39_2/carry[15] ), .S(PCbranch_IDEX[14]) );
  XOR3D1BWP \ID/U65  ( .A1(PC_inc_IDEX[15]), .A2(n283), .A3(
        \ID/add_1_root_add_39_2/carry[15] ), .Z(PCbranch_IDEX[15]) );
  FA1D0BWP \ID/U54  ( .A(PC_inc_IDEX[13]), .B(n241), .CI(
        \ID/add_1_root_add_39_2/carry[13] ), .CO(
        \ID/add_1_root_add_39_2/carry[14] ), .S(PCbranch_IDEX[13]) );
  FA1D0BWP \ID/U53  ( .A(PC_inc_IDEX[12]), .B(n241), .CI(
        \ID/add_1_root_add_39_2/carry[12] ), .CO(
        \ID/add_1_root_add_39_2/carry[13] ), .S(PCbranch_IDEX[12]) );
  FA1D0BWP \ID/U52  ( .A(PC_inc_IDEX[11]), .B(n241), .CI(
        \ID/add_1_root_add_39_2/carry[11] ), .CO(
        \ID/add_1_root_add_39_2/carry[12] ), .S(PCbranch_IDEX[11]) );
  FA1D0BWP \ID/U51  ( .A(PC_inc_IDEX[10]), .B(n241), .CI(
        \ID/add_1_root_add_39_2/carry[10] ), .CO(
        \ID/add_1_root_add_39_2/carry[11] ), .S(PCbranch_IDEX[10]) );
  FA1D0BWP \ID/U49  ( .A(PC_inc_IDEX[8]), .B(n282), .CI(
        \ID/add_1_root_add_39_2/carry[8] ), .CO(
        \ID/add_1_root_add_39_2/carry[9] ), .S(PCbranch_IDEX[8]) );
  FA1D0BWP \ID/U50  ( .A(PC_inc_IDEX[9]), .B(n283), .CI(
        \ID/add_1_root_add_39_2/carry[9] ), .CO(
        \ID/add_1_root_add_39_2/carry[10] ), .S(PCbranch_IDEX[9]) );
  FA1D0BWP \ID/U48  ( .A(PC_inc_IDEX[7]), .B(n283), .CI(
        \ID/add_1_root_add_39_2/carry[7] ), .CO(
        \ID/add_1_root_add_39_2/carry[8] ), .S(PCbranch_IDEX[7]) );
  FA1D0BWP \ID/U62  ( .A(PC_inc_IDEX[3]), .B(n280), .CI(
        \ID/add_1_root_add_39_2/carry[3] ), .CO(
        \ID/add_1_root_add_39_2/carry[4] ), .S(PCbranch_IDEX[3]) );
  FA1D0BWP \ID/U64  ( .A(PC_inc_IDEX[6]), .B(PCcall[6]), .CI(
        \ID/add_1_root_add_39_2/carry[6] ), .CO(
        \ID/add_1_root_add_39_2/carry[7] ), .S(PCbranch_IDEX[6]) );
  FA1D0BWP \ID/U63  ( .A(PC_inc_IDEX[5]), .B(PCcall[5]), .CI(
        \ID/add_1_root_add_39_2/carry[5] ), .CO(
        \ID/add_1_root_add_39_2/carry[6] ), .S(PCbranch_IDEX[5]) );
  FA1D0BWP \ID/U61  ( .A(PC_inc_IDEX[4]), .B(PCcall[4]), .CI(
        \ID/add_1_root_add_39_2/carry[4] ), .CO(
        \ID/add_1_root_add_39_2/carry[5] ), .S(PCbranch_IDEX[4]) );
  FA1D0BWP \ID/U60  ( .A(PC_inc_IDEX[2]), .B(PCcall[2]), .CI(
        \ID/add_1_root_add_39_2/carry[2] ), .CO(
        \ID/add_1_root_add_39_2/carry[3] ), .S(PCbranch_IDEX[2]) );
  FA1D0BWP \ID/U59  ( .A(PC_inc_IDEX[1]), .B(PCcall[1]), .CI(
        \ID/add_1_root_add_39_2/carry[1] ), .CO(
        \ID/add_1_root_add_39_2/carry[2] ), .S(PCbranch_IDEX[1]) );
  EDFCND1BWP \ID/instr_reg[11]  ( .D(instr_IFID[11]), .E(n240), .CP(clk), 
        .CDN(n245), .Q(PCcall[11]), .QN(n332) );
  EDFCND1BWP \ID/instr_reg[8]  ( .D(instr_IFID[8]), .E(n321), .CP(clk), .CDN(
        n245), .Q(PCcall[8]), .QN(n338) );
  EDFCND1BWP \ID/instr_reg[7]  ( .D(instr_IFID[7]), .E(n240), .CP(clk), .CDN(
        n245), .Q(n241), .QN(n281) );
  EDFCND1BWP \ID/instr_reg[6]  ( .D(instr_IFID[6]), .E(n322), .CP(clk), .CDN(
        n245), .Q(PCcall[6]), .QN(n335) );
  EDFCND1BWP \ID/instr_reg[5]  ( .D(instr_IFID[5]), .E(n322), .CP(clk), .CDN(
        n245), .Q(PCcall[5]), .QN(n334) );
  EDFCND1BWP \ID/instr_reg[3]  ( .D(instr_IFID[3]), .E(n322), .CP(clk), .CDN(
        n245), .Q(n242), .QN(n279) );
  EDFCND1BWP \ID/PC_inc_reg[3]  ( .D(PC_inc_IFID[3]), .E(n322), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[3]) );
  EDFCND1BWP \ID/PC_inc_reg[2]  ( .D(PC_inc_IFID[2]), .E(n322), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[2]) );
  EDFCND1BWP \ID/PC_inc_reg[1]  ( .D(PC_inc_IFID[1]), .E(n322), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[1]) );
  EDFCND1BWP \ID/PC_inc_reg[0]  ( .D(PC_inc_IFID[0]), .E(n322), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[0]), .QN(n333) );
  EDFCND1BWP \ID/instr_reg[4]  ( .D(instr_IFID[4]), .E(n319), .CP(clk), .CDN(
        n245), .Q(PCcall[4]) );
  EDFCND1BWP \ID/instr_reg[2]  ( .D(instr_IFID[2]), .E(n319), .CP(clk), .CDN(
        n245), .Q(PCcall[2]) );
  EDFCND1BWP \ID/instr_reg[1]  ( .D(instr_IFID[1]), .E(n319), .CP(clk), .CDN(
        n245), .Q(PCcall[1]) );
  EDFCND1BWP \ID/instr_reg[0]  ( .D(instr_IFID[0]), .E(n319), .CP(clk), .CDN(
        n245), .Q(PCcall[0]), .QN(n339) );
  EDFCND1BWP \ID/instr_reg[15]  ( .D(instr_IFID[15]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(EX_IDEX[8]) );
  EDFCND1BWP \ID/instr_reg[14]  ( .D(instr_IFID[14]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(\ID/instr [14]) );
  EDFCND1BWP \ID/instr_reg[13]  ( .D(instr_IFID[13]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(\ID/instr [13]) );
  EDFCND1BWP \ID/instr_reg[12]  ( .D(instr_IFID[12]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(\ID/instr [12]) );
  EDFCND1BWP \ID/instr_reg[10]  ( .D(instr_IFID[10]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(PCcall[10]), .QN(n337) );
  EDFCND1BWP \ID/instr_reg[9]  ( .D(instr_IFID[9]), .E(n321), .CP(clk), .CDN(
        n245), .Q(PCcall[9]), .QN(n336) );
  EDFCND1BWP \ID/PC_inc_reg[5]  ( .D(PC_inc_IFID[5]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[5]) );
  EDFCND1BWP \ID/PC_inc_reg[4]  ( .D(PC_inc_IFID[4]), .E(n321), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[4]) );
  EDFCND1BWP \ID/PC_inc_reg[6]  ( .D(PC_inc_IFID[6]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[6]) );
  EDFCND1BWP \ID/PC_inc_reg[7]  ( .D(PC_inc_IFID[7]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[7]) );
  EDFCND1BWP \ID/PC_inc_reg[8]  ( .D(PC_inc_IFID[8]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[8]) );
  EDFCND1BWP \ID/PC_inc_reg[9]  ( .D(PC_inc_IFID[9]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[9]) );
  EDFCND1BWP \ID/PC_inc_reg[10]  ( .D(PC_inc_IFID[10]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[10]) );
  EDFCND1BWP \ID/PC_inc_reg[11]  ( .D(PC_inc_IFID[11]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[11]) );
  EDFCND1BWP \ID/PC_inc_reg[12]  ( .D(PC_inc_IFID[12]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[12]) );
  EDFCND1BWP \ID/PC_inc_reg[13]  ( .D(PC_inc_IFID[13]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[13]) );
  EDFCND1BWP \ID/PC_inc_reg[14]  ( .D(PC_inc_IFID[14]), .E(n320), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[14]) );
  EDFCND1BWP \ID/PC_inc_reg[15]  ( .D(PC_inc_IFID[15]), .E(n319), .CP(clk), 
        .CDN(n245), .Q(PC_inc_IDEX[15]) );
  EDFCND1BWP \ID/BCR_reg  ( .D(\ID/tmpBCR ), .E(n319), .CP(clk), .CDN(n245), 
        .Q(\ID/BCR ) );
  DFCNQD1BWP \WB/WB_reg[6]  ( .D(WB_MEMWB[6]), .CP(clk), .CDN(n306), .Q(
        write_addr[3]) );
  DFCNQD1BWP \WB/WB_reg[5]  ( .D(WB_MEMWB[5]), .CP(clk), .CDN(n298), .Q(
        write_addr[2]) );
  DFCNQD1BWP \WB/WB_reg[4]  ( .D(WB_MEMWB[4]), .CP(clk), .CDN(n244), .Q(
        write_addr[1]) );
  DFCNQD1BWP \WB/WB_reg[3]  ( .D(WB_MEMWB[3]), .CP(clk), .CDN(n246), .Q(
        write_addr[0]) );
  DFCNQD1BWP \WB/WB_reg[2]  ( .D(WB_MEMWB[2]), .CP(clk), .CDN(n246), .Q(
        RegWrite) );
  DFCNQD1BWP \WB/WB_reg[1]  ( .D(WB_MEMWB[1]), .CP(clk), .CDN(n296), .Q(Ret)
         );
  DFCNQD1BWP \WB/WB_reg[0]  ( .D(WB_MEMWB[0]), .CP(clk), .CDN(n244), .Q(
        \WB/WB[0] ) );
  DFCNQD1BWP \MEM/WB_reg[6]  ( .D(WB_EXMEM[6]), .CP(clk), .CDN(n244), .Q(
        WB_MEMWB[6]) );
  DFCNQD1BWP \MEM/WB_reg[5]  ( .D(WB_EXMEM[5]), .CP(clk), .CDN(n306), .Q(
        WB_MEMWB[5]) );
  DFCNQD1BWP \MEM/WB_reg[4]  ( .D(WB_EXMEM[4]), .CP(clk), .CDN(n306), .Q(
        WB_MEMWB[4]) );
  DFCNQD1BWP \MEM/WB_reg[3]  ( .D(WB_EXMEM[3]), .CP(clk), .CDN(n302), .Q(
        WB_MEMWB[3]) );
  DFCNQD1BWP \MEM/WB_reg[2]  ( .D(WB_EXMEM[2]), .CP(clk), .CDN(n305), .Q(
        WB_MEMWB[2]) );
  DFCNQD1BWP \MEM/WB_reg[1]  ( .D(WB_EXMEM[1]), .CP(clk), .CDN(n295), .Q(
        WB_MEMWB[1]) );
  DFCNQD1BWP \MEM/WB_reg[0]  ( .D(WB_EXMEM[0]), .CP(clk), .CDN(n297), .Q(
        WB_MEMWB[0]) );
  DFCNQD1BWP \MEM/M_reg[1]  ( .D(M_EXMEM[1]), .CP(clk), .CDN(n246), .Q(
        \MEM/M [1]) );
  DFCNQD1BWP \MEM/M_reg[0]  ( .D(M_EXMEM[0]), .CP(clk), .CDN(n246), .Q(
        \MEM/M [0]) );
  DFCNQD1BWP \DF/write_addr_reg[3]  ( .D(\DF/FWD[11] ), .CP(clk), .CDN(n246), 
        .Q(\DF/write_addr[3] ) );
  DFCNQD1BWP \DF/write_addr_reg[2]  ( .D(\DF/FWD[10] ), .CP(clk), .CDN(n244), 
        .Q(\DF/write_addr[2] ) );
  DFCNQD1BWP \DF/write_addr_reg[1]  ( .D(\DF/FWD[9] ), .CP(clk), .CDN(n244), 
        .Q(\DF/write_addr[1] ) );
  DFCNQD1BWP \DF/write_addr_reg[0]  ( .D(\DF/FWD[8] ), .CP(clk), .CDN(n244), 
        .Q(\DF/write_addr[0] ) );
  DFCNQD1BWP \EX/PC_inc_reg[14]  ( .D(PC_inc_IDEX[14]), .CP(clk), .CDN(n295), 
        .Q(\EX/PC_inc [14]) );
  DFCNQD1BWP \EX/PC_inc_reg[13]  ( .D(PC_inc_IDEX[13]), .CP(clk), .CDN(n295), 
        .Q(\EX/PC_inc [13]) );
  DFCNQD1BWP \EX/PC_inc_reg[12]  ( .D(PC_inc_IDEX[12]), .CP(clk), .CDN(n301), 
        .Q(\EX/PC_inc [12]) );
  DFCNQD1BWP \EX/PC_inc_reg[11]  ( .D(PC_inc_IDEX[11]), .CP(clk), .CDN(n246), 
        .Q(\EX/PC_inc [11]) );
  DFCNQD1BWP \EX/PC_inc_reg[10]  ( .D(PC_inc_IDEX[10]), .CP(clk), .CDN(n296), 
        .Q(\EX/PC_inc [10]) );
  DFCNQD1BWP \EX/PC_inc_reg[9]  ( .D(PC_inc_IDEX[9]), .CP(clk), .CDN(n293), 
        .Q(\EX/PC_inc [9]) );
  DFCNQD1BWP \EX/PC_inc_reg[8]  ( .D(PC_inc_IDEX[8]), .CP(clk), .CDN(n294), 
        .Q(\EX/PC_inc [8]) );
  DFCNQD1BWP \EX/PC_inc_reg[7]  ( .D(PC_inc_IDEX[7]), .CP(clk), .CDN(n246), 
        .Q(\EX/PC_inc [7]) );
  DFCNQD1BWP \EX/PC_inc_reg[6]  ( .D(PC_inc_IDEX[6]), .CP(clk), .CDN(n303), 
        .Q(\EX/PC_inc [6]) );
  DFCNQD1BWP \EX/PC_inc_reg[5]  ( .D(PC_inc_IDEX[5]), .CP(clk), .CDN(n244), 
        .Q(\EX/PC_inc [5]) );
  DFCNQD1BWP \EX/PC_inc_reg[4]  ( .D(PC_inc_IDEX[4]), .CP(clk), .CDN(n244), 
        .Q(\EX/PC_inc [4]) );
  DFCNQD1BWP \EX/PC_inc_reg[3]  ( .D(PC_inc_IDEX[3]), .CP(clk), .CDN(n246), 
        .Q(\EX/PC_inc [3]) );
  DFCNQD1BWP \EX/PC_inc_reg[2]  ( .D(PC_inc_IDEX[2]), .CP(clk), .CDN(n296), 
        .Q(\EX/PC_inc [2]) );
  DFCNQD1BWP \EX/PC_inc_reg[1]  ( .D(PC_inc_IDEX[1]), .CP(clk), .CDN(n296), 
        .Q(\EX/PC_inc [1]) );
  DFCNQD1BWP \EX/PC_inc_reg[15]  ( .D(PC_inc_IDEX[15]), .CP(clk), .CDN(n304), 
        .Q(\EX/PC_inc [15]) );
  DFCNQD1BWP \EX/PC_inc_reg[0]  ( .D(PC_inc_IDEX[0]), .CP(clk), .CDN(n300), 
        .Q(\EX/PC_inc [0]) );
  DFCNQD1BWP \EX/EX_reg[8]  ( .D(EX_IDEX[8]), .CP(clk), .CDN(n305), .Q(
        \EX/EX[8] ) );
  DFCNQD1BWP \DF/RegWrite_reg[0]  ( .D(\DF/FWD[12] ), .CP(clk), .CDN(n244), 
        .Q(\DF/RegWrite[0] ) );
  DFCNQD1BWP \DF/MemToReg_reg[0]  ( .D(\DF/FWD[13] ), .CP(clk), .CDN(n246), 
        .Q(\DF/MemToReg[0] ) );
  DFCNQD1BWP \EX/bcond_reg[2]  ( .D(PCcall[10]), .CP(clk), .CDN(n246), .Q(
        \EX/bcond [2]) );
  DFCNQD1BWP \EX/bcond_reg[1]  ( .D(PCcall[9]), .CP(clk), .CDN(n246), .Q(
        \EX/bcond [1]) );
  DFCNQD1BWP \EX/bcond_reg[0]  ( .D(PCcall[8]), .CP(clk), .CDN(n244), .Q(
        \EX/bcond [0]) );
  DFCNQD1BWP \WB/ALU_reg[15]  ( .D(ALU_MEMWB[15]), .CP(clk), .CDN(n244), .Q(
        \WB/ALU [15]) );
  DFCNQD1BWP \WB/ALU_reg[14]  ( .D(ALU_MEMWB[14]), .CP(clk), .CDN(n244), .Q(
        \WB/ALU [14]) );
  DFCNQD1BWP \WB/ALU_reg[13]  ( .D(ALU_MEMWB[13]), .CP(clk), .CDN(n305), .Q(
        \WB/ALU [13]) );
  DFCNQD1BWP \WB/ALU_reg[12]  ( .D(ALU_MEMWB[12]), .CP(clk), .CDN(n305), .Q(
        \WB/ALU [12]) );
  DFCNQD1BWP \WB/ALU_reg[11]  ( .D(ALU_MEMWB[11]), .CP(clk), .CDN(n304), .Q(
        \WB/ALU [11]) );
  DFCNQD1BWP \WB/ALU_reg[10]  ( .D(ALU_MEMWB[10]), .CP(clk), .CDN(n299), .Q(
        \WB/ALU [10]) );
  DFCNQD1BWP \WB/ALU_reg[9]  ( .D(ALU_MEMWB[9]), .CP(clk), .CDN(n294), .Q(
        \WB/ALU [9]) );
  DFCNQD1BWP \WB/ALU_reg[8]  ( .D(ALU_MEMWB[8]), .CP(clk), .CDN(n303), .Q(
        \WB/ALU [8]) );
  DFCNQD1BWP \WB/ALU_reg[7]  ( .D(ALU_MEMWB[7]), .CP(clk), .CDN(n246), .Q(
        \WB/ALU [7]) );
  DFCNQD1BWP \WB/ALU_reg[6]  ( .D(ALU_MEMWB[6]), .CP(clk), .CDN(n246), .Q(
        \WB/ALU [6]) );
  DFCNQD1BWP \WB/ALU_reg[5]  ( .D(ALU_MEMWB[5]), .CP(clk), .CDN(n246), .Q(
        \WB/ALU [5]) );
  DFCNQD1BWP \WB/ALU_reg[4]  ( .D(ALU_MEMWB[4]), .CP(clk), .CDN(n244), .Q(
        \WB/ALU [4]) );
  DFCNQD1BWP \WB/ALU_reg[3]  ( .D(ALU_MEMWB[3]), .CP(clk), .CDN(n244), .Q(
        \WB/ALU [3]) );
  DFCNQD1BWP \WB/ALU_reg[2]  ( .D(ALU_MEMWB[2]), .CP(clk), .CDN(n244), .Q(
        \WB/ALU [2]) );
  DFCNQD1BWP \WB/ALU_reg[1]  ( .D(ALU_MEMWB[1]), .CP(clk), .CDN(n294), .Q(
        \WB/ALU [1]) );
  DFCNQD1BWP \WB/ALU_reg[0]  ( .D(ALU_MEMWB[0]), .CP(clk), .CDN(n294), .Q(
        \WB/ALU [0]) );
  DFCNQD1BWP \DF/write_addr_reg[6]  ( .D(\DF/write_addr[2] ), .CP(clk), .CDN(
        n297), .Q(\DF/write_addr[6] ) );
  DFCNQD1BWP \EX/offset_reg[0]  ( .D(PCcall[0]), .CP(clk), .CDN(n246), .Q(
        \EX/offset [0]) );
  DFCNQD1BWP \EX/imm_reg[0]  ( .D(PCcall[0]), .CP(clk), .CDN(n287), .Q(
        \EX/imm[0] ) );
  DFCNQD1BWP \EX/offset_reg[4]  ( .D(PCcall[4]), .CP(clk), .CDN(n301), .Q(
        \EX/offset [4]) );
  DFCNQD1BWP \EX/offset_reg[6]  ( .D(PCcall[6]), .CP(clk), .CDN(n244), .Q(
        \EX/offset [6]) );
  DFCNQD1BWP \EX/offset_reg[5]  ( .D(PCcall[5]), .CP(clk), .CDN(n246), .Q(
        \EX/offset [5]) );
  DFCNQD1BWP \DF/write_addr_reg[5]  ( .D(\DF/write_addr[1] ), .CP(clk), .CDN(
        n246), .Q(\DF/write_addr[5] ) );
  DFCNQD1BWP \DF/write_addr_reg[4]  ( .D(\DF/write_addr[0] ), .CP(clk), .CDN(
        n302), .Q(\DF/write_addr[4] ) );
  DFCNQD1BWP \DF/write_addr_reg[7]  ( .D(\DF/write_addr[3] ), .CP(clk), .CDN(
        n244), .Q(\DF/write_addr[7] ) );
  DFCNQD1BWP \EX/offset_reg[2]  ( .D(PCcall[2]), .CP(clk), .CDN(n244), .Q(
        \EX/offset [2]) );
  DFCNQD1BWP \EX/offset_reg[1]  ( .D(PCcall[1]), .CP(clk), .CDN(n287), .Q(
        \EX/offset [1]) );
  DFCNQD1BWP \EX/imm_reg[2]  ( .D(PCcall[2]), .CP(clk), .CDN(n287), .Q(
        \EX/imm[2] ) );
  DFCNQD1BWP \EX/imm_reg[1]  ( .D(PCcall[1]), .CP(clk), .CDN(n298), .Q(
        \EX/imm[1] ) );
  DFCNQD1BWP \EX/offset_reg[3]  ( .D(n242), .CP(clk), .CDN(n301), .Q(
        \EX/offset [3]) );
  DFCNQD1BWP \EX/imm_reg[15]  ( .D(n242), .CP(clk), .CDN(n284), .Q(
        \EX/imm[15] ) );
  DFCNQD1BWP \EX/imm_reg[14]  ( .D(n242), .CP(clk), .CDN(n302), .Q(
        \EX/imm[14] ) );
  DFCNQD1BWP \EX/imm_reg[13]  ( .D(n242), .CP(clk), .CDN(n246), .Q(
        \EX/imm[13] ) );
  DFCNQD1BWP \EX/imm_reg[12]  ( .D(n242), .CP(clk), .CDN(n246), .Q(
        \EX/imm[12] ) );
  DFCNQD1BWP \EX/imm_reg[11]  ( .D(n242), .CP(clk), .CDN(n246), .Q(
        \EX/imm[11] ) );
  DFCNQD1BWP \EX/imm_reg[10]  ( .D(n242), .CP(clk), .CDN(n244), .Q(
        \EX/imm[10] ) );
  DFCNQD1BWP \EX/imm_reg[9]  ( .D(n242), .CP(clk), .CDN(n244), .Q(\EX/imm[9] )
         );
  DFCNQD1BWP \EX/imm_reg[8]  ( .D(n242), .CP(clk), .CDN(n306), .Q(\EX/imm[8] )
         );
  DFCNQD1BWP \DF/RegWrite_reg[1]  ( .D(\DF/RegWrite[0] ), .CP(clk), .CDN(n284), 
        .Q(\DF/RegWrite[1] ) );
  DFCNQD1BWP \EX/PCbranch_reg[0]  ( .D(PCbranch_IDEX[0]), .CP(clk), .CDN(n284), 
        .Q(PCbranch[0]) );
  DFCNQD1BWP \EX/offset_reg[15]  ( .D(n282), .CP(clk), .CDN(n299), .Q(
        \EX/offset [15]) );
  DFCNQD1BWP \EX/offset_reg[13]  ( .D(n282), .CP(clk), .CDN(n303), .Q(
        \EX/offset [13]) );
  DFCNQD1BWP \EX/offset_reg[11]  ( .D(n282), .CP(clk), .CDN(n292), .Q(
        \EX/offset [11]) );
  DFCNQD1BWP \EX/offset_reg[9]  ( .D(n282), .CP(clk), .CDN(n244), .Q(
        \EX/offset [9]) );
  DFCNQD1BWP \EX/offset_reg[7]  ( .D(n282), .CP(clk), .CDN(n246), .Q(
        \EX/offset [7]) );
  DFCNQD1BWP \EX/imm_reg[7]  ( .D(n280), .CP(clk), .CDN(n246), .Q(\EX/imm[7] )
         );
  DFCNQD1BWP \EX/imm_reg[6]  ( .D(n280), .CP(clk), .CDN(n295), .Q(\EX/imm[6] )
         );
  DFCNQD1BWP \EX/imm_reg[5]  ( .D(n280), .CP(clk), .CDN(n244), .Q(\EX/imm[5] )
         );
  DFCNQD1BWP \EX/imm_reg[4]  ( .D(n280), .CP(clk), .CDN(n244), .Q(\EX/imm[4] )
         );
  DFCNQD1BWP \EX/imm_reg[3]  ( .D(n280), .CP(clk), .CDN(n246), .Q(\EX/imm[3] )
         );
  DFCNQD1BWP \EX/offset_reg[14]  ( .D(n283), .CP(clk), .CDN(n292), .Q(
        \EX/offset [14]) );
  DFCNQD1BWP \EX/offset_reg[12]  ( .D(n283), .CP(clk), .CDN(n288), .Q(
        \EX/offset [12]) );
  DFCNQD1BWP \EX/offset_reg[10]  ( .D(n283), .CP(clk), .CDN(n244), .Q(
        \EX/offset [10]) );
  DFCNQD1BWP \EX/offset_reg[8]  ( .D(n283), .CP(clk), .CDN(n246), .Q(
        \EX/offset [8]) );
  DFCNQD1BWP \EX/PCbranch_reg[1]  ( .D(PCbranch_IDEX[1]), .CP(clk), .CDN(n300), 
        .Q(PCbranch[1]) );
  DFCNQD1BWP \EX/PCbranch_reg[2]  ( .D(PCbranch_IDEX[2]), .CP(clk), .CDN(n300), 
        .Q(PCbranch[2]) );
  DFCNQD1BWP \EX/PCbranch_reg[3]  ( .D(PCbranch_IDEX[3]), .CP(clk), .CDN(n244), 
        .Q(PCbranch[3]) );
  DFCNQD1BWP \EX/PCbranch_reg[4]  ( .D(PCbranch_IDEX[4]), .CP(clk), .CDN(n246), 
        .Q(PCbranch[4]) );
  DFCNQD1BWP \EX/PCbranch_reg[5]  ( .D(PCbranch_IDEX[5]), .CP(clk), .CDN(n246), 
        .Q(PCbranch[5]) );
  DFCNQD1BWP \EX/PCbranch_reg[6]  ( .D(PCbranch_IDEX[6]), .CP(clk), .CDN(n304), 
        .Q(PCbranch[6]) );
  DFCNQD1BWP \EX/PCbranch_reg[7]  ( .D(PCbranch_IDEX[7]), .CP(clk), .CDN(n244), 
        .Q(PCbranch[7]) );
  DFCNQD1BWP \EX/PCbranch_reg[8]  ( .D(PCbranch_IDEX[8]), .CP(clk), .CDN(n244), 
        .Q(PCbranch[8]) );
  DFCNQD1BWP \MEM/wdata_reg[15]  ( .D(data_EXMEM[15]), .CP(clk), .CDN(n300), 
        .Q(\MEM/wdata [15]) );
  DFCNQD1BWP \MEM/wdata_reg[14]  ( .D(data_EXMEM[14]), .CP(clk), .CDN(n292), 
        .Q(\MEM/wdata [14]) );
  DFCNQD1BWP \MEM/wdata_reg[13]  ( .D(data_EXMEM[13]), .CP(clk), .CDN(n296), 
        .Q(\MEM/wdata [13]) );
  DFCNQD1BWP \MEM/wdata_reg[12]  ( .D(data_EXMEM[12]), .CP(clk), .CDN(n246), 
        .Q(\MEM/wdata [12]) );
  DFCNQD1BWP \MEM/wdata_reg[11]  ( .D(data_EXMEM[11]), .CP(clk), .CDN(n299), 
        .Q(\MEM/wdata [11]) );
  DFCNQD1BWP \MEM/wdata_reg[10]  ( .D(data_EXMEM[10]), .CP(clk), .CDN(n292), 
        .Q(\MEM/wdata [10]) );
  DFCNQD1BWP \MEM/wdata_reg[9]  ( .D(data_EXMEM[9]), .CP(clk), .CDN(n297), .Q(
        \MEM/wdata [9]) );
  DFCNQD1BWP \MEM/wdata_reg[8]  ( .D(data_EXMEM[8]), .CP(clk), .CDN(n246), .Q(
        \MEM/wdata [8]) );
  DFCNQD1BWP \MEM/wdata_reg[7]  ( .D(data_EXMEM[7]), .CP(clk), .CDN(n246), .Q(
        \MEM/wdata [7]) );
  DFCNQD1BWP \MEM/wdata_reg[6]  ( .D(data_EXMEM[6]), .CP(clk), .CDN(n244), .Q(
        \MEM/wdata [6]) );
  DFCNQD1BWP \MEM/wdata_reg[5]  ( .D(data_EXMEM[5]), .CP(clk), .CDN(n244), .Q(
        \MEM/wdata [5]) );
  DFCNQD1BWP \MEM/wdata_reg[4]  ( .D(data_EXMEM[4]), .CP(clk), .CDN(n244), .Q(
        \MEM/wdata [4]) );
  DFCNQD1BWP \MEM/wdata_reg[3]  ( .D(data_EXMEM[3]), .CP(clk), .CDN(n299), .Q(
        \MEM/wdata [3]) );
  DFCNQD1BWP \MEM/wdata_reg[2]  ( .D(data_EXMEM[2]), .CP(clk), .CDN(n300), .Q(
        \MEM/wdata [2]) );
  DFCNQD1BWP \MEM/wdata_reg[1]  ( .D(data_EXMEM[1]), .CP(clk), .CDN(n305), .Q(
        \MEM/wdata [1]) );
  DFCNQD1BWP \MEM/wdata_reg[0]  ( .D(data_EXMEM[0]), .CP(clk), .CDN(n298), .Q(
        \MEM/wdata [0]) );
  DFCNQD1BWP \EX/PCbranch_reg[9]  ( .D(PCbranch_IDEX[9]), .CP(clk), .CDN(n302), 
        .Q(PCbranch[9]) );
  DFCNQD1BWP \EX/PCbranch_reg[10]  ( .D(PCbranch_IDEX[10]), .CP(clk), .CDN(
        n288), .Q(PCbranch[10]) );
  DFCNQD1BWP \EX/PCbranch_reg[11]  ( .D(PCbranch_IDEX[11]), .CP(clk), .CDN(
        n246), .Q(PCbranch[11]) );
  DFCNQD1BWP \EX/EX_reg[9]  ( .D(EX_IDEX[9]), .CP(clk), .CDN(n246), .Q(
        \EX/EX[9] ) );
  DFCNQD1BWP \EX/PCbranch_reg[12]  ( .D(PCbranch_IDEX[12]), .CP(clk), .CDN(
        n294), .Q(PCbranch[12]) );
  DFCNQD1BWP \EX/WB_reg[0]  ( .D(WB_IDEX[0]), .CP(clk), .CDN(n244), .Q(
        WB_EXMEM[0]) );
  DFCNQD1BWP \DF/FWD_reg[13]  ( .D(WB_IDEX[0]), .CP(clk), .CDN(n244), .Q(
        \DF/FWD[13] ) );
  DFCNQD1BWP \EX/M_reg[1]  ( .D(M_IDEX[1]), .CP(clk), .CDN(n246), .Q(
        M_EXMEM[1]) );
  DFCNQD1BWP \EX/EX_reg[7]  ( .D(EX_IDEX[7]), .CP(clk), .CDN(n302), .Q(
        \EX/EX[7] ) );
  DFCNQD1BWP \EX/EX_reg[6]  ( .D(EX_IDEX[6]), .CP(clk), .CDN(n299), .Q(
        \EX/EX[6] ) );
  DFCNQD1BWP \HD/Stall_reg[2]  ( .D(cur_Ret), .CP(clk), .CDN(n284), .Q(
        \HD/Stall [2]) );
  DFCNQD1BWP \EX/WB_reg[1]  ( .D(cur_Ret), .CP(clk), .CDN(n306), .Q(
        WB_EXMEM[1]) );
  DFCNQD1BWP \EX/EX_reg[3]  ( .D(EX_IDEX[3]), .CP(clk), .CDN(n301), .Q(
        \EX/ALUOp [3]) );
  DFCNQD1BWP \EX/EX_reg[2]  ( .D(EX_IDEX[2]), .CP(clk), .CDN(n244), .Q(
        \EX/ALUOp [2]) );
  DFCNQD1BWP \EX/M_reg[0]  ( .D(M_IDEX[0]), .CP(clk), .CDN(n246), .Q(
        M_EXMEM[0]) );
  DFCNQD1BWP \EX/EX_reg[1]  ( .D(EX_IDEX[1]), .CP(clk), .CDN(n246), .Q(
        \EX/ALUOp [1]) );
  DFCNQD1BWP \EX/EX_reg[0]  ( .D(EX_IDEX[0]), .CP(clk), .CDN(n246), .Q(
        \EX/ALUOp [0]) );
  DFCNQD1BWP \EX/PCbranch_reg[13]  ( .D(PCbranch_IDEX[13]), .CP(clk), .CDN(
        n244), .Q(PCbranch[13]) );
  DFCNQD1BWP \HD/Stall_reg[1]  ( .D(\HD/N4 ), .CP(clk), .CDN(n244), .Q(
        \HD/Stall [1]) );
  DFCNQD1BWP \HD/Stall_reg[0]  ( .D(\HD/N3 ), .CP(clk), .CDN(n244), .Q(
        \HD/Stall [0]) );
  DFCNQD1BWP \EX/EX_reg[5]  ( .D(EX_IDEX[5]), .CP(clk), .CDN(n301), .Q(
        \EX/ALUSrc[1] ) );
  DFCNQD1BWP \EX/EX_reg[4]  ( .D(EX_IDEX[4]), .CP(clk), .CDN(n302), .Q(
        \EX/ALUSrc[0] ) );
  DFCNQD1BWP \EX/PCbranch_reg[14]  ( .D(PCbranch_IDEX[14]), .CP(clk), .CDN(
        n300), .Q(PCbranch[14]) );
  DFCNQD1BWP \EX/WB_reg[2]  ( .D(WB_IDEX[2]), .CP(clk), .CDN(n246), .Q(
        WB_EXMEM[2]) );
  DFCNQD1BWP \DF/FWD_reg[12]  ( .D(WB_IDEX[2]), .CP(clk), .CDN(n303), .Q(
        \DF/FWD[12] ) );
  DFCNQD1BWP \EX/WB_reg[6]  ( .D(WB_IDEX[6]), .CP(clk), .CDN(n287), .Q(
        WB_EXMEM[6]) );
  DFCNQD1BWP \EX/WB_reg[5]  ( .D(WB_IDEX[5]), .CP(clk), .CDN(n244), .Q(
        WB_EXMEM[5]) );
  DFCNQD1BWP \EX/WB_reg[4]  ( .D(WB_IDEX[4]), .CP(clk), .CDN(n246), .Q(
        WB_EXMEM[4]) );
  DFCNQD1BWP \EX/WB_reg[3]  ( .D(WB_IDEX[3]), .CP(clk), .CDN(n246), .Q(
        WB_EXMEM[3]) );
  DFCNQD1BWP \DF/FWD_reg[11]  ( .D(WB_IDEX[6]), .CP(clk), .CDN(n295), .Q(
        \DF/FWD[11] ) );
  DFCNQD1BWP \DF/FWD_reg[10]  ( .D(WB_IDEX[5]), .CP(clk), .CDN(n244), .Q(
        \DF/FWD[10] ) );
  DFCNQD1BWP \DF/FWD_reg[9]  ( .D(WB_IDEX[4]), .CP(clk), .CDN(n244), .Q(
        \DF/FWD[9] ) );
  DFCNQD1BWP \DF/FWD_reg[8]  ( .D(WB_IDEX[3]), .CP(clk), .CDN(n303), .Q(
        \DF/FWD[8] ) );
  DFCNQD1BWP \EX/PCbranch_reg[15]  ( .D(PCbranch_IDEX[15]), .CP(clk), .CDN(
        n301), .Q(PCbranch[15]) );
  DFCNQD1BWP \DF/FWD_reg[4]  ( .D(FWD[4]), .CP(clk), .CDN(n299), .Q(
        \DF/FWD[4] ) );
  DFCNQD1BWP \DF/FWD_reg[7]  ( .D(FWD[7]), .CP(clk), .CDN(n246), .Q(
        \DF/FWD[7] ) );
  DFCNQD1BWP \DF/FWD_reg[6]  ( .D(FWD[6]), .CP(clk), .CDN(n304), .Q(
        \DF/FWD[6] ) );
  DFCNQD1BWP \DF/FWD_reg[5]  ( .D(FWD[5]), .CP(clk), .CDN(n245), .Q(
        \DF/FWD[5] ) );
  DFCNQD1BWP \DF/FWD_reg[0]  ( .D(FWD[0]), .CP(clk), .CDN(n296), .Q(
        \DF/FWD[0] ) );
  DFCNQD1BWP \DF/FWD_reg[3]  ( .D(FWD[3]), .CP(clk), .CDN(n246), .Q(
        \DF/FWD[3] ) );
  DFCNQD1BWP \DF/FWD_reg[2]  ( .D(FWD[2]), .CP(clk), .CDN(n246), .Q(
        \DF/FWD[2] ) );
  DFCNQD1BWP \DF/FWD_reg[1]  ( .D(FWD[1]), .CP(clk), .CDN(n244), .Q(
        \DF/FWD[1] ) );
  DFCNQD1BWP \MEM/ALU_reg[2]  ( .D(ALU_EXMEM[2]), .CP(clk), .CDN(n244), .Q(
        ALU_MEMWB[2]) );
  DFCNQD1BWP \MEM/ALU_reg[1]  ( .D(ALU_EXMEM[1]), .CP(clk), .CDN(n244), .Q(
        ALU_MEMWB[1]) );
  DFCNQD1BWP \MEM/ALU_reg[0]  ( .D(ALU_EXMEM[0]), .CP(clk), .CDN(n304), .Q(
        ALU_MEMWB[0]) );
  DFCNQD1BWP \MEM/addr_reg[2]  ( .D(addr_EXMEM[2]), .CP(clk), .CDN(n303), .Q(
        \MEM/addr [2]) );
  DFCNQD1BWP \MEM/ALU_reg[3]  ( .D(ALU_EXMEM[3]), .CP(clk), .CDN(n301), .Q(
        ALU_MEMWB[3]) );
  DFCNQD1BWP \MEM/addr_reg[1]  ( .D(addr_EXMEM[1]), .CP(clk), .CDN(n246), .Q(
        \MEM/addr [1]) );
  DFCNQD1BWP \MEM/ALU_reg[4]  ( .D(ALU_EXMEM[4]), .CP(clk), .CDN(n297), .Q(
        ALU_MEMWB[4]) );
  DFCNQD1BWP \MEM/addr_reg[0]  ( .D(addr_EXMEM[0]), .CP(clk), .CDN(n245), .Q(
        \MEM/addr [0]) );
  DFCNQD1BWP \MEM/addr_reg[3]  ( .D(addr_EXMEM[3]), .CP(clk), .CDN(n305), .Q(
        \MEM/addr [3]) );
  DFCNQD1BWP \MEM/ALU_reg[5]  ( .D(ALU_EXMEM[5]), .CP(clk), .CDN(n246), .Q(
        ALU_MEMWB[5]) );
  DFCNQD1BWP \MEM/addr_reg[4]  ( .D(addr_EXMEM[4]), .CP(clk), .CDN(n246), .Q(
        \MEM/addr [4]) );
  DFCNQD1BWP \MEM/ALU_reg[6]  ( .D(ALU_EXMEM[6]), .CP(clk), .CDN(n293), .Q(
        ALU_MEMWB[6]) );
  DFCNQD1BWP \MEM/addr_reg[5]  ( .D(addr_EXMEM[5]), .CP(clk), .CDN(n244), .Q(
        \MEM/addr [5]) );
  DFCNQD1BWP \MEM/ALU_reg[7]  ( .D(ALU_EXMEM[7]), .CP(clk), .CDN(n303), .Q(
        ALU_MEMWB[7]) );
  DFCNQD1BWP \MEM/addr_reg[6]  ( .D(addr_EXMEM[6]), .CP(clk), .CDN(n244), .Q(
        \MEM/addr [6]) );
  DFCNQD1BWP \MEM/ALU_reg[8]  ( .D(ALU_EXMEM[8]), .CP(clk), .CDN(n304), .Q(
        ALU_MEMWB[8]) );
  DFCNQD1BWP \MEM/addr_reg[7]  ( .D(addr_EXMEM[7]), .CP(clk), .CDN(n245), .Q(
        \MEM/addr [7]) );
  DFCNQD1BWP \MEM/ALU_reg[9]  ( .D(ALU_EXMEM[9]), .CP(clk), .CDN(n294), .Q(
        ALU_MEMWB[9]) );
  DFCNQD1BWP \MEM/addr_reg[8]  ( .D(addr_EXMEM[8]), .CP(clk), .CDN(n246), .Q(
        \MEM/addr [8]) );
  DFCNQD1BWP \MEM/ALU_reg[10]  ( .D(ALU_EXMEM[10]), .CP(clk), .CDN(n244), .Q(
        ALU_MEMWB[10]) );
  DFCNQD1BWP \MEM/addr_reg[9]  ( .D(addr_EXMEM[9]), .CP(clk), .CDN(n246), .Q(
        \MEM/addr [9]) );
  DFCNQD1BWP \MEM/ALU_reg[11]  ( .D(ALU_EXMEM[11]), .CP(clk), .CDN(n298), .Q(
        ALU_MEMWB[11]) );
  DFCNQD1BWP \MEM/addr_reg[10]  ( .D(addr_EXMEM[10]), .CP(clk), .CDN(n245), 
        .Q(\MEM/addr [10]) );
  DFCNQD1BWP \IF/PC_reg[11]  ( .D(\IF/n43 ), .CP(clk), .CDN(n244), .Q(
        \IF/PC[11] ) );
  DFCNQD1BWP \IF/PC_reg[10]  ( .D(\IF/n44 ), .CP(clk), .CDN(n244), .Q(
        \IF/PC[10] ) );
  DFCNQD1BWP \IF/PC_reg[9]  ( .D(\IF/n45 ), .CP(clk), .CDN(n245), .Q(
        \IF/PC[9] ) );
  DFCNQD1BWP \IF/PC_reg[8]  ( .D(\IF/n46 ), .CP(clk), .CDN(n297), .Q(
        \IF/PC[8] ) );
  DFCNQD1BWP \IF/PC_reg[7]  ( .D(\IF/n47 ), .CP(clk), .CDN(n293), .Q(
        \IF/PC[7] ) );
  DFCNQD1BWP \IF/PC_reg[6]  ( .D(\IF/n48 ), .CP(clk), .CDN(n245), .Q(
        \IF/PC[6] ) );
  DFCNQD1BWP \IF/PC_reg[5]  ( .D(\IF/n49 ), .CP(clk), .CDN(n246), .Q(
        \IF/PC[5] ) );
  DFCNQD1BWP \IF/PC_reg[4]  ( .D(\IF/n50 ), .CP(clk), .CDN(n306), .Q(
        \IF/PC[4] ) );
  DFCNQD1BWP \IF/PC_reg[3]  ( .D(\IF/n51 ), .CP(clk), .CDN(n245), .Q(
        \IF/PC[3] ) );
  DFCNQD1BWP \IF/PC_reg[2]  ( .D(\IF/n52 ), .CP(clk), .CDN(n244), .Q(
        \IF/PC[2] ) );
  DFCNQD1BWP \IF/PC_reg[1]  ( .D(\IF/n53 ), .CP(clk), .CDN(n246), .Q(
        \IF/PC[1] ) );
  DFCNQD1BWP \IF/PC_reg[0]  ( .D(\IF/n54 ), .CP(clk), .CDN(n245), .Q(
        \IF/PC[0] ) );
  DFCNQD1BWP \MEM/ALU_reg[12]  ( .D(ALU_EXMEM[12]), .CP(clk), .CDN(n300), .Q(
        ALU_MEMWB[12]) );
  DFCNQD1BWP \MEM/addr_reg[11]  ( .D(addr_EXMEM[11]), .CP(clk), .CDN(n244), 
        .Q(\MEM/addr [11]) );
  DFCNQD1BWP \IF/PC_reg[15]  ( .D(\IF/n39 ), .CP(clk), .CDN(n298), .Q(
        \IF/PC[15] ) );
  DFCNQD1BWP \IF/PC_reg[14]  ( .D(\IF/n40 ), .CP(clk), .CDN(n246), .Q(
        \IF/PC[14] ) );
  DFCNQD1BWP \IF/PC_reg[13]  ( .D(\IF/n41 ), .CP(clk), .CDN(n244), .Q(
        \IF/PC[13] ) );
  DFCNQD1BWP \IF/PC_reg[12]  ( .D(\IF/n42 ), .CP(clk), .CDN(n245), .Q(
        \IF/PC[12] ) );
  DFCNQD1BWP \MEM/ALU_reg[13]  ( .D(ALU_EXMEM[13]), .CP(clk), .CDN(n298), .Q(
        ALU_MEMWB[13]) );
  DFCNQD1BWP \MEM/addr_reg[12]  ( .D(addr_EXMEM[12]), .CP(clk), .CDN(n297), 
        .Q(\MEM/addr [12]) );
  DFCNQD1BWP \MEM/ALU_reg[14]  ( .D(ALU_EXMEM[14]), .CP(clk), .CDN(n245), .Q(
        ALU_MEMWB[14]) );
  DFCNQD1BWP \MEM/addr_reg[13]  ( .D(addr_EXMEM[13]), .CP(clk), .CDN(n246), 
        .Q(\MEM/addr [13]) );
  DFCNQD1BWP \MEM/addr_reg[14]  ( .D(addr_EXMEM[14]), .CP(clk), .CDN(n295), 
        .Q(\MEM/addr [14]) );
  DFCNQD1BWP \MEM/ALU_reg[15]  ( .D(ALU_EXMEM[15]), .CP(clk), .CDN(n245), .Q(
        ALU_MEMWB[15]) );
  DFCNQD1BWP \MEM/addr_reg[15]  ( .D(addr_EXMEM[15]), .CP(clk), .CDN(n244), 
        .Q(\MEM/addr [15]) );
  DFCNQD1BWP \MEM/flags_reg[1]  ( .D(flags_EXMEM[1]), .CP(clk), .CDN(n246), 
        .Q(flags_MEMEX[1]) );
  DFCNQD1BWP \MEM/flags_reg[0]  ( .D(flags_EXMEM[0]), .CP(clk), .CDN(n245), 
        .Q(flags_MEMEX[0]) );
  DFCNQD1BWP \MEM/flags_reg[2]  ( .D(flags_EXMEM[2]), .CP(clk), .CDN(n299), 
        .Q(flags_MEMEX[2]) );
  OAI31D1BWP U336 ( .A1(n228), .A2(n229), .A3(n230), .B(n231), .ZN(n124) );
  INVD1BWP U337 ( .I(n277), .ZN(n278) );
  AOI21D2BWP U338 ( .A1(\DF/FWD[13] ), .A2(\DF/FWD[12] ), .B(\HD/Stall [0]), 
        .ZN(n240) );
  CKND16BWP U339 ( .I(n243), .ZN(n245) );
  CKND2BWP U340 ( .I(n328), .ZN(n243) );
  CKND16BWP U341 ( .I(n243), .ZN(n244) );
  CKND16BWP U342 ( .I(n243), .ZN(n246) );
  CKBD3BWP U343 ( .I(n168), .Z(n262) );
  CKBD3BWP U344 ( .I(n169), .Z(n263) );
  CKBD1BWP U345 ( .I(n295), .Z(n291) );
  CKBD1BWP U346 ( .I(n295), .Z(n290) );
  CKBD1BWP U347 ( .I(n296), .Z(n289) );
  CKBD1BWP U348 ( .I(n296), .Z(n288) );
  CKBD1BWP U349 ( .I(n298), .Z(n284) );
  CKBD1BWP U350 ( .I(n298), .Z(n285) );
  CKBD1BWP U351 ( .I(n297), .Z(n286) );
  CKBD1BWP U352 ( .I(n297), .Z(n287) );
  CKBD1BWP U353 ( .I(n294), .Z(n292) );
  CKBD1BWP U354 ( .I(n294), .Z(n293) );
  INVD1BWP U355 ( .I(\ID/ReadRd ), .ZN(n326) );
  IND2D1BWP U356 ( .A1(\ID/LoadStore ), .B1(n327), .ZN(n165) );
  OAI21D1BWP U357 ( .A1(\ID/CallRet ), .A2(\ID/LoadStore ), .B(n327), .ZN(n166) );
  INVD1BWP U358 ( .I(\ID/CallRet ), .ZN(n325) );
  CKBD1BWP U359 ( .I(n90), .Z(n272) );
  CKBD1BWP U360 ( .I(n90), .Z(n271) );
  CKBD1BWP U361 ( .I(n302), .Z(n295) );
  CKBD1BWP U362 ( .I(n301), .Z(n296) );
  CKBD1BWP U363 ( .I(n299), .Z(n298) );
  CKBD1BWP U364 ( .I(n300), .Z(n297) );
  CKBD1BWP U365 ( .I(n303), .Z(n294) );
  CKND4BWP U366 ( .I(\WB/WB[0] ), .ZN(n405) );
  CKBD1BWP U367 ( .I(n330), .Z(n252) );
  CKBD1BWP U368 ( .I(n330), .Z(n251) );
  CKBD1BWP U369 ( .I(n190), .Z(n255) );
  CKBD1BWP U370 ( .I(n190), .Z(n254) );
  INVD1BWP U371 ( .I(n247), .ZN(n257) );
  INVD1BWP U372 ( .I(n247), .ZN(n256) );
  INVD1BWP U373 ( .I(\ID/LoadByte ), .ZN(n327) );
  CKBD3BWP U374 ( .I(Call), .Z(n250) );
  IND2D1BWP U375 ( .A1(cur_Ret), .B1(n164), .ZN(\ID/tmpBCR ) );
  ND2D1BWP U376 ( .A1(n125), .A2(n277), .ZN(n90) );
  CKBD1BWP U377 ( .I(n89), .Z(n270) );
  CKBD1BWP U378 ( .I(n89), .Z(n269) );
  INVD1BWP U379 ( .I(n248), .ZN(n274) );
  INVD1BWP U380 ( .I(n248), .ZN(n273) );
  CKBD1BWP U381 ( .I(n308), .Z(n314) );
  CKBD1BWP U382 ( .I(n307), .Z(n311) );
  CKBD1BWP U383 ( .I(n307), .Z(n312) );
  CKBD1BWP U384 ( .I(n308), .Z(n313) );
  CKBD1BWP U385 ( .I(n309), .Z(n315) );
  CKBD1BWP U386 ( .I(n309), .Z(n316) );
  CKBD1BWP U387 ( .I(n310), .Z(n318) );
  CKBD1BWP U388 ( .I(n310), .Z(n317) );
  CKBD1BWP U389 ( .I(n305), .Z(n301) );
  CKBD1BWP U390 ( .I(n306), .Z(n299) );
  CKBD1BWP U391 ( .I(n306), .Z(n300) );
  CKBD1BWP U392 ( .I(n304), .Z(n303) );
  CKBD1BWP U393 ( .I(n305), .Z(n302) );
  OAI222D1BWP U394 ( .A1(n358), .A2(n262), .B1(n384), .B2(n263), .C1(n103), 
        .C2(n252), .ZN(\EX/r0data_fwd [4]) );
  OAI222D1BWP U395 ( .A1(n360), .A2(n262), .B1(n382), .B2(n263), .C1(n99), 
        .C2(n252), .ZN(\EX/r0data_fwd [6]) );
  OAI222D1BWP U396 ( .A1(n357), .A2(n262), .B1(n385), .B2(n263), .C1(n105), 
        .C2(n252), .ZN(\EX/r0data_fwd [3]) );
  OAI222D1BWP U397 ( .A1(n354), .A2(n262), .B1(n386), .B2(n263), .C1(n123), 
        .C2(n251), .ZN(\EX/r0data_fwd [0]) );
  OAI222D1BWP U398 ( .A1(n359), .A2(n262), .B1(n383), .B2(n263), .C1(n101), 
        .C2(n252), .ZN(\EX/r0data_fwd [5]) );
  OAI222D1BWP U399 ( .A1(n356), .A2(n262), .B1(n387), .B2(n263), .C1(n107), 
        .C2(n252), .ZN(\EX/r0data_fwd [2]) );
  OAI222D1BWP U400 ( .A1(n355), .A2(n262), .B1(n388), .B2(n263), .C1(n109), 
        .C2(n252), .ZN(\EX/r0data_fwd [1]) );
  CKBD3BWP U401 ( .I(n185), .Z(n253) );
  ND2D1BWP U402 ( .A1(n222), .A2(n124), .ZN(n185) );
  NR2XD0BWP U403 ( .A1(n124), .A2(n126), .ZN(n125) );
  INVD1BWP U404 ( .I(n180), .ZN(n329) );
  INVD1BWP U405 ( .I(n173), .ZN(n330) );
  MOAI22D0BWP U406 ( .A1(n318), .A2(n370), .B1(ALU_EXMEM[13]), .B2(n312), .ZN(
        addr_EXMEM[13]) );
  MOAI22D0BWP U407 ( .A1(n317), .A2(n371), .B1(ALU_EXMEM[14]), .B2(n312), .ZN(
        addr_EXMEM[14]) );
  MOAI22D0BWP U408 ( .A1(n317), .A2(n372), .B1(ALU_EXMEM[15]), .B2(n313), .ZN(
        addr_EXMEM[15]) );
  AN2XD1BWP U409 ( .A1(n222), .A2(n126), .Z(n190) );
  ND2D1BWP U410 ( .A1(n222), .A2(n125), .ZN(n247) );
  OAI222D1BWP U411 ( .A1(n361), .A2(n262), .B1(n381), .B2(n263), .C1(n97), 
        .C2(n252), .ZN(\EX/r0data_fwd [7]) );
  OAI222D1BWP U412 ( .A1(n372), .A2(n262), .B1(n373), .B2(n263), .C1(n111), 
        .C2(n251), .ZN(\EX/r0data_fwd [15]) );
  OAI222D1BWP U413 ( .A1(n362), .A2(n262), .B1(n380), .B2(n263), .C1(n95), 
        .C2(n252), .ZN(\EX/r0data_fwd [8]) );
  OAI222D1BWP U414 ( .A1(n368), .A2(n262), .B1(n377), .B2(n263), .C1(n119), 
        .C2(n251), .ZN(\EX/r0data_fwd [11]) );
  OAI222D1BWP U415 ( .A1(n369), .A2(n262), .B1(n376), .B2(n263), .C1(n117), 
        .C2(n251), .ZN(\EX/r0data_fwd [12]) );
  OAI222D1BWP U416 ( .A1(n370), .A2(n262), .B1(n375), .B2(n263), .C1(n115), 
        .C2(n251), .ZN(\EX/r0data_fwd [13]) );
  OAI222D1BWP U417 ( .A1(n371), .A2(n262), .B1(n374), .B2(n263), .C1(n113), 
        .C2(n251), .ZN(\EX/r0data_fwd [14]) );
  OAI222D1BWP U418 ( .A1(n364), .A2(n262), .B1(n378), .B2(n263), .C1(n121), 
        .C2(n251), .ZN(\EX/r0data_fwd [10]) );
  OAI222D1BWP U419 ( .A1(n363), .A2(n262), .B1(n379), .B2(n263), .C1(n93), 
        .C2(n252), .ZN(\EX/r0data_fwd [9]) );
  MOAI22D0BWP U420 ( .A1(n332), .A2(n326), .B1(n326), .B2(n280), .ZN(FWD[7])
         );
  CKBD3BWP U421 ( .I(n129), .Z(n264) );
  INR2D1BWP U422 ( .A1(Branch), .B1(n250), .ZN(n129) );
  NR2XD0BWP U423 ( .A1(Branch), .A2(n250), .ZN(n164) );
  OAI22D1BWP U424 ( .A1(n338), .A2(n326), .B1(\ID/ReadRd ), .B2(n339), .ZN(
        FWD[4]) );
  OAI221D1BWP U425 ( .A1(n281), .A2(n165), .B1(n332), .B2(n327), .C(n166), 
        .ZN(FWD[3]) );
  ND2D1BWP U426 ( .A1(n339), .A2(n333), .ZN(\ID/add_1_root_add_39_2/carry[1] )
         );
  MOAI22D0BWP U427 ( .A1(n317), .A2(n355), .B1(ALU_EXMEM[1]), .B2(n313), .ZN(
        addr_EXMEM[1]) );
  MOAI22D0BWP U428 ( .A1(n317), .A2(n356), .B1(ALU_EXMEM[2]), .B2(n314), .ZN(
        addr_EXMEM[2]) );
  MOAI22D0BWP U429 ( .A1(n315), .A2(n354), .B1(ALU_EXMEM[0]), .B2(n311), .ZN(
        addr_EXMEM[0]) );
  MOAI22D0BWP U430 ( .A1(n316), .A2(n357), .B1(ALU_EXMEM[3]), .B2(n314), .ZN(
        addr_EXMEM[3]) );
  MOAI22D0BWP U431 ( .A1(n316), .A2(n358), .B1(ALU_EXMEM[4]), .B2(n314), .ZN(
        addr_EXMEM[4]) );
  MOAI22D0BWP U432 ( .A1(n316), .A2(n359), .B1(ALU_EXMEM[5]), .B2(n314), .ZN(
        addr_EXMEM[5]) );
  MOAI22D0BWP U433 ( .A1(n315), .A2(n360), .B1(ALU_EXMEM[6]), .B2(n313), .ZN(
        addr_EXMEM[6]) );
  MOAI22D0BWP U434 ( .A1(n315), .A2(n361), .B1(ALU_EXMEM[7]), .B2(n313), .ZN(
        addr_EXMEM[7]) );
  MOAI22D0BWP U435 ( .A1(n315), .A2(n362), .B1(ALU_EXMEM[8]), .B2(n312), .ZN(
        addr_EXMEM[8]) );
  MOAI22D0BWP U436 ( .A1(n316), .A2(n363), .B1(ALU_EXMEM[9]), .B2(n311), .ZN(
        addr_EXMEM[9]) );
  MOAI22D0BWP U437 ( .A1(n318), .A2(n364), .B1(ALU_EXMEM[10]), .B2(n311), .ZN(
        addr_EXMEM[10]) );
  MOAI22D0BWP U438 ( .A1(n318), .A2(n368), .B1(ALU_EXMEM[11]), .B2(n311), .ZN(
        addr_EXMEM[11]) );
  MOAI22D0BWP U439 ( .A1(n318), .A2(n369), .B1(ALU_EXMEM[12]), .B2(n312), .ZN(
        addr_EXMEM[12]) );
  ND2D1BWP U440 ( .A1(n332), .A2(n325), .ZN(WB_IDEX[6]) );
  ND2D1BWP U441 ( .A1(n337), .A2(n325), .ZN(WB_IDEX[5]) );
  ND2D1BWP U442 ( .A1(n336), .A2(n325), .ZN(WB_IDEX[4]) );
  ND2D1BWP U443 ( .A1(n338), .A2(n325), .ZN(WB_IDEX[3]) );
  CKBD1BWP U444 ( .I(n240), .Z(n319) );
  INVD1BWP U445 ( .I(n249), .ZN(n268) );
  INVD1BWP U446 ( .I(n249), .ZN(n267) );
  CKBD1BWP U447 ( .I(n189), .Z(n260) );
  CKND2BWP U448 ( .I(n275), .ZN(n276) );
  CKBD1BWP U449 ( .I(n188), .Z(n258) );
  CKBD1BWP U450 ( .I(n189), .Z(n261) );
  CKBD1BWP U451 ( .I(n188), .Z(n259) );
  INVD1BWP U452 ( .I(n279), .ZN(n280) );
  INVD1BWP U453 ( .I(n123), .ZN(n389) );
  INVD1BWP U454 ( .I(n109), .ZN(n390) );
  INVD1BWP U455 ( .I(n107), .ZN(n391) );
  INVD1BWP U456 ( .I(n105), .ZN(n392) );
  INVD1BWP U457 ( .I(n103), .ZN(n393) );
  INVD1BWP U458 ( .I(n101), .ZN(n394) );
  INVD1BWP U459 ( .I(n99), .ZN(n395) );
  INVD1BWP U460 ( .I(n97), .ZN(n396) );
  INVD1BWP U461 ( .I(n95), .ZN(n397) );
  INVD1BWP U462 ( .I(n93), .ZN(n398) );
  INVD1BWP U463 ( .I(n121), .ZN(n399) );
  INVD1BWP U464 ( .I(n119), .ZN(n400) );
  INVD1BWP U465 ( .I(n117), .ZN(n401) );
  INVD1BWP U466 ( .I(n115), .ZN(n402) );
  INVD1BWP U467 ( .I(n113), .ZN(n403) );
  INVD1BWP U468 ( .I(n111), .ZN(n404) );
  ND2D1BWP U469 ( .A1(n126), .A2(n277), .ZN(n89) );
  CKBD1BWP U470 ( .I(n240), .Z(n320) );
  CKBD1BWP U471 ( .I(n240), .Z(n321) );
  CKBD1BWP U472 ( .I(n240), .Z(n322) );
  OAI21D1BWP U473 ( .A1(n333), .A2(n339), .B(\ID/add_1_root_add_39_2/carry[1] ), .ZN(PCbranch_IDEX[0]) );
  INVD1BWP U474 ( .I(n281), .ZN(n283) );
  INVD1BWP U475 ( .I(n281), .ZN(n282) );
  ND2D1BWP U476 ( .A1(n124), .A2(n277), .ZN(n248) );
  CKBD1BWP U477 ( .I(n340), .Z(n309) );
  CKBD1BWP U478 ( .I(n340), .Z(n307) );
  CKBD1BWP U479 ( .I(n340), .Z(n308) );
  CKBD1BWP U480 ( .I(n340), .Z(n310) );
  CKBD1BWP U481 ( .I(n245), .Z(n306) );
  CKBD1BWP U482 ( .I(n245), .Z(n304) );
  CKBD1BWP U483 ( .I(n245), .Z(n305) );
  IND4D1BWP U484 ( .A1(n227), .B1(n226), .B2(n224), .B3(n232), .ZN(n231) );
  OAI31D1BWP U485 ( .A1(n176), .A2(n177), .A3(n178), .B(n179), .ZN(n173) );
  IND4D1BWP U486 ( .A1(n174), .B1(n180), .B2(n171), .B3(n181), .ZN(n179) );
  AOI22D1BWP U487 ( .A1(\WB/MemData [1]), .A2(n276), .B1(\WB/ALU [1]), .B2(
        n405), .ZN(n109) );
  OAI211D1BWP U488 ( .A1(n123), .A2(n253), .B(n220), .C(n221), .ZN(\EX/b [0])
         );
  AOI222D1BWP U489 ( .A1(\EX/ALUSrc[1] ), .A2(\EX/ALUSrc[0] ), .B1(\EX/imm[0] ), .B2(n258), .C1(\EX/offset [0]), .C2(n260), .ZN(n221) );
  AOI22D1BWP U490 ( .A1(n254), .A2(ALU_MEMWB[0]), .B1(n256), .B2(
        \EX/r1data [0]), .ZN(n220) );
  OAI211D1BWP U491 ( .A1(n109), .A2(n253), .B(n206), .C(n207), .ZN(\EX/b [1])
         );
  AOI22D1BWP U492 ( .A1(\EX/imm[1] ), .A2(n258), .B1(\EX/offset [1]), .B2(n260), .ZN(n207) );
  AOI22D1BWP U493 ( .A1(n254), .A2(ALU_MEMWB[1]), .B1(n256), .B2(
        \EX/r1data [1]), .ZN(n206) );
  OAI211D1BWP U494 ( .A1(n107), .A2(n253), .B(n204), .C(n205), .ZN(\EX/b [2])
         );
  AOI22D1BWP U495 ( .A1(\EX/imm[2] ), .A2(n259), .B1(\EX/offset [2]), .B2(n261), .ZN(n205) );
  AOI22D1BWP U496 ( .A1(n255), .A2(ALU_MEMWB[2]), .B1(n257), .B2(
        \EX/r1data [2]), .ZN(n204) );
  OAI211D1BWP U497 ( .A1(n103), .A2(n253), .B(n200), .C(n201), .ZN(\EX/b [4])
         );
  AOI22D1BWP U498 ( .A1(\EX/imm[4] ), .A2(n259), .B1(\EX/offset [4]), .B2(n261), .ZN(n201) );
  AOI22D1BWP U499 ( .A1(n255), .A2(ALU_MEMWB[4]), .B1(n257), .B2(
        \EX/r1data [4]), .ZN(n200) );
  OAI211D1BWP U500 ( .A1(n101), .A2(n253), .B(n198), .C(n199), .ZN(\EX/b [5])
         );
  AOI22D1BWP U501 ( .A1(\EX/imm[5] ), .A2(n259), .B1(\EX/offset [5]), .B2(n261), .ZN(n199) );
  AOI22D1BWP U502 ( .A1(n255), .A2(ALU_MEMWB[5]), .B1(n257), .B2(
        \EX/r1data [5]), .ZN(n198) );
  OAI211D1BWP U503 ( .A1(n99), .A2(n253), .B(n196), .C(n197), .ZN(\EX/b [6])
         );
  AOI22D1BWP U504 ( .A1(\EX/imm[6] ), .A2(n259), .B1(\EX/offset [6]), .B2(n261), .ZN(n197) );
  AOI22D1BWP U505 ( .A1(n255), .A2(ALU_MEMWB[6]), .B1(n257), .B2(
        \EX/r1data [6]), .ZN(n196) );
  OAI211D1BWP U506 ( .A1(n105), .A2(n253), .B(n202), .C(n203), .ZN(\EX/b [3])
         );
  AOI22D1BWP U507 ( .A1(\EX/imm[3] ), .A2(n259), .B1(\EX/offset [3]), .B2(n261), .ZN(n203) );
  AOI22D1BWP U508 ( .A1(n255), .A2(ALU_MEMWB[3]), .B1(n257), .B2(
        \EX/r1data [3]), .ZN(n202) );
  OAI31D1BWP U509 ( .A1(n175), .A2(n174), .A3(n329), .B(n251), .ZN(n168) );
  ND3D1BWP U510 ( .A1(n170), .A2(\DF/RegWrite[0] ), .A3(n171), .ZN(n175) );
  ND4D1BWP U511 ( .A1(n170), .A2(\DF/RegWrite[0] ), .A3(n171), .A4(n172), .ZN(
        n169) );
  NR3D0BWP U512 ( .A1(n173), .A2(n174), .A3(n329), .ZN(n172) );
  ND3D1BWP U513 ( .A1(n238), .A2(\DF/RegWrite[0] ), .A3(n239), .ZN(n235) );
  AN4D1BWP U514 ( .A1(n223), .A2(n224), .A3(\DF/RegWrite[0] ), .A4(n225), .Z(
        n126) );
  INR3D0BWP U515 ( .A1(n226), .B1(\DF/MemToReg[0] ), .B2(n227), .ZN(n225) );
  ND3D1BWP U516 ( .A1(n233), .A2(n183), .A3(n234), .ZN(n228) );
  ND3D1BWP U517 ( .A1(n182), .A2(n183), .A3(n184), .ZN(n176) );
  INVD1BWP U518 ( .I(\DF/write_addr[2] ), .ZN(n331) );
  AN3XD1BWP U519 ( .A1(n170), .A2(\DF/RegWrite[0] ), .A3(\DF/MemToReg[0] ), 
        .Z(n181) );
  AN3XD1BWP U520 ( .A1(\DF/MemToReg[0] ), .A2(\DF/RegWrite[0] ), .A3(n223), 
        .Z(n232) );
  INVD1BWP U521 ( .I(\WB/WB[0] ), .ZN(n275) );
  AOI22D1BWP U522 ( .A1(\WB/MemData [0]), .A2(n276), .B1(\WB/ALU [0]), .B2(
        n405), .ZN(n123) );
  AOI22D1BWP U523 ( .A1(\WB/MemData [8]), .A2(n276), .B1(\WB/ALU [8]), .B2(
        n405), .ZN(n95) );
  AOI22D1BWP U524 ( .A1(n276), .A2(\WB/MemData [9]), .B1(\WB/ALU [9]), .B2(
        n405), .ZN(n93) );
  AOI22D1BWP U525 ( .A1(\WB/MemData [2]), .A2(n276), .B1(\WB/ALU [2]), .B2(
        n405), .ZN(n107) );
  AOI22D1BWP U526 ( .A1(\WB/MemData [10]), .A2(n276), .B1(\WB/ALU [10]), .B2(
        n405), .ZN(n121) );
  AOI22D1BWP U527 ( .A1(\WB/MemData [3]), .A2(n276), .B1(\WB/ALU [3]), .B2(
        n405), .ZN(n105) );
  AOI22D1BWP U528 ( .A1(\WB/MemData [11]), .A2(\WB/WB[0] ), .B1(\WB/ALU [11]), 
        .B2(n405), .ZN(n119) );
  AOI22D1BWP U529 ( .A1(\WB/MemData [4]), .A2(n276), .B1(\WB/ALU [4]), .B2(
        n405), .ZN(n103) );
  AOI22D1BWP U530 ( .A1(\WB/MemData [12]), .A2(\WB/WB[0] ), .B1(\WB/ALU [12]), 
        .B2(n405), .ZN(n117) );
  AOI22D1BWP U531 ( .A1(\WB/MemData [5]), .A2(n276), .B1(\WB/ALU [5]), .B2(
        n405), .ZN(n101) );
  AOI22D1BWP U532 ( .A1(\WB/MemData [13]), .A2(\WB/WB[0] ), .B1(\WB/ALU [13]), 
        .B2(n405), .ZN(n115) );
  AOI22D1BWP U533 ( .A1(\WB/MemData [6]), .A2(n276), .B1(\WB/ALU [6]), .B2(
        n405), .ZN(n99) );
  AOI22D1BWP U534 ( .A1(\WB/MemData [14]), .A2(\WB/WB[0] ), .B1(\WB/ALU [14]), 
        .B2(n405), .ZN(n113) );
  AOI22D1BWP U535 ( .A1(\WB/MemData [7]), .A2(n276), .B1(\WB/ALU [7]), .B2(
        n405), .ZN(n97) );
  AOI22D1BWP U536 ( .A1(\WB/MemData [15]), .A2(n276), .B1(\WB/ALU [15]), .B2(
        n405), .ZN(n111) );
  INVD1BWP U537 ( .I(rst), .ZN(n328) );
  OAI211D1BWP U538 ( .A1(n97), .A2(n253), .B(n194), .C(n195), .ZN(\EX/b [7])
         );
  AOI22D1BWP U539 ( .A1(\EX/imm[7] ), .A2(n259), .B1(\EX/offset [7]), .B2(n261), .ZN(n195) );
  AOI22D1BWP U540 ( .A1(n255), .A2(ALU_MEMWB[7]), .B1(n257), .B2(
        \EX/r1data [7]), .ZN(n194) );
  OAI211D1BWP U541 ( .A1(n111), .A2(n253), .B(n208), .C(n209), .ZN(\EX/b [15])
         );
  AOI22D1BWP U542 ( .A1(\EX/imm[15] ), .A2(n258), .B1(\EX/offset [15]), .B2(
        n260), .ZN(n209) );
  AOI22D1BWP U543 ( .A1(n254), .A2(ALU_MEMWB[15]), .B1(n256), .B2(
        \EX/r1data [15]), .ZN(n208) );
  MOAI22D0BWP U544 ( .A1(n337), .A2(n326), .B1(n326), .B2(PCcall[2]), .ZN(
        FWD[6]) );
  MOAI22D0BWP U545 ( .A1(n336), .A2(n326), .B1(n326), .B2(PCcall[1]), .ZN(
        FWD[5]) );
  CKBD4BWP U546 ( .I(n132), .Z(n265) );
  INR3D0BWP U547 ( .A1(n164), .B1(n319), .B2(Ret), .ZN(n132) );
  OAI22D1BWP U548 ( .A1(n338), .A2(n327), .B1(n167), .B2(n165), .ZN(FWD[0]) );
  NR2XD0BWP U549 ( .A1(\ID/CallRet ), .A2(PCcall[4]), .ZN(n167) );
  OAI211D1BWP U550 ( .A1(n95), .A2(n253), .B(n192), .C(n193), .ZN(\EX/b [8])
         );
  AOI22D1BWP U551 ( .A1(\EX/imm[8] ), .A2(n259), .B1(\EX/offset [8]), .B2(n261), .ZN(n193) );
  AOI22D1BWP U552 ( .A1(n255), .A2(ALU_MEMWB[8]), .B1(n257), .B2(
        \EX/r1data [8]), .ZN(n192) );
  OAI211D1BWP U553 ( .A1(n93), .A2(n253), .B(n186), .C(n187), .ZN(\EX/b [9])
         );
  AOI22D1BWP U554 ( .A1(\EX/imm[9] ), .A2(n259), .B1(\EX/offset [9]), .B2(n261), .ZN(n187) );
  AOI22D1BWP U555 ( .A1(n255), .A2(ALU_MEMWB[9]), .B1(n257), .B2(
        \EX/r1data [9]), .ZN(n186) );
  OAI211D1BWP U556 ( .A1(n121), .A2(n253), .B(n218), .C(n219), .ZN(\EX/b [10])
         );
  AOI22D1BWP U557 ( .A1(\EX/imm[10] ), .A2(n258), .B1(\EX/offset [10]), .B2(
        n260), .ZN(n219) );
  AOI22D1BWP U558 ( .A1(n254), .A2(ALU_MEMWB[10]), .B1(n256), .B2(
        \EX/r1data [10]), .ZN(n218) );
  OAI211D1BWP U559 ( .A1(n119), .A2(n253), .B(n216), .C(n217), .ZN(\EX/b [11])
         );
  AOI22D1BWP U560 ( .A1(\EX/imm[11] ), .A2(n258), .B1(\EX/offset [11]), .B2(
        n260), .ZN(n217) );
  AOI22D1BWP U561 ( .A1(n254), .A2(ALU_MEMWB[11]), .B1(n256), .B2(
        \EX/r1data [11]), .ZN(n216) );
  OAI211D1BWP U562 ( .A1(n117), .A2(n253), .B(n214), .C(n215), .ZN(\EX/b [12])
         );
  AOI22D1BWP U563 ( .A1(\EX/imm[12] ), .A2(n258), .B1(\EX/offset [12]), .B2(
        n260), .ZN(n215) );
  AOI22D1BWP U564 ( .A1(n254), .A2(ALU_MEMWB[12]), .B1(n256), .B2(
        \EX/r1data [12]), .ZN(n214) );
  OAI211D1BWP U565 ( .A1(n115), .A2(n253), .B(n212), .C(n213), .ZN(\EX/b [13])
         );
  AOI22D1BWP U566 ( .A1(\EX/imm[13] ), .A2(n258), .B1(\EX/offset [13]), .B2(
        n260), .ZN(n213) );
  AOI22D1BWP U567 ( .A1(n254), .A2(ALU_MEMWB[13]), .B1(n256), .B2(
        \EX/r1data [13]), .ZN(n212) );
  OAI211D1BWP U568 ( .A1(n113), .A2(n253), .B(n210), .C(n211), .ZN(\EX/b [14])
         );
  AOI22D1BWP U569 ( .A1(\EX/imm[14] ), .A2(n258), .B1(\EX/offset [14]), .B2(
        n260), .ZN(n211) );
  AOI22D1BWP U570 ( .A1(n254), .A2(ALU_MEMWB[14]), .B1(n256), .B2(
        \EX/r1data [14]), .ZN(n210) );
  OAI221D1BWP U571 ( .A1(n335), .A2(n165), .B1(n337), .B2(n327), .C(n166), 
        .ZN(FWD[2]) );
  OAI221D1BWP U572 ( .A1(n334), .A2(n165), .B1(n336), .B2(n327), .C(n166), 
        .ZN(FWD[1]) );
  CKBD3BWP U573 ( .I(n131), .Z(n266) );
  INR3D0BWP U574 ( .A1(n164), .B1(n265), .B2(Ret), .ZN(n131) );
  NR2XD0BWP U575 ( .A1(\EX/ALUSrc[0] ), .A2(\EX/ALUSrc[1] ), .ZN(n222) );
  IND3D1BWP U576 ( .A1(\ID/BCR ), .B1(n328), .B2(n319), .ZN(\ID/rst_ctrl ) );
  INVD1BWP U577 ( .I(ALU_MEMWB[3]), .ZN(n385) );
  INVD1BWP U578 ( .I(ALU_MEMWB[0]), .ZN(n386) );
  INVD1BWP U579 ( .I(ALU_MEMWB[2]), .ZN(n387) );
  INVD1BWP U580 ( .I(ALU_MEMWB[1]), .ZN(n388) );
  INVD1BWP U581 ( .I(ALU_MEMWB[4]), .ZN(n384) );
  INVD1BWP U582 ( .I(ALU_MEMWB[5]), .ZN(n383) );
  INVD1BWP U583 ( .I(ALU_MEMWB[6]), .ZN(n382) );
  INVD1BWP U584 ( .I(ALU_MEMWB[7]), .ZN(n381) );
  INVD1BWP U585 ( .I(ALU_MEMWB[8]), .ZN(n380) );
  INVD1BWP U586 ( .I(ALU_MEMWB[9]), .ZN(n379) );
  INVD1BWP U587 ( .I(ALU_MEMWB[10]), .ZN(n378) );
  INVD1BWP U588 ( .I(ALU_MEMWB[11]), .ZN(n377) );
  INVD1BWP U589 ( .I(ALU_MEMWB[12]), .ZN(n376) );
  INVD1BWP U590 ( .I(ALU_MEMWB[13]), .ZN(n375) );
  INR2D1BWP U591 ( .A1(\EX/ALUSrc[1] ), .B1(\EX/ALUSrc[0] ), .ZN(n189) );
  INR2D1BWP U592 ( .A1(\EX/ALUSrc[0] ), .B1(\EX/ALUSrc[1] ), .ZN(n188) );
  INVD1BWP U593 ( .I(\EX/r0data [3]), .ZN(n357) );
  INVD1BWP U594 ( .I(\EX/r0data [0]), .ZN(n354) );
  INVD1BWP U595 ( .I(\EX/r0data [2]), .ZN(n356) );
  INVD1BWP U596 ( .I(\EX/r0data [1]), .ZN(n355) );
  INVD1BWP U597 ( .I(\EX/r0data [4]), .ZN(n358) );
  INVD1BWP U598 ( .I(\EX/r0data [5]), .ZN(n359) );
  INVD1BWP U599 ( .I(\EX/r0data [6]), .ZN(n360) );
  INVD1BWP U600 ( .I(\EX/r0data [7]), .ZN(n361) );
  INVD1BWP U601 ( .I(\EX/r0data [8]), .ZN(n362) );
  INVD1BWP U602 ( .I(\EX/r0data [9]), .ZN(n363) );
  INVD1BWP U603 ( .I(\EX/r0data [10]), .ZN(n364) );
  INVD1BWP U604 ( .I(\EX/r0data [11]), .ZN(n368) );
  INVD1BWP U605 ( .I(\EX/r0data [12]), .ZN(n369) );
  ND2D1BWP U606 ( .A1(n162), .A2(n163), .ZN(\IF/n39 ) );
  AOI22D1BWP U607 ( .A1(PCbranch[15]), .A2(n264), .B1(\IF/PC[15] ), .B2(n265), 
        .ZN(n162) );
  AOI22D1BWP U608 ( .A1(PC_inc_IFID[15]), .A2(n157), .B1(PCret[15]), .B2(n267), 
        .ZN(n163) );
  ND2D1BWP U609 ( .A1(n160), .A2(n161), .ZN(\IF/n40 ) );
  AOI22D1BWP U610 ( .A1(PCbranch[14]), .A2(n264), .B1(\IF/PC[14] ), .B2(n265), 
        .ZN(n160) );
  AOI22D1BWP U611 ( .A1(PC_inc_IFID[14]), .A2(n157), .B1(PCret[14]), .B2(n268), 
        .ZN(n161) );
  ND2D1BWP U612 ( .A1(n158), .A2(n159), .ZN(\IF/n41 ) );
  AOI22D1BWP U613 ( .A1(PCbranch[13]), .A2(n264), .B1(\IF/PC[13] ), .B2(n265), 
        .ZN(n158) );
  AOI22D1BWP U614 ( .A1(PC_inc_IFID[13]), .A2(n157), .B1(PCret[13]), .B2(n267), 
        .ZN(n159) );
  ND2D1BWP U615 ( .A1(n155), .A2(n156), .ZN(\IF/n42 ) );
  AOI22D1BWP U616 ( .A1(PCbranch[12]), .A2(n264), .B1(\IF/PC[12] ), .B2(n265), 
        .ZN(n155) );
  AOI22D1BWP U617 ( .A1(PC_inc_IFID[12]), .A2(n157), .B1(PCret[12]), .B2(n268), 
        .ZN(n156) );
  ND2D1BWP U618 ( .A1(n153), .A2(n154), .ZN(\IF/n43 ) );
  AOI22D1BWP U619 ( .A1(\IF/PC[11] ), .A2(n265), .B1(PCcall[11]), .B2(n250), 
        .ZN(n153) );
  AOI222D1BWP U620 ( .A1(PCbranch[11]), .A2(n264), .B1(PCret[11]), .B2(n267), 
        .C1(PC_inc_IFID[11]), .C2(n266), .ZN(n154) );
  ND2D1BWP U621 ( .A1(n151), .A2(n152), .ZN(\IF/n44 ) );
  AOI22D1BWP U622 ( .A1(\IF/PC[10] ), .A2(n265), .B1(PCcall[10]), .B2(n250), 
        .ZN(n151) );
  AOI222D1BWP U623 ( .A1(PCbranch[10]), .A2(n264), .B1(PCret[10]), .B2(n268), 
        .C1(PC_inc_IFID[10]), .C2(n266), .ZN(n152) );
  ND2D1BWP U624 ( .A1(n149), .A2(n150), .ZN(\IF/n45 ) );
  AOI22D1BWP U625 ( .A1(\IF/PC[9] ), .A2(n265), .B1(PCcall[9]), .B2(n250), 
        .ZN(n149) );
  AOI222D1BWP U626 ( .A1(PCbranch[9]), .A2(n264), .B1(PCret[9]), .B2(n267), 
        .C1(PC_inc_IFID[9]), .C2(n266), .ZN(n150) );
  ND2D1BWP U627 ( .A1(n147), .A2(n148), .ZN(\IF/n46 ) );
  AOI22D1BWP U628 ( .A1(\IF/PC[8] ), .A2(n265), .B1(PCcall[8]), .B2(n250), 
        .ZN(n147) );
  AOI222D1BWP U629 ( .A1(PCbranch[8]), .A2(n264), .B1(PCret[8]), .B2(n268), 
        .C1(PC_inc_IFID[8]), .C2(n266), .ZN(n148) );
  ND2D1BWP U630 ( .A1(n143), .A2(n144), .ZN(\IF/n48 ) );
  AOI22D1BWP U631 ( .A1(\IF/PC[6] ), .A2(n265), .B1(PCcall[6]), .B2(n250), 
        .ZN(n143) );
  AOI222D1BWP U632 ( .A1(PCbranch[6]), .A2(n264), .B1(PCret[6]), .B2(n268), 
        .C1(PC_inc_IFID[6]), .C2(n266), .ZN(n144) );
  ND2D1BWP U633 ( .A1(n141), .A2(n142), .ZN(\IF/n49 ) );
  AOI22D1BWP U634 ( .A1(\IF/PC[5] ), .A2(n265), .B1(PCcall[5]), .B2(n250), 
        .ZN(n141) );
  AOI222D1BWP U635 ( .A1(PCbranch[5]), .A2(n264), .B1(PCret[5]), .B2(n267), 
        .C1(PC_inc_IFID[5]), .C2(n266), .ZN(n142) );
  ND2D1BWP U636 ( .A1(n139), .A2(n140), .ZN(\IF/n50 ) );
  AOI22D1BWP U637 ( .A1(\IF/PC[4] ), .A2(n265), .B1(PCcall[4]), .B2(n250), 
        .ZN(n139) );
  AOI222D1BWP U638 ( .A1(PCbranch[4]), .A2(n264), .B1(PCret[4]), .B2(n268), 
        .C1(PC_inc_IFID[4]), .C2(n266), .ZN(n140) );
  ND2D1BWP U639 ( .A1(n137), .A2(n138), .ZN(\IF/n51 ) );
  AOI22D1BWP U640 ( .A1(\IF/PC[3] ), .A2(n265), .B1(n280), .B2(n250), .ZN(n137) );
  AOI222D1BWP U641 ( .A1(PCbranch[3]), .A2(n264), .B1(PCret[3]), .B2(n267), 
        .C1(PC_inc_IFID[3]), .C2(n266), .ZN(n138) );
  ND2D1BWP U642 ( .A1(n135), .A2(n136), .ZN(\IF/n52 ) );
  AOI22D1BWP U643 ( .A1(\IF/PC[2] ), .A2(n265), .B1(PCcall[2]), .B2(n250), 
        .ZN(n135) );
  AOI222D1BWP U644 ( .A1(PCbranch[2]), .A2(n264), .B1(PCret[2]), .B2(n268), 
        .C1(PC_inc_IFID[2]), .C2(n266), .ZN(n136) );
  ND2D1BWP U645 ( .A1(n133), .A2(n134), .ZN(\IF/n53 ) );
  AOI22D1BWP U646 ( .A1(\IF/PC[1] ), .A2(n265), .B1(PCcall[1]), .B2(n250), 
        .ZN(n133) );
  AOI222D1BWP U647 ( .A1(PCbranch[1]), .A2(n264), .B1(PCret[1]), .B2(n267), 
        .C1(PC_inc_IFID[1]), .C2(n266), .ZN(n134) );
  ND2D1BWP U648 ( .A1(n127), .A2(n128), .ZN(\IF/n54 ) );
  AOI22D1BWP U649 ( .A1(\IF/PC[0] ), .A2(n265), .B1(n250), .B2(PCcall[0]), 
        .ZN(n127) );
  AOI222D1BWP U650 ( .A1(PCbranch[0]), .A2(n264), .B1(PCret[0]), .B2(n268), 
        .C1(PC_inc_IFID[0]), .C2(n266), .ZN(n128) );
  ND2D1BWP U651 ( .A1(n145), .A2(n146), .ZN(\IF/n47 ) );
  AOI22D1BWP U652 ( .A1(\IF/PC[7] ), .A2(n265), .B1(n241), .B2(n250), .ZN(n145) );
  AOI222D1BWP U653 ( .A1(PCbranch[7]), .A2(n264), .B1(PCret[7]), .B2(n267), 
        .C1(PC_inc_IFID[7]), .C2(n266), .ZN(n146) );
  ND2D1BWP U654 ( .A1(Ret), .A2(n164), .ZN(n249) );
  INVD1BWP U655 ( .I(\EX/EX[7] ), .ZN(n340) );
  INVD1BWP U656 ( .I(ALU_MEMWB[14]), .ZN(n374) );
  INVD1BWP U657 ( .I(ALU_MEMWB[15]), .ZN(n373) );
  OAI221D1BWP U658 ( .A1(n269), .A2(n386), .B1(n271), .B2(n341), .C(n122), 
        .ZN(data_EXMEM[0]) );
  INVD1BWP U659 ( .I(\EX/r1data [0]), .ZN(n341) );
  AOI22D1BWP U660 ( .A1(n273), .A2(n389), .B1(\EX/PC_inc [0]), .B2(\EX/EX[6] ), 
        .ZN(n122) );
  OAI221D1BWP U661 ( .A1(n269), .A2(n373), .B1(n271), .B2(n367), .C(n110), 
        .ZN(data_EXMEM[15]) );
  INVD1BWP U662 ( .I(\EX/r1data [15]), .ZN(n367) );
  AOI22D1BWP U663 ( .A1(n273), .A2(n404), .B1(\EX/PC_inc [15]), .B2(\EX/EX[6] ), .ZN(n110) );
  OAI221D1BWP U664 ( .A1(n269), .A2(n374), .B1(n271), .B2(n366), .C(n112), 
        .ZN(data_EXMEM[14]) );
  INVD1BWP U665 ( .I(\EX/r1data [14]), .ZN(n366) );
  AOI22D1BWP U666 ( .A1(n273), .A2(n403), .B1(\EX/PC_inc [14]), .B2(\EX/EX[6] ), .ZN(n112) );
  OAI221D1BWP U667 ( .A1(n269), .A2(n375), .B1(n271), .B2(n365), .C(n114), 
        .ZN(data_EXMEM[13]) );
  INVD1BWP U668 ( .I(\EX/r1data [13]), .ZN(n365) );
  AOI22D1BWP U669 ( .A1(n273), .A2(n402), .B1(\EX/PC_inc [13]), .B2(\EX/EX[6] ), .ZN(n114) );
  OAI221D1BWP U670 ( .A1(n269), .A2(n376), .B1(n271), .B2(n353), .C(n116), 
        .ZN(data_EXMEM[12]) );
  INVD1BWP U671 ( .I(\EX/r1data [12]), .ZN(n353) );
  AOI22D1BWP U672 ( .A1(n273), .A2(n401), .B1(\EX/PC_inc [12]), .B2(\EX/EX[6] ), .ZN(n116) );
  OAI221D1BWP U673 ( .A1(n269), .A2(n377), .B1(n271), .B2(n352), .C(n118), 
        .ZN(data_EXMEM[11]) );
  INVD1BWP U674 ( .I(\EX/r1data [11]), .ZN(n352) );
  AOI22D1BWP U675 ( .A1(n273), .A2(n400), .B1(\EX/PC_inc [11]), .B2(\EX/EX[6] ), .ZN(n118) );
  OAI221D1BWP U676 ( .A1(n269), .A2(n378), .B1(n271), .B2(n351), .C(n120), 
        .ZN(data_EXMEM[10]) );
  INVD1BWP U677 ( .I(\EX/r1data [10]), .ZN(n351) );
  AOI22D1BWP U678 ( .A1(n273), .A2(n399), .B1(\EX/PC_inc [10]), .B2(\EX/EX[6] ), .ZN(n120) );
  OAI221D1BWP U679 ( .A1(n270), .A2(n379), .B1(n272), .B2(n350), .C(n91), .ZN(
        data_EXMEM[9]) );
  INVD1BWP U680 ( .I(\EX/r1data [9]), .ZN(n350) );
  AOI22D1BWP U681 ( .A1(n274), .A2(n398), .B1(\EX/PC_inc [9]), .B2(n278), .ZN(
        n91) );
  OAI221D1BWP U682 ( .A1(n270), .A2(n380), .B1(n272), .B2(n349), .C(n94), .ZN(
        data_EXMEM[8]) );
  INVD1BWP U683 ( .I(\EX/r1data [8]), .ZN(n349) );
  AOI22D1BWP U684 ( .A1(n274), .A2(n397), .B1(\EX/PC_inc [8]), .B2(n278), .ZN(
        n94) );
  OAI221D1BWP U685 ( .A1(n270), .A2(n381), .B1(n272), .B2(n348), .C(n96), .ZN(
        data_EXMEM[7]) );
  INVD1BWP U686 ( .I(\EX/r1data [7]), .ZN(n348) );
  AOI22D1BWP U687 ( .A1(n274), .A2(n396), .B1(\EX/PC_inc [7]), .B2(n278), .ZN(
        n96) );
  OAI221D1BWP U688 ( .A1(n270), .A2(n382), .B1(n272), .B2(n347), .C(n98), .ZN(
        data_EXMEM[6]) );
  INVD1BWP U689 ( .I(\EX/r1data [6]), .ZN(n347) );
  AOI22D1BWP U690 ( .A1(n274), .A2(n395), .B1(\EX/PC_inc [6]), .B2(n278), .ZN(
        n98) );
  OAI221D1BWP U691 ( .A1(n270), .A2(n383), .B1(n272), .B2(n346), .C(n100), 
        .ZN(data_EXMEM[5]) );
  INVD1BWP U692 ( .I(\EX/r1data [5]), .ZN(n346) );
  AOI22D1BWP U693 ( .A1(n274), .A2(n394), .B1(\EX/PC_inc [5]), .B2(n278), .ZN(
        n100) );
  OAI221D1BWP U694 ( .A1(n270), .A2(n384), .B1(n272), .B2(n345), .C(n102), 
        .ZN(data_EXMEM[4]) );
  INVD1BWP U695 ( .I(\EX/r1data [4]), .ZN(n345) );
  AOI22D1BWP U696 ( .A1(n274), .A2(n393), .B1(\EX/PC_inc [4]), .B2(n278), .ZN(
        n102) );
  OAI221D1BWP U697 ( .A1(n270), .A2(n385), .B1(n272), .B2(n344), .C(n104), 
        .ZN(data_EXMEM[3]) );
  INVD1BWP U698 ( .I(\EX/r1data [3]), .ZN(n344) );
  AOI22D1BWP U699 ( .A1(n274), .A2(n392), .B1(\EX/PC_inc [3]), .B2(n278), .ZN(
        n104) );
  OAI221D1BWP U700 ( .A1(n270), .A2(n387), .B1(n272), .B2(n343), .C(n106), 
        .ZN(data_EXMEM[2]) );
  INVD1BWP U701 ( .I(\EX/r1data [2]), .ZN(n343) );
  AOI22D1BWP U702 ( .A1(n274), .A2(n391), .B1(\EX/PC_inc [2]), .B2(n278), .ZN(
        n106) );
  OAI221D1BWP U703 ( .A1(n269), .A2(n388), .B1(n271), .B2(n342), .C(n108), 
        .ZN(data_EXMEM[1]) );
  INVD1BWP U704 ( .I(\EX/r1data [1]), .ZN(n342) );
  AOI22D1BWP U705 ( .A1(n273), .A2(n390), .B1(\EX/PC_inc [1]), .B2(\EX/EX[6] ), 
        .ZN(n108) );
  INVD1BWP U706 ( .I(\EX/r0data [13]), .ZN(n370) );
  INVD1BWP U707 ( .I(\EX/r0data [14]), .ZN(n371) );
  INVD1BWP U708 ( .I(\EX/r0data [15]), .ZN(n372) );
  INVD1BWP U709 ( .I(\EX/EX[6] ), .ZN(n277) );
  TIELBWP U710 ( .ZN(n323) );
  TIEHBWP U711 ( .Z(n324) );
endmodule

