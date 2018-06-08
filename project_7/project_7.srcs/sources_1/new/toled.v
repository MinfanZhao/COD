`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 16:31:51
// Design Name: 
// Module Name: toled
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


module toled(
input [3:0] state,
output reg led
    );
    always@(*)
    case(state)
    4'b0100:led=1;
    default:led=0;
    endcase
endmodule
