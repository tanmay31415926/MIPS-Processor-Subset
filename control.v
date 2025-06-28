`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 14:32:45
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller( opcode,regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc,  ALUop);
input [5:0] opcode;
 output regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc;
 output [1:0] ALUop;
assign regWrite = ((~opcode[0]) & (~opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5])) | ((opcode[0]) & (opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5])) | ((opcode[0]) & (opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (opcode[5]));
assign regDest = ((~opcode[0]) & (~opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]));
assign jump = ((~opcode[0]) & (opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]));
assign jal =((opcode[0]) & (opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]));
assign branch = ((~opcode[0]) & (~opcode[1])&(opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]));
assign MemToReg = ((opcode[0]) & (opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (opcode[5]));
assign MemWrite = ((opcode[0]) & (opcode[1])&(~opcode[2]) & (opcode[3]) & (~opcode[4]) & (opcode[5]));
assign ALUsrc = ((opcode[0]) & (opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (opcode[5])) | ((opcode[0]) & (opcode[1])&(~opcode[2]) & (opcode[3]) & (~opcode[4]) & (opcode[5]));
assign ALUop[0] = ((~opcode[0]) & (~opcode[1])&(opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]));
assign ALUop[1] = ((~opcode[0]) & (~opcode[1])&(~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]));





endmodule
