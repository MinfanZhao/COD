`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 18:01:03
// Design Name: 
// Module Name: lab03
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


module lab03(
input [7:0]SW,
output [2:0]LED
    );
    wire big1,equal1,sm1;
    wire big2,equal2,sm2;
    wire big3,equal3,sm3;
    bitCompare com1(SW[7],SW[3],0,1,0,big1,equal1,sm1);
    bitCompare com2(SW[6],SW[2],big1,equal1,sm1,big2,equal2,sm2);
    bitCompare com3(SW[5],SW[1],big2,equal2,sm2,big3,equal3,sm3);
    bitCompare com4(SW[4],SW[0],big3,equal3,sm3,LED[2],LED[1],LED[0]);
   /* if(big==1)
    begin
    assign LED[2]=1;
    assign LED[1]=0;
    assign LED[0]=0;
    end*/
    
endmodule
