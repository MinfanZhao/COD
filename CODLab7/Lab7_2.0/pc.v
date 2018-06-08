`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:25 05/22/2017 
// Design Name: 
// Module Name:    pc 
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
module pc(

	input							clk,
	input 						rst,
	input  [5:0]				stall,
	input 						branch,
	input  [31:0] 				branch_addr,
	output reg [31:0]			pc = 32'd0
	
);

	always @ (posedge clk) begin
		if (~rst) 
			begin
				pc <= 32'h00000000;
			end
		else if (stall[0] == 1'd0) 
		begin
			if(branch == 1'b1)
				begin
					pc <= branch_addr;
				end
			else
				begin
					pc <= pc + 4'd4;
				end
		end
	end
	

endmodule
