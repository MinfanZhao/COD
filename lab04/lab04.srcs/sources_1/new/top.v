`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/19 19:13:44
// Design Name: 
// Module Name: top
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



module top(
    input clk,
    input rst_n
    );
    wire [7:0]read;
    wire [7:0]write;
    wire [31:0]out1;
    wire [31:0]out2;
    wire [31:0]Din;
    wire [31:0]read_data;
    wire wen;
    wire [31:0]read_data_ram;
    wire [7:0]read_ram;
    wire [7:0]write_reg;
    wire wen_ram;
    wire [4:0]alu_op;
     control control1(
     .clk (clk),
     .rst_n (rst_n),
     .out1 (out1),
     .out2 (out2),
      .wena (wen),
     .write (write),
     .write_reg (write_reg),
     .alu_op (alu_op),
     .read_ram (read_ram),
     .read_data_ram (read_data_ram),
     .wen_ram (wen_ram)
     );
     regfile  regfile1(
           .clk (clk),
           .rst_n (rst_n),
           .rAddr (read),
           .wAddr (write_reg),
           .wDin (read_data_ram),
           .rDout (read_data),
           .wEna (wen)
           );
     ALU alu(
     .alu_a (out1),
     .alu_b (out2),
     .alu_op (alu_op),
     .alu_out (Din)
     );
     blk_mem_gen_0 ram1(
      .clka (clk),
        .ena  (wen_ram),
        .wea  (wen_ram),
        .addra (write),
        .dina  (Din),
        .clkb  (clk),
        .enb (1),
        .addrb (read_ram),
        .doutb (read_data_ram)
     );
endmodule

