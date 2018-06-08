`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/29 19:55:45
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
input [4:0]rAddr1,
input [4:0]rAddr2,
input [4:0]wAddr,
input [31:0]wDin,
output [31:0]rDout1,
output [31:0]rDout2,
input wEna,
input INIT
    );
    reg [31:0]regfiles[0:31]; 
    always@(posedge clk)
    if(INIT)begin
    regfiles[0]<=0;
    regfiles[1]<=0;
    regfiles[2]<=0;
    regfiles[3]<=0;
    regfiles[4]<=0;
    regfiles[5]<=0;
    regfiles[6]<=0;
    regfiles[7]<=0;
    regfiles[8]<=0;
    regfiles[9]<=0;
    regfiles[10]<=0;
    regfiles[11]<=0;
    regfiles[12]<=0;
    regfiles[13]<=0;
    regfiles[14]<=0;
    regfiles[15]<=0;
    regfiles[16]<=0;
    regfiles[17]<=0;
    regfiles[18]<=0;
    regfiles[19]<=0;
    regfiles[20]<=0;
    regfiles[21]<=0;
    regfiles[22]<=0;
    regfiles[23]<=0;
    regfiles[24]<=0;
    regfiles[25]<=0;
    regfiles[26]<=0;
    regfiles[27]<=0;
    regfiles[28]<=0;
    regfiles[29]<=0;
    regfiles[30]<=0;
    regfiles[31]<=0;
    end
    else if(wEna)
        regfiles[wAddr]<=wDin;
    assign rDout1=regfiles[rAddr1];
    assign rDout2=regfiles[rAddr2];                   
endmodule