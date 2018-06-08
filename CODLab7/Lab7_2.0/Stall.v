`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:18 05/24/2017 
// Design Name: 
// Module Name:    Stall 
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
module Stall(
input rst,
input stall_id,
output reg [5:0] stall
    );
always@(*)
begin
	if(~rst)
		begin
			stall <= 6'b000000;
		end
	else if(stall_id)
		begin
			stall <= 6'b000111;
		end
	else
		begin
			stall <= 6'b000000;
		end
end

endmodule
