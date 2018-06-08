`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/24 23:48:17
// Design Name: 
// Module Name: test
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


module test(

    );
    reg [10:0]SW;
    wire [2:0]AN;
    wire [15:0]SEG;
    lab01 test(
    .SW (SW),
    .AN (AN),
    .SEG (SEG)
    );
    always
    initial begin
    SW=00100000001;
    #10;
    SW=01000000010;
    end
endmodule
