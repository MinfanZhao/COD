`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:20 05/22/2017 
// Design Name: 
// Module Name:    regfile 
// Project Name: 
// Target Devices: 
// Tool versions: 
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

module mem(

	input 							rst,
	
	input  [31:0]      				wd_i,
	input                    		wreg_i,
	input  [31:0]					wdata_i,
	input  [7:0] 					alu_op,
	input  [31:0] 					mem_data_i,
	input  [31:0] 					mem_addr_i,
	input  [31:0]					mem_reg2,
	output reg [31:0]      			wd_o,
	output reg                   	wreg_o,
	output reg [31:0]				wdata_o,
	output reg [31:0]          		mem_addr_o,
	output reg 						mem_we,
	output reg [31:0]          		mem_data_o
);

	
	always @ (*) begin
		if(~rst) begin
			wd_o <= 32'd0;
			wreg_o <= 1'd0;
		  	wdata_o <= 32'd0;
		  	mem_addr_o <= 32'd0;
		  	mem_we <= 1'd0;
		  	mem_data_o <= 32'd0;
		end else begin
		 	 wd_o <= wd_i;
			wreg_o <= wreg_i;
			wdata_o <= wdata_i;
			mem_we <= 1'd0;
			mem_addr_o <= 32'd0;
			case(alu_op)
				`LW_OP:		begin
					mem_addr_o <= mem_addr_i;
					mem_we <= 1'd0;
					wdata_o <= mem_data_i;
				end
				`SW_OP:		begin
					mem_addr_o <= mem_addr_i;
					mem_we <= 1'd1;
					mem_data_o <= mem_reg2;
				end
			default:
			begin
			end
			endcase
		end   
	end    
			

endmodule