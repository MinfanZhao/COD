`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:43:35
// Design Name: 
// Module Name: ex_mem
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

module ex_mem(

	input 							clk,
	input 							rst,
	input [5:0]							stall,
	
	
	input [31:0]     				ex_wd,
	input                    	 	ex_wreg,
	input [31:0]					ex_wdata, 	
	input [7:0]							ex_aluop,
	input [31:0] 						ex_mem_addr,
	input [31:0]						ex_reg2,
	
	output reg[31:0]    				mem_wd,
	output reg                  	 	mem_wreg,
	output reg[31:0]					mem_wdata,
	output reg [7:0]					mem_aluop,
	output reg [31:0]					mem_mem_addr,
	output reg [31:0]					mem_reg2
	
);


	always @ (posedge clk) begin
		if(~rst) 
		begin
			mem_wd <= 32'd0;
			mem_wreg <= 31'd0;
		 	mem_wdata <= 31'd0;	
		  	mem_aluop <= 8'd0;
		  	mem_mem_addr <= 32'd0;
		  	mem_reg2 <= 32'd0;
		end
		else if (stall[3] == 1'd1 && stall[4]==1'd0) 
			begin
				mem_wd <= 32'd0;
				mem_wreg <= 31'd0;
		  		mem_wdata <= 31'd0;	
		  		mem_aluop <= 8'd0;
		  		mem_mem_addr <= 32'd0;
		  		mem_reg2 <= 32'd0;
			end
		else 
		begin
			mem_wd <= ex_wd;
			mem_wreg <= ex_wreg;
			mem_wdata <= ex_wdata;	
			mem_aluop <= ex_aluop;
			mem_mem_addr <= ex_mem_addr;
			mem_reg2 <= ex_reg2;
		end  
	end     
			

endmodule
