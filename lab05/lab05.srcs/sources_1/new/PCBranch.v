`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/26 19:33:29
// Design Name: 
// Module Name: PCBranch
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


module PCBranch(
input signed [31:0] SignImm,
input signed [31:0] NPC,
input [2:0]ALUControl,
output reg signed [31:0] PCBranch
    );
    always @(*)
    if (ALUControl==3'b011)//bgtz
        PCBranch<=SignImm+NPC;
    else
        PCBranch<=(SignImm<<2)+NPC;
endmodule
