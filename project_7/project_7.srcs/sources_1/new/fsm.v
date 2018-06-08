`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 00:17:48
// Design Name: 
// Module Name: fsm
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


module fsm(
   input SW,
   input en,
   input clk,
   input rst_n,
   output reg led
    );
   
   reg [3:0] curr_state;
   reg [3:0] next_state;
   
    always@(posedge clk or negedge rst_n)
       begin
       if(!rst_n)
           curr_state <= 4'b0000;
       else
           curr_state <= next_state;
       end
   
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

        always@(*)
            case(next_state)
            4'b0100:led=1;
             default:led=0;
            endcase
endmodule
