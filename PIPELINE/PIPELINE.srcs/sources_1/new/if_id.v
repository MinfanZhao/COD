`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:41:00
// Design Name: 
// Module Name: if_id
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

module if_id(
input clk,
input rst,
input [5:0] stall,
input [31:0] if_pc,
input [31:0] if_inst,
input branch,
output reg [31:0] id_pc,
output reg [31:0] id_inst,
output reg last_branch
    );

always@(posedge clk)
begin
	if(~rst)
		begin
			id_pc <= 32'd0;
			id_inst <= 32'd0;
			last_branch<= 1'd0;
		end
	else if(stall[1] == 1'd1 && stall[2] == 1'd0) 
		begin
			id_pc <= 32'd0;
			id_inst <= 32'd0;
			last_branch<= 1'd0;	
		end
	else if (stall[1] == 1'd1)
		begin
			id_pc <= id_pc;
			id_inst <= id_inst;
			last_branch<= last_branch;
		end
	else
		begin
			id_pc <= if_pc;
			id_inst <= if_inst;
			last_branch <= branch;
		end
end

endmodule

