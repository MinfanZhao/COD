`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/07 17:41:21
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
    reg rst_n;
    
    top test(
    .clk (clk),
    .rst_n (rst_n)
    );
    always #10 clk=~clk;
    initial begin
    clk=0;
    rst_n=0;
    #10 
    rst_n=1;
    end
endmodule
