`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 15:12:35
// Design Name: 
// Module Name: Lab05
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


module Lab05(
input SW,
input BTNC,
input BTNU,
input CLK50MHZ,
output LED
    );
    wire sw,en;
    /*wire [3:0]NEXT_STATE;
    wire [3:0]CURR_STATE;*/
    creINPUT myinput(
    .SW (SW),
    .store (BTNC),
    .clk (CLK50MHZ),
    .sw (sw),
    .en (en)
    );
  /* firstpart myfirst(
    .clk  (CLK50MHZ),
    .rst_n (BTNU),
    .next_state (NEXT_STATE),
    .curr_state (CURR_STATE)
    );
    secondpart mysecond(
    .curr_state (CURR_STATE),
    .SW (sw),
    .en (en),
    .next_state (NEXT_STATE)
    );
    toled mytoled(
    .state (NEXT_STATE),
    .led (LED)
    );*/
    fsm myfsm(
    .SW (sw),
    .en (en),
     .clk (CLK50MHZ),
     .rst_n (BTNU),
     .led (LED)
    );
endmodule
