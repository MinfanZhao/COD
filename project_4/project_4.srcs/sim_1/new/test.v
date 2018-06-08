`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/26 18:32:47
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
    reg [1:0]SW;
    wire [1:0]LED;
    
    lab02 test(
    .SW (SW),
    .LED (LED)
    );
 
    initial begin
    SW[0]=0;
    SW[1]=1;
    #10;
    SW[0]=1;
    end
    
endmodule
