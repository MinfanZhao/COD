`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 16:47:04
// Design Name: 
// Module Name: cnt
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


module cnt(
input clk,
input rst_n,
output reg [3:0] cnt
    );
    reg [29:0] count;
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
    count <= 30'h33333333;
    cnt[3:0] = count[29:26];
    end
    else if(count==30'h3fffffff) begin 
    count <= 0;
    cnt[3:0] = count[29:26];
    end
    else begin
    count <=count +1'h1;
    cnt[3:0]<=count[29:26];
    end
endmodule
