`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 16:33:45
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
input [3:0]addr_a,
input [3:0]addr_b,
input [3:0]addr_c,
input [15:0]data_c,
input wen_c,
output [15:0]q_a,
output [15:0]q_b
    );
    reg [15:0]regfile[0:15];
    
    assign q_a=regfile[addr_a];
    assign q_b=regfile[addr_b];
    
    always@( negedge rst_n or posedge clk)
    if(!rst_n)
    begin 
        regfile[0]=16'h0000;
        regfile[1]=16'h1100;                      
        regfile[2]=16'h2200;
        regfile[3]=16'h3300;
        regfile[4]=16'h4400;
        regfile[5]=16'h5500;
        regfile[6]=16'h6600;
        regfile[7]=16'h7700;
        regfile[8]=16'h8800;
        regfile[9]=16'h9900;
        regfile[10]=16'hAA00;
        regfile[11]=16'hBB00;
        regfile[12]=16'hCC00;
        regfile[13]=16'hDD00;
        regfile[14]=16'hEE00;
        regfile[15]=16'hFF00;
    end
    else if(wen_c)
    regfile[addr_c]=data_c;
     
   
                                 
endmodule
