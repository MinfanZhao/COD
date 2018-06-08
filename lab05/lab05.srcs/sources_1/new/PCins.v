`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/26 18:49:01
// Design Name: 
// Module Name: PCins
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


module PCins(
input clk,
input [31:0] PCdata,
input JUMP,
input [31:0]IR,
output reg INIT,
output reg [31:0] PC 

    );
    reg [31:0]data;
    always@(posedge clk)
    if(JUMP)
    begin
      PC=PC+1;
      PC={PC[31:28]+IR[25:0]+2'b00}; 
      INIT<=1;
    end
    else if(!JUMP)
    begin
        PC<=PCdata;
        INIT<=1;
    end
    else 
    begin
         PC<=0;
         INIT<=0;
    end
endmodule
