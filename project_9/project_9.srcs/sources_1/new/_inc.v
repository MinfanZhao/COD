`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/23 19:09:06
// Design Name: 
// Module Name: _inc
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

module _inc(
input clk,
input rst_n,
input CLK,
input [15:0]data_in,
output reg [15:0]data_c,
output reg wen_c,
output reg [3:0]addr_c,
output reg [3:0]addr_b
    );
   /* reg [24:0]count;
       always@(posedge clk or negedge rst_n)
      begin
       if(!rst_n)
           count<=0;
       else if(count==25'd24999999)
           count<=0;
       else
           count<=count+25'b1;    
       end
 
    always@(posedge clk)
    begin
    if(25'd25000000-count==17)
        addr_b=4'd15;
    else if(25'd25000000-count<=16)
    begin
    addr_b<=25'd25000000-count-2;
    wen_c<=1;
    data_c<=data_in+1'b1;
    addr_c<=25'd25000000-count-1;
    end
    else
    wen_c<=0;
    end*/
    reg [24:0]count;
           always@(posedge clk or negedge rst_n)
          begin
           if(!rst_n)
               count<=0;
           else if(count==25'd24)
               count<=0;
           else
               count<=count+25'b1;    
           end
     
        always@(posedge clk)
        begin
        if(25'd25-count==17)
            addr_b=4'd15;
        else if(25'd25-count<=16)
        begin
        addr_b<=25'd25-count-2;
        wen_c<=1;
        data_c<=data_in+1'b1;
        addr_c<=25'd25-count-1;
        end
        else
        wen_c<=0;
        end
    
endmodule
