`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:42:46
// Design Name: 
// Module Name: id_ex
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

module id_ex(

	input  					clk,
	input  					rst,
	input [5:0] 				stall,

	
	input  [7:0]         	id_aluop,
	input  [2:0]        	id_alusel,
	input  [31:0]           id_reg1,
	input  [31:0]           id_reg2,
	input  [31:0]      		id_wd,
	input                   id_wreg,	
	input   [31:0]			id_inst,

	output reg[7:0]       ex_aluop,
	output reg[2:0]      ex_alusel,
	output reg[31:0]           	ex_reg1,
	output reg[31:0]          	ex_reg2,
	output reg[31:0]       		ex_wd,
	output reg                  ex_wreg,
	output reg [31:0]			ex_inst
	
);

	always @ (posedge clk) begin
		if (~rst) begin
			ex_aluop <= `NOP_OP;
			ex_alusel <= `RES_NOP;
			ex_reg1 <= 32'd0;
			ex_reg2 <= 32'd0;
			ex_wd <= 32'd0;
			ex_wreg <= 1'd0;
			ex_inst <= 32'd0;
		end else if(stall[2] == 1'd1 && stall[3] == 1'd0) begin
			ex_aluop <= `NOP_OP;
			ex_alusel <= `RES_NOP;
			ex_reg1 <= 32'd0;
			ex_reg2 <= 32'd0;
			ex_wd <= 32'd0;
			ex_wreg <= 1'd0;
			ex_inst <= 32'd0;			
		end else if(stall[2] == 1'd0) begin		
			ex_aluop <= id_aluop;
			ex_alusel <= id_alusel;
			ex_reg1 <= id_reg1;
			ex_reg2 <= id_reg2;
			ex_wd <= id_wd;
			ex_wreg <= id_wreg;	
			ex_inst <= id_inst;				
		end
	end
	
endmodule

