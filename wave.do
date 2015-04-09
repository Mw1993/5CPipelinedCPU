onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_tb/clk
add wave -noupdate /CPU_tb/hlt
add wave -noupdate /CPU_tb/rst
add wave -noupdate -divider IF
add wave -noupdate /CPU_tb/iDUT/IF/PC
add wave -noupdate /CPU_tb/iDUT/IF/Ret
add wave -noupdate /CPU_tb/iDUT/IF/Call
add wave -noupdate /CPU_tb/iDUT/IF/Branch
add wave -noupdate /CPU_tb/iDUT/IF/PCret
add wave -noupdate /CPU_tb/iDUT/IF/PCcall
add wave -noupdate /CPU_tb/iDUT/IF/PCbranch
add wave -noupdate /CPU_tb/iDUT/IF/PC_inc
add wave -noupdate /CPU_tb/iDUT/IF/instr
add wave -noupdate -divider ID
add wave -noupdate /CPU_tb/iDUT/ID/stall
add wave -noupdate /CPU_tb/iDUT/HD/Stall
add wave -noupdate /CPU_tb/iDUT/HD/tmpStall
add wave -noupdate /CPU_tb/iDUT/HD/opcod
add wave -noupdate /CPU_tb/iDUT/ID/PC_inc
add wave -noupdate /CPU_tb/iDUT/ID/instr
add wave -noupdate -expand /CPU_tb/iDUT/ID/regFile/mem
add wave -noupdate /CPU_tb/iDUT/ID/rd
add wave -noupdate /CPU_tb/iDUT/ID/rt
add wave -noupdate /CPU_tb/iDUT/ID/rs
add wave -noupdate /CPU_tb/iDUT/ID/ctrl/opcod
add wave -noupdate /CPU_tb/iDUT/ID/ctrl/rst
add wave -noupdate /CPU_tb/iDUT/ID/LoadStore
add wave -noupdate /CPU_tb/iDUT/ID/r0_addr
add wave -noupdate /CPU_tb/iDUT/ID/dst_addr
add wave -noupdate /CPU_tb/iDUT/ID/r0data
add wave -noupdate /CPU_tb/iDUT/ID/r1_addr
add wave -noupdate /CPU_tb/iDUT/ID/r1data
add wave -noupdate /CPU_tb/iDUT/ID/RegWrite
add wave -noupdate -divider EX
add wave -noupdate /CPU_tb/iDUT/EX/PC_inc
add wave -noupdate /CPU_tb/iDUT/EX/rst
add wave -noupdate /CPU_tb/iDUT/WB/stall
add wave -noupdate /CPU_tb/iDUT/EX/alu/a
add wave -noupdate /CPU_tb/iDUT/EX/alu/b
add wave -noupdate /CPU_tb/iDUT/EX/alu/ALUOp
add wave -noupdate /CPU_tb/iDUT/EX/alu/result
add wave -noupdate /CPU_tb/iDUT/EX/alu/shamt
add wave -noupdate /CPU_tb/iDUT/EX/alu/dnset
add wave -noupdate /CPU_tb/iDUT/EX/alu/addsub
add wave -noupdate /CPU_tb/iDUT/EX/zr
add wave -noupdate /CPU_tb/iDUT/EX/ov
add wave -noupdate /CPU_tb/iDUT/EX/neg
add wave -noupdate /CPU_tb/iDUT/EX/ALUSrc
add wave -noupdate /CPU_tb/iDUT/EX/fwd_reg0
add wave -noupdate /CPU_tb/iDUT/EX/fwd_reg1
add wave -noupdate /CPU_tb/iDUT/EX/write_data_prvprv
add wave -noupdate /CPU_tb/iDUT/EX/ALU_prv
add wave -noupdate /CPU_tb/iDUT/EX/r0data
add wave -noupdate /CPU_tb/iDUT/EX/r1data
add wave -noupdate /CPU_tb/iDUT/DF/MemToReg
add wave -noupdate /CPU_tb/iDUT/DF/RegWrite
add wave -noupdate /CPU_tb/iDUT/DF/doublewrite
add wave -noupdate /CPU_tb/iDUT/DF/write_addr
add wave -noupdate /CPU_tb/iDUT/DF/FWD_in
add wave -noupdate /CPU_tb/iDUT/DF/FWD
add wave -noupdate /CPU_tb/iDUT/DF/dataDep
add wave -noupdate -divider MEM
add wave -noupdate /CPU_tb/iDUT/MEM/ALU_in
add wave -noupdate /CPU_tb/iDUT/MEM/ALU
add wave -noupdate /CPU_tb/iDUT/MEM/addr
add wave -noupdate /CPU_tb/iDUT/MEM/wdata
add wave -noupdate /CPU_tb/iDUT/MEM/rdata
add wave -noupdate /CPU_tb/iDUT/MEM/MemRead
add wave -noupdate /CPU_tb/iDUT/MEM/MemWrite
add wave -noupdate -divider WB
add wave -noupdate /CPU_tb/iDUT/WB/MemData
add wave -noupdate /CPU_tb/iDUT/WB/ALU
add wave -noupdate /CPU_tb/iDUT/WB/MemToReg
add wave -noupdate /CPU_tb/iDUT/WB/RegWrite
add wave -noupdate /CPU_tb/iDUT/WB/write_addr
add wave -noupdate /CPU_tb/iDUT/WB/RegData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {397 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 54
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {306 ns} {456 ns}
