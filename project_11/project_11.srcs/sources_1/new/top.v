`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/11 22:54:00
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
input CLK50MHZ,
input BTNC,
output [3:0] VGA_R,
output [3:0] VGA_G,
output [3:0] VGA_B,
output VGA_HS,
output VGA_VS
    );
    vga myvga(
    .clk (CLK50MHZ),        //时钟信号
                                       .rst_n (BTNC),                       //复位信号
                                       .vga_r (VGA_R),
                                       .vga_g (VGA_G),
                                       .vga_b (VGA_B),
                                                     //VGA工作时钟
                                       .hsync (VGA_HS),
                                       .vsync (VGA_VS)  
                                       );
endmodule
