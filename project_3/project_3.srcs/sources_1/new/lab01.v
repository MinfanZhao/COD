`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/19 18:52:42
// Design Name: 
// Module Name: lab01
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


module lab01(
input [10:0]SW,
output reg [2:0]AN,
output [7:0]SEG
    );
   always @(*)
   begin
      AN=SW[10:8];
      end
    Mseg myseg(SW[7:0],SEG)  ;
endmodule
