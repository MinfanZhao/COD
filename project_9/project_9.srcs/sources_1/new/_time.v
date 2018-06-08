`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 16:26:51
// Design Name: 
// Module Name: _time
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


module _time(
input clk,
input rst_n,
output reg CLK
    );
    reg [24:0]count;
    always@(posedge clk or negedge rst_n)
   begin
    if(!rst_n)
        count<=0;
    else if(count==25'd29)
        count<=0;
    else
        count<=count+25'b1;    
    end
    always@(posedge clk or negedge rst_n )
    begin
    if(!rst_n)
        CLK<=1'b0;
    else if (count==25'd29)
        CLK<=1'b1;
    else
        CLK<=1'b0;
    end    
endmodule
