`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/19 20:01:19
// Design Name: 
// Module Name: SEG
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


module Mseg(
input [7:0]sw,
output reg [7:0]seg
    );
    always @(*)
    begin
    case(sw)
    0:seg=8'b11000000;
    2:seg=8'b10100100;
    3:seg=8'b10110000;
    4:seg=8'b10011001;
    1:seg=8'b11111001;
    5:seg=8'b10010010;
    6:seg=8'b10000010;
    7:seg=8'b11111000;
    8:seg=8'b10000000;
    9:seg=8'b10010000;
    default:seg=8'b011111111;
    endcase
    end
endmodule
