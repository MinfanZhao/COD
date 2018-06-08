`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/06 21:07:19
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
    input  [4:0] alu_op,
    output reg [31:0] alu_out
    );
        parameter     A_NOP= 5'h00;    
        parameter    A_ADD= 5'h01;
        parameter    A_SUB= 5'h02; 
        parameter    A_AND= 5'h03;   
        parameter    A_OR = 5'h04;   
        parameter    A_XOR= 5'h05;   
        parameter    A_NOR= 5'h06;  
          always@(*) 
           case(alu_op)
            A_NOP: alu_out = 0; 
            A_ADD: alu_out = alu_a+alu_b;
            A_SUB: alu_out = alu_a-alu_b;
            A_AND: alu_out = alu_a &alu_b;
            A_OR:  alu_out = alu_a|alu_b;
            A_XOR: alu_out = alu_a^alu_b;
            A_NOR: alu_out = ~(alu_a|alu_b);  
            default: alu_out=0;   
          endcase
endmodule
