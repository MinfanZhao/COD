`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:35 10/26/2016 
// Design Name: 
// Module Name:    code 
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
module code(
input [31:0] num,
input page,
input [3:0] sel ,
output reg [7:0]  data
    );

reg [3:0] nnum;

always@(*)
begin
	if(page == 1'b0)
	begin
		case(sel)
					4'b1110: nnum = num[3:0];
					4'b1101: nnum = num[7:4];
					4'b1011: nnum = num[11:8];
					4'b0111: nnum = num[15:12];
					default: begin
					end
			endcase	
	end
	else
		begin
			case(sel)
					4'b1110: nnum = num[19:16];
					4'b1101: nnum = num[23:20];
					4'b1011: nnum = num[27:24];
					4'b0111: nnum = num[31:28];
					default: begin
					end
				endcase	
		end
end

always@(*)
begin
case(nnum)
	4'b0000 : data = 8'b0000_0011;
			4'b0001 : data = 8'b1001_1111;
			4'b0010 : data = 8'b0010_0101; 
			4'b0011 : data = 8'b0000_1101; 
			4'b0100 : data = 8'b1001_1001; 
			4'b0101 : data = 8'b0100_1001; 
			4'b0110 : data = 8'b0100_0001; 
			4'b0111 : data = 8'b0001_1111; 
			4'b1000 : data = 8'b0000_0001; 
			4'b1001 : data = 8'b0000_1001; 
			4'b1010 : data = 8'b0001_0001; 
			4'b1011 : data = 8'b1100_0001; 
			4'b1100 : data = 8'b0110_0011; 
			4'b1101 : data = 8'b1000_0101; 
			4'b1110 : data = 8'b0110_0001; 
			4'b1111 : data = 8'b0111_0001; 
			default: data = 8'b1111_1111;
endcase
end

endmodule
