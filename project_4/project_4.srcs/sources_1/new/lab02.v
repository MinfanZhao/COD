`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/25 21:21:40
// Design Name: 
// Module Name: lab02
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


module lab02(
input [1:0]SW,
output [1:0]LED
    );
    /*wire [1:0] sel;
    wire [1:0] o;
    assign sel=SW; 
    assign o=LED;*/
    bitMUX4 mymux(1,0,0,1,SW[1:0],LED[0]);
    bitMUX4 mymux2(0,1,1,0,SW[1:0],LED[1]);
endmodule
