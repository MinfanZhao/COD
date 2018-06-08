`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/01 17:19:40
// Design Name: 
// Module Name: NEXTPC
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


module NEXTPC(
input [31:0]NPC,
input [31:0]PCBranch,
input PCSrc,
input INIT,
output [31:0]PCdata
    );
        PCdata<=PCSrc>0?PCBranch:NPC;
endmodule
