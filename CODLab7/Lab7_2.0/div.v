`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:07 11/10/2016 
// Design Name: 
// Module Name:    div 
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
module div(
input clk,
output reg [3:0] sel = 4'b1110,
output reg page = 1'd1
    );
reg [16:0] counter;
reg [28:0] count;

always@(posedge clk)
begin
	if(counter < 17'd99_999)
		counter <= counter +17'b1;
	else
		counter <= 0;
end

always@(posedge clk)
begin
	if(count < 29'd10_0000_000)
		count <= count +29'b1;
	else
		count <= 0;
end

always@(posedge clk)
begin
	if(page && count == 29'd10_0000_000)
		page <= 1'd0;
	else if (~page && count == 29'd10_0000_000)
		page <= 1'd1;
	else
		page <= page;
end

always@(posedge clk)
begin
	if(counter == 17'd99_999)
		begin
		case(sel)
			4'b1110: sel <= 4'b1101;
			4'b1101: sel <= 4'b1011;
			4'b1011: sel <= 4'b0111;
			4'b0111: sel <= 4'b1110;
			default: sel <= 4'b1110;
		endcase
		end
	else
		sel <= sel;
end
endmodule
