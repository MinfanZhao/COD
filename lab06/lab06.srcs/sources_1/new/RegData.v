`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/30 13:42:11
// Design Name: 
// Module Name: RegData
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


module RegData(
input clk,
input [31:0]RD,
output reg [31:0]Data
    );
	always @(posedge clk ) begin
		Data<=RD;
	end
endmodule
