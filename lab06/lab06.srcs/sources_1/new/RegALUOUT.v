`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/01 00:13:15
// Design Name: 
// Module Name: RegALUOUT
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


module RegALUOUT(
input clk,
input [31:0]ALUResult,
output reg [31:0]ALUOUT
    );
	always@(posedge clk)
		ALUOUT<=ALUResult;
endmodule
