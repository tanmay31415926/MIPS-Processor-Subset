`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 14:49:55
// Design Name: 
// Module Name: ALU_Conntrol
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


module ALU_Conntrol(input [1:0] ALUop, input [5:0] func, output [2:0] ALUControl, output jr);

assign ALUControl[0] = ((~ALUop[0])&(ALUop[1])) & ( ((func[0]) & (~func[1])&(func[2]) & (~func[3]) & (~func[4]) & (func[5])) | ((~func[0]) & (func[1])&(~func[2]) & (func[3]) & (~func[4]) & (func[5])) );
assign ALUControl[1] = (~ALUop[1])| ( ((~ALUop[0])&(ALUop[1])) & ( ((~func[0]) & (~func[1])&(~func[2]) & (~func[3]) & (~func[4]) & (func[5])) | ((~func[0]) & (func[1])&(~func[2]) & (func[3]) & (~func[4]) & (func[5]))| ((~func[0]) & (func[1])&(~func[2]) & (~func[3]) & (~func[4]) & (func[5])) ));
assign ALUControl[2] = ((~ALUop[1])&(ALUop[0]))| ( ((~ALUop[0])&(ALUop[1])) & ( ((~func[0]) & (func[1])&(~func[2]) & (~func[3]) & (~func[4]) & (func[5])) | ((~func[0]) & (func[1])&(~func[2]) & (func[3]) & (~func[4]) & (func[5]))));

assign jr = ((~ALUop[0])&(ALUop[1])) &  ( (~func[0]) & (~func[1])&(~func[2]) & (func[3]) & (~func[4]) & (~func[5]) );





endmodule
