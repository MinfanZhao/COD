`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/29 19:12:09
// Design Name: 
// Module Name: main
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


module main(
input   [31:0] alu_a,
input   [31:0] alu_b,
output [31:0]alu_out
    );
   wire [31:0]c;
   wire [31:0]d;
   wire [31:0]e;
    alu alu1(
    .alu_a (alu_a),
    .alu_b (alu_b),
    .alu_op (1),
    .alu_out (c)
    );
    alu alu2(
        .alu_a (alu_b),
        .alu_b (c),
        .alu_op (1),
        .alu_out (d)
        );
        alu alu3(
            .alu_a (c),
            .alu_b (d),
            .alu_op (1),
            .alu_out (e)
            );
            alu alu4(
                .alu_a (d),
                .alu_b (e),
                .alu_op (1),
                .alu_out (alu_out)
                );
endmodule
