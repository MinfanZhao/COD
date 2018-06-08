`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/26 17:55:45
// Design Name: 
// Module Name: 1bitMUX4
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


module bitMUX4(
input a,
input b,
input c,
input d,
input [1:0]S,
output e
    );
    wire x;
    wire y;
    assign x=S[0]?b:a;
    assign y=S[0]?d:c;
    assign e=S[1]?y:x;
endmodule
