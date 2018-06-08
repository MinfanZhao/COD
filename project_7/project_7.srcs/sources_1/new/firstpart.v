`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 15:24:08
// Design Name: 
// Module Name: firstpart
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


module firstpart(
input clk,
input rst_n,
input [3:0] next_state,
output reg [3:0] curr_state
    );
    always@(posedge clk or negedge rst_n)
    begin
    if(!rst_n)
        curr_state <= 4'b0000;
    else
        curr_state <= next_state;
    end
endmodule
