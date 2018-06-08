`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/11 23:16:16
// Design Name: 
// Module Name: test
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


module test(

    );
    reg CLK;
    reg BTNC;
    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;
    wire VGA_HS;
    wire VGA_VS;
    
    top test(
    .CLK50MHZ (CLK),        //时钟信号
                                           .BTNC (BTNC),                       //复位信号
                                           .VGA_R (VGA_R),
                                           .VGA_G (VGA_G),
                                           .VGA_B (VGA_B),
                                                         //VGA工作时钟
                                           .VGA_HS (VGA_HS),
                                           .VGA_VS (VGA_VS)  
                                           );
      always #10 CLK=~CLK;
      initial 
      begin
      CLK=0;
      BTNC=1;
      end
endmodule
