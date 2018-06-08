`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/26 19:07:40
// Design Name: 
// Module Name: test2
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


module test2(

    );
    reg [1:0]S;
    wire [1:0]L;
    
    lab02 test2(
    .SW (S),
    .LED (L)
    );
    
    initial begin 
    S[0]=0;
    S[1]=1;
    #10;
    S[1]=0;
    end
    
endmodule
