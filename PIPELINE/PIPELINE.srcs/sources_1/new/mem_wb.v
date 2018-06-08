`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:45:04
// Design Name: 
// Module Name: mem_wb
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


`include "Define.v"

module mem_wb(

	input									clk,
	input 									rst,
	input [5:0]								stall,

	input [31:0]      						mem_wd,
	input                    				mem_wreg,
	input [31:0]					 		mem_wdata,

	output reg[31:0]      					wb_wd,
	output reg                   			wb_wreg,
	output reg[31:0]						wb_wdata	       
	
);


	always @ (posedge clk) begin
		if(~rst) begin
			wb_wd <= 32'd0;
			wb_wreg <= 1'd0;
		  wb_wdata <= 32'd0;	
		end
		else if (stall[4] ==1'd1 && stall[5] == 1'd0)
			begin
				wb_wd <= 32'd0;
			wb_wreg <= 1'd0;
		  wb_wdata <= 32'd0;	
			end
		else begin
			wb_wd <= mem_wd;
			wb_wreg <= mem_wreg;
			wb_wdata <= mem_wdata;
		end   
	end      
			

endmodule