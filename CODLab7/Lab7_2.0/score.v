`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:24 12/02/2016 
// Design Name: 
// Module Name:    score 
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
module score(
input clk,
input rst,
input [1:0] win,
input start,
output reg [3:0] sel,
output reg [7:0] data,
output [1:0] Winner
    );

reg [1:0] win1= 0;
reg [1:0] win2=0;
reg [7:0] scorea = 0;
reg [7:0] scoreb = 0;
always@(posedge clk or posedge rst)
begin
	if(rst)
		begin
			win1 <= 0;
			win2 <= 0;
		end
	else 
		begin
			win1 <= win;
			win2<= win1;
		end
end

assign Winner = (scorea > scoreb)? 2'd1: ((scorea == scoreb)? 2'd3: 2'd2); 

always@(posedge clk or posedge rst)
begin
	if(rst)
		begin
			scorea <= 0;
			scoreb <= 0;
		end
	else if(!start)
		begin
			scorea <= 0;
			scoreb <= 0;
		end
	else if(start && win2 == 2'd0 && win1 == 2'd1)
		begin
			if(scorea[3:0]==4'd9)
				begin
				scorea[3:0] <= 4'd0;
				scorea[7:4] <= scorea[7:4] +4'd1;
				end
			else
				begin
					scorea[3:0] <= scorea[3:0] +4'd1;
				end
		end
	else if(start && win2 == 2'd0&&win1==2'd2)
		begin
			if(scoreb[3:0]==4'd9)
				begin
				scoreb[3:0] <= 4'd0;
				scoreb[7:4] <= scoreb[7:4] +4'd1;
				end
			else
				begin
					scoreb[3:0] <= scoreb[3:0] +4'd1;
				end
		end
end

reg [16:0] counter = 17'd0;
always@(posedge clk)
begin
	if(counter < 17'd99_999)
		counter <= counter +17'b1;
	else
		counter <= 17'd0;
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



always@(*)
begin
	if(sel == 4'b1110)
		case(scoreb[3:0])
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
	else if(sel == 4'b1101)
		case(scoreb[7:4])
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
	else if(sel == 4'b1011)
		case(scorea[3:0])
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
	else
		case(scorea[7:4])
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
