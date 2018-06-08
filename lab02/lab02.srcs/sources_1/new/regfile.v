`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/06 20:48:03
// Design Name: 
// Module Name: regfile
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

module regfile(
input clk,
input rst_n,
input [5:0]rAddr,
input [5:0]wAddr,
input [31:0]wDin,
output [31:0]rDout,
input wEna
    );
    reg [31:0]regfiles[0:63];   
    reg [5:0] i;
    always@( negedge rst_n or posedge clk)
    if(!rst_n)
      begin
      regfiles[0]<=2;
      regfiles[1]<=2;
      regfiles[2]<=4;
      end
    else
    if(wEna)
        regfiles[wAddr]<=wDin;
    assign rDout=regfiles[rAddr];                   
endmodule
