`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/01 00:59:17
// Design Name: 
// Module Name: SrcPC
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


module SrcPC(
input [1:0]PCSrc,
input [31:0]ALUResult,
input [31:0]ALUOUT,
input [31:0]PCJump,
output reg [31:0]PCnext
    );
	always@(*)
	case(PCSrc)
	2'b00:	PCnext=ALUResult;
	2'b01:	PCnext=ALUOUT;
	2'b10:	PCnext=PCJump;
	endcase
endmodule
