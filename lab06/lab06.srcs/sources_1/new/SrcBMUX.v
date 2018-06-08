`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/29 20:28:51
// Design Name: 
// Module Name: SrcBMUX
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


module SrcBMUX(
input [31:0]RD2_B,
input [31:0]SignImm,
input [1:0]ALUSrcB,
output reg [31:0]SrcB
    );
    always@(*)
    case (ALUSrcB)
    2'b00: SrcB<=RD2_B;
    2'b01: SrcB<=1;
    2'b10: SrcB<=SignImm;
    2'b11: SrcB<=SignImm<<2;
    endcase
endmodule
