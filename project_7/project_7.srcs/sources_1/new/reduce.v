`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 17:12:13
// Design Name: 
// Module Name: reduce
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


module reduce(
input clk,
input buttom,
output reg en
    );
    reg [2:0]count;
     always @(posedge clk)
       if(!buttom)
           if(count==2'b11) 
           en=0;
           else
           begin
           count=count+1'b1;
           if(count==2'b11)
           begin
           en=1;
           end
           end
       else
           begin
           count=0;
           en=0;
           end
endmodule
