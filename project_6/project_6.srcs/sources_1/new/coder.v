`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 16:47:29
// Design Name: 
// Module Name: coder
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


module coder(
input [3:0] uncode,
output reg[7:0] SEG
    );
    always@(*)
    case(uncode[3:0])
    4'b0000: SEG[7:0]=8'b11000000;
    4'b0001: SEG[7:0]=8'b11111001;
    4'b0010: SEG[7:0]=8'b10100100;
    4'b0011: SEG[7:0]=8'b10110000;
    4'b0100: SEG[7:0]=8'b10011001;
    4'b0101: SEG[7:0]=8'b10010010;
    4'b0110: SEG[7:0]=8'b10000010;
    4'b0111: SEG[7:0]=8'b11011000;
    4'b1000: SEG[7:0]=8'b10000000;
    4'b1001: SEG[7:0]=8'b10010000;
    4'b1010: SEG[7:0]=8'b10001000;
    4'b1011: SEG[7:0]=8'b10000011;
    4'b1100: SEG[7:0]=8'b11000110;
    4'b1101: SEG[7:0]=8'b10100001;
    4'b1110: SEG[7:0]=8'b10000110;
    4'b1111: SEG[7:0]=8'b10001110;
    default SEG[7:0]=8'b01111111;
    endcase
endmodule
