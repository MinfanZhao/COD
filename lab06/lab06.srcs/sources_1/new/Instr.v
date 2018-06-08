`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/29 19:59:25
// Design Name: 
// Module Name: Instr
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


module Instr(
input IRWrite,
input clk,
input [31:0]RD,
output reg [31:0]IR
    );
	always@(posedge clk)
	if (IRWrite)
	IR<=RD;
endmodule
