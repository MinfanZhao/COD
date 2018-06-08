`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/29 19:59:07
// Design Name: 
// Module Name: PCUnit
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


module PCUnit(
input clk,
input PCEn,
input INIT,
input [31:0]PCnext,
output reg [31:0]PC
    );
    always@(posedge clk)
    if(INIT)
    	PC<=23;
    else if(PCEn)
        PC<=PCnext;
endmodule
