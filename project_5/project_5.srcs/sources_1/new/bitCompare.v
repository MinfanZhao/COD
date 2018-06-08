`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 18:03:10
// Design Name: 
// Module Name: bitCompare
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


module bitCompare(
input a,
input b,
input ib,
input ie,
input is,
output ob,
output oe,
output os
    );
    assign ob=ib|(ie&(a>b));
    assign oe=ie&(a==b);
    assign os=is|(ie&(a<b));
    
endmodule
