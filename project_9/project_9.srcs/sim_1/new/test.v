`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 19:38:48
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
    
    reg clk;
    reg [3:0]sw;
    reg BTNC;
    wire [7:0] seg;
    wire [2:0] an;
    wire [15:0] LED;
    Lab06 test(
        .CLK50MHZ (clk),
        .SW (sw),
        .BTNC (BTNC),
        .SEG (seg),
        .AN (an),
        .LED (LED)
        );
    
    always #10 clk=~clk;
    initial 
    begin
    clk=0;
    sw=4'b0001;
    BTNC=0;
    #10
    BTNC=1;
    end
endmodule
