`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/07 18:37:33
// Design Name: 
// Module Name: control
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


module control(
input clk,
input rst_n,
input [31:0]read_data,
output reg [31:0]out1,
output reg [31:0]out2,
output reg [5:0]read,
output reg wena,
output reg [5:0]write
    );
    reg [1:0]count;
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
    begin 
    count<=0;
    read<=0;
    wena<=0;
    out1<=0;
    out2<=0;
    end
    else if(read<63)
    case(count)
    2'h0:
    begin
    out1<=read_data;
    read<=read+1;
    count<=count+1;
    wena<=0;
    end
    2'h1:
    begin
    out2<=read_data;
    write<=read+1;
    count<=count+1;
    wena<=0;
    end
    2'h2:
    begin
    wena<=1;
    count<=0;
    end
    endcase
endmodule
