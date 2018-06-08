`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 18:05:54
// Design Name: 
// Module Name: tset
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


module tset(

    );
    reg SW;
    reg BTNC;
    reg BTNU;
    reg clk;
    wire led;
    Lab05 test(
    .SW (SW),
    .BTNC (BTNC),
    .BTNU (BTNU),
    .CLK50MHZ (clk),
    .LED (led)
    );
    always #5 clk=~clk;
    initial 
    begin
    SW=1;
    BTNU=1;
    clk=0;
    BTNC=1;
    #10 BTNC=0;
    #10 BTNC=1;
    #10 BTNC=0;
    #10 BTNC=0;
    #10 BTNC=0;
    #10 BTNC=0;
    #10 BTNC=0;
    #10 BTNC=0;
    #10 BTNC=1;
    SW=1;
    #10 BTNC=0;
        #10 BTNC=1;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=1;
    SW=0;
    #10 BTNC=0;
        #10 BTNC=1;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=0;
        #10 BTNC=1;
     SW=1;
     #10 BTNC=0;
         #10 BTNC=1;
         #10 BTNC=0;
         #10 BTNC=0;
         #10 BTNC=0;
         #10 BTNC=0;
         #10 BTNC=0;
         #10 BTNC=0;
         #10 BTNC=1;
     SW=1;
    end
endmodule
