`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 16:33:58
// Design Name: 
// Module Name: inc
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


module _inc(
input clk,
input rst_n,
input CLK,
input [15:0]data_in,
output reg [15:0]data_c,
output reg wen_c,
output reg [3:0]addr_c,
output reg [3:0]addr_b
    );
    reg [3:0]count;
    reg en;
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
    begin
    count<=0;
    en=0;
    end
    else
    begin
        if(CLK)
             en=1;
        if(count==4'b1111)
             begin
             count<=0;
             en<=0;
             end
        else
            if(en==1)
             begin
                count<=count+1'b1;
             end
    end
    
    always@(*)
    if(en==1)
    begin
    addr_b=count;
    wen_c=1;
    data_c=data_in+1'b1;
    addr_c=addr_b;
    end
    
endmodule
