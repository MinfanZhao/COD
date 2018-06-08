`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 15:59:51
// Design Name: 
// Module Name: creINPUT
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


module creINPUT(
input SW,
input store,
input clk,
output reg sw,
output reg en
    );
    reg [1:0]count;
    always @(posedge clk)
    if(!store)
        if(count==2'b11) 
        en=0;
        else
        begin
        count=count+1'b1;
        if(count==2'b11)
        begin
        en=1;
        sw=SW;
        end
        end
    else
        begin
        count=0;
        en=0;
        end
    
endmodule
