`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 15:31:01
// Design Name: 
// Module Name: secondpart
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


module secondpart(
input [3:0] curr_state,
input SW,
input en,
output reg [3:0] next_state
    );
    always@(*)
    begin
    case(curr_state)
    4'b0000: begin
            if(en==0)
            next_state=curr_state;
            else
            next_state=SW?4'b0001:4'b0000;
            end
    4'b0001:begin
             if(en==0)
             next_state=curr_state;
             else
             next_state=SW?4'b0010:4'b0000;
             end
     4'b0010:begin
             if(en==0)
             next_state=curr_state;
             else
             next_state=SW?4'b0010:4'b0011;
             end
     4'b0011:begin
             if(en==0)
             next_state=curr_state;
             else
             next_state=SW?4'b0100:4'b0000;
             end
     4'b0100:begin
             if(en==0)
             next_state=curr_state;
             else
             next_state=SW?4'b0001:4'b0000;
             end    
     default:next_state=4'b0000; 
     endcase
     end       
endmodule
