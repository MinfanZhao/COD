`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/01 18:57:53
// Design Name: 
// Module Name: INITPC
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


module INITPC(
input [31:0]PC,
output reg INIT
    );
    reg count;
    always@(PC)
    if(count==1)
        INIT<=1;
    else if (PC==0)
    begin
        INIT<=0;
        count<=1;
    end
    
endmodule
