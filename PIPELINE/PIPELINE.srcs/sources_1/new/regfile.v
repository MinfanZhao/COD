`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:42:09
// Design Name: 
// Module Name: regfile
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


module regfile(

	input										clk,
	input 										rst,
	
	input 										we,
	input [31:0]								waddr,
	input [31:0]								wdata,
	
	input 										re1,
	input [31:0]			 					raddr1,
	output reg [31:0]           			rdata1,
	
	input 										re2,
	input [31:0]			  					raddr2,
	output reg [31:0]           			rdata2
	
);

	reg[31:0]  regs[0:31];
	/*initial
		begin
			$readmemh("reg_file.txt",regs);
		end
	always @ (posedge clk) begin
		if (rst) 
			begin
				if((we == 1'd1) && (waddr != 5'h0)) 
				begin
					regs[waddr] <= wdata;
				end
			end
		else
			begin
				$readmemh("reg_file.txt",regs);
			end
	end*/
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			// reset
			regs[0]<=0;
    regs[1]<=0;
    regs[2]<=0;
    regs[3]<=0;
    regs[4]<=0;
    regs[5]<=0;
    regs[6]<=0;
    regs[7]<=0;
    regs[8]<=0;
    regs[9]<=0;
    regs[10]<=0;
    regs[11]<=0;
    regs[12]<=0;
    regs[13]<=0;
    regs[14]<=0;
    regs[15]<=0;
    regs[16]<=0;
    regs[17]<=0;
    regs[18]<=0;
    regs[19]<=0;
    regs[20]<=0;
    regs[21]<=0;
    regs[22]<=0;
    regs[23]<=0;
    regs[24]<=0;
    regs[25]<=0;
    regs[26]<=0;
    regs[27]<=0;
    regs[28]<=0;
    regs[29]<=0;
    regs[30]<=0;
    regs[31]<=0;
		end
		else begin
			if((we == 1'd1) && (waddr != 5'h0)) 
				begin
					regs[waddr] <= wdata;
				end
		end
	end
	
	always @ (*) begin
		if(~rst) begin
			  rdata1 <= 32'd0;
	  	end else if(raddr1 == 5'h0) begin
	  		rdata1 <= 32'd0;
	  	end else if((raddr1 == waddr) && (we == 1'd1) && (re1 == 1'd1)) begin
	  	  rdata1 <= wdata;
	  	end else if(re1 == 1'd1) begin
	      rdata1 <= regs[raddr1];
	  	end else begin
	      rdata1 <= 32'd0;
	  	end
	end

	always @ (*) begin
		if(~rst) begin
			  rdata2 <= 32'd0;
	  end else if(raddr2 == 5'h0) begin
	  		rdata2 <= 32'd0;
	  end else if((raddr2 == waddr) && (we == 1'd1) && (re2 == 1'd1)) begin
	  	  rdata2 <= wdata;
	  end else if(re2 == 1'd1) begin
	      rdata2 <= regs[raddr2];
	  end else begin
	      rdata2 <= 32'd0;
	  end
	end

endmodule
