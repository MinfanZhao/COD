`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/29 19:56:18
// Design Name: 
// Module Name: ALU
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



module ALU(
    input signed  [31:0] alu_a,
    input signed  [31:0] alu_b,
    input  [2:0] alu_op,
    output reg [31:0] alu_out,
    output reg Zero
    );
        parameter     A_OR= 3'h01;    
        parameter    A_ADD= 3'h02;
        parameter    A_SUB= 3'h06; 
        parameter    A_AND= 3'h00;   
        parameter    A_SMALL = 3'h07;   
        parameter    A_POSI= 3'h3;
          always@(*) 
          begin
           case(alu_op)
            A_ADD: alu_out = alu_a+alu_b;
            A_SUB: alu_out = alu_a-alu_b;
            A_AND: alu_out = alu_a &alu_b;
            A_OR:  alu_out = alu_a|alu_b;
           A_SMALL:alu_out = alu_a<alu_b?1:0;
           A_POSI: alu_out= alu_a>0?0:1;
            default: alu_out=0;  
            endcase
          if (alu_out==0)
              Zero=1;
          else
              Zero=0; 
          end
          
endmodule