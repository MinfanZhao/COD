`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:51:38
// Design Name: 
// Module Name: test
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


module test;

	// Inputs
	reg clk;
	reg rrst;
	reg [7:0] SW;

	// Outputs
	wire [2:0] AN;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	cpu_top uut (
		.CLK50MHZ(clk), 
		.BTNL(rrst), 
		.SW(SW), 
		.AN(AN), 
		.SEG(data)
	);
	always
	begin
		#1;
		clk=~clk;
		rrst=1;
		SW<=SW+1;
	end
	initial begin
		// Initialize Inputs
		/*rrst = 0;
		swi = 0;

		// Wait 100 ns for global reset to finish
		#100;
      swi = 1;
		#100;
		swi = 2;
		#100;
		swi = 3;
		#100;
		swi = 4;
		#100;
		swi = 5;
		// Add stimulus here
		#100;*/
		rrst=0;
		clk=1;
		SW=0;
		#100;

	end
      
endmodule

