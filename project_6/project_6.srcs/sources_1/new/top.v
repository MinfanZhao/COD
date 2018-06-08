`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 16:46:39
// Design Name: 
// Module Name: top
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


module top(
input [3:0] SW,
input CLK50MHZ,
input BTNC,
output [3:0] LED,
output [7:0] SEG,
output [2:0] AN
    );
    wire  [3:0] count;
    cnt mycnt(
    .clk (CLK50MHZ),
    .rst_n (BTNC),
    .cnt (count)
    );
    assign AN[2:0]=3'b000;
    assign LED[3:0]=count[3:0];
    coder mycoder(
    .uncode (count),
    .SEG (SEG)
    );
    /*coder mycoder2(
        .uncode (SW),
        .SEG (SEG)
        );*/
endmodule