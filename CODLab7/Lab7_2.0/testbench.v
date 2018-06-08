`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:08:18 05/24/2017
// Design Name:   cpu_top
// Module Name:   D:/Files built by Me/Computer Organization Lab/Lab7_2.0/testbench.v
// Project Name:  Lab7_2.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk;
	reg rrst;
	reg [7:0] swi;

	// Outputs
	wire [3:0] sel;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	cpu_top uut (
		.clk(clk), 
		.rrst(rrst), 
		.swi(swi), 
		.sel(sel), 
		.data(data)
	);
	always
	begin
		#1;
		clk=~clk;
		rrst=0;
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
		rrst=1;
		clk=1;
		#100;

	end
      
endmodule

