`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 18:27:05
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
    reg [7:0] SW;
    wire [2:0] LED;
    
    lab03 test(
    .SW (SW),
    .LED (LED)
    );
    initial begin
    SW[7:4] =4'b0001;
    SW[3:0] =4'b0000;
    #10 SW[3:0]=4'b0001;
    fork
    SW[7:4]=4'b0000;
    #10 SW[7:4] =4'b0001;
    #20 SW[3:0] =4'b0000;
    join
    #10 SW[7:4]=4'b0000;
    #10 SW[3:0]=4'b0001;
    SW[7:4] =4'b0001;
    end
endmodule
