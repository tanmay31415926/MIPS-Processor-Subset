module Top_Module(clk, reg1, reg2, reg3, reg4, reg5, mem1, mem2,pc,new_addr3,new_addr2,new_addr1,pc4,regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc, zerodetect );
input clk;
output [31:0] reg1, reg2, reg3, reg4, reg5, mem1, mem2;
output wire [31:0] pc;
wire [31:0] instruction;
output wire regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc;
wire [1:0] ALUop;
wire jr;
wire [2:0] ALUControl;
wire [4:0] wr1, wr2;
wire [31:0] wdr1;
output wire [31:0] pc4;
wire [31:0] rd1, rd2;
output wire zerodetect;
wire overflow;
wire [31:0] ALU_Res, ALU_input2;
wire [31:0] outSignExtend;
wire [31:0] data_out1, data_out2;
wire [27:0] jumpAddr;
wire [31:0] beqconst,branch_addr;
output wire [31:0] new_addr1,new_addr2,new_addr3;



single_reg program_counter (clk,new_addr3,pc);
instruction_memory IM(.address(pc), .instruction(instruction));
controller C(instruction[31:26], regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc, ALUop);
ALU_Conntrol ALUC(ALUop, instruction[5:0], ALUControl, jr);
mux_5bit M1(wr1, instruction[20:16], instruction[15:11], regDest);
mux_5bit M2(wr2, wr1, 5'b11111, jal);
mux_32bit M3(wdr1,data_out2, pc4, jal);
register_file RF(clk, instruction[25:21], instruction[20:16], wr2, wdr1,regWrite&(~jr), rd1, rd2, reg1, reg2, reg3, reg4, reg5 );//regWriyte&(~jr)
wire [31:0] const4 = 32'd4;
smartadder SA1(pc, const4, pc4); 
//assign pc4 = pc + const4;
signextender SE(instruction[15:0], outSignExtend);
mux_32bit M4(ALU_input2, rd2, outSignExtend, ALUsrc);
ALU A(rd1, ALU_input2, ALUControl, ALU_Res,zerodetect, overflow);
data_memory DM(clk, 1'b1, MemWrite, ALU_Res, rd2, data_out1, mem1, mem2);
mux_32bit M5(data_out2, ALU_Res, data_out1, MemToReg);
shift_left_2_28bit SL1(instruction[25:0], jumpAddr);
shift_left_2_32bit SL2(outSignExtend,beqconst);
smartadder SA2(pc4,beqconst,branch_addr);
//assign branch_addr = pc4 + beqconst;
mux_32bit M6 (new_addr1,pc4,branch_addr,branch&zerodetect);
mux_32bit M7 (new_addr2,new_addr1,{pc4[31:28],jumpAddr},jump|jal);
mux_32bit M8 (new_addr3,new_addr2,rd1,jr);





endmodule
