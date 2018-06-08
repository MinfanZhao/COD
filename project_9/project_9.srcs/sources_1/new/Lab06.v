`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 16:25:18
// Design Name: 
// Module Name: Lab06
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


module Lab06(
input CLK50MHZ,
input [3:0]SW,
input BTNC,
output [7:0]SEG,
output [2:0]AN,
output [15:0]LED
    );
   // wire CLK;
    wire [3:0]ADDR_B;
    wire [3:0]ADDR_C;
    wire [15:0]DATA_C;
    wire WEN_C;
    wire [15:0]Q_A;
    wire [15:0]Q_B;
    
    seg my_seg(
    .clk (CLK50MHZ),
    .rst_n (BTNC),
    .q_a (Q_A),
    .SEG (SEG),
    .data (AN),
   .LED (LED)
    );
    
    _inc my_inc (
    .clk (CLK50MHZ),
    .rst_n (BTNC),
    .CLK (LED),
    .data_in (Q_B),
    .data_c (DATA_C),
    .wen_c (WEN_C),
    .addr_c (ADDR_C),
    .addr_b (ADDR_B)
    );
    
    regfile my_regfile(
    .clk (CLK50MHZ),
    .rst_n (BTNC),
    .addr_a (SW),
    .addr_b (ADDR_B),
    .addr_c (ADDR_C),
    .data_c (DATA_C),
    .wen_c (WEN_C),
    .q_a (Q_A),
    .q_b (Q_B)
    );
    
    
endmodule
