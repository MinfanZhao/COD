`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/30 23:19:28
// Design Name: 
// Module Name: RegRD
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


module RegRD(
input [31:0]RD1,
input [31:0]RD2,
input clk,
output reg [31:0]SrcA_RD,
output reg [31:0]SrcB_RD
    );
	always @ (posedge clk)
	begin
		SrcA_RD<=RD1;
		SrcB_RD<=RD2;
	end
endmodule
