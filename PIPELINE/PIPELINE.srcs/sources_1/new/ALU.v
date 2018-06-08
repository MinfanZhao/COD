`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:36:04
// Design Name: 
// Module Name: ALU
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

module ex(

	input 					rst,
	
	input [7:0]         	aluop_i,
	input [2:0]        		alusel_i,
	input [31:0]           	reg1_i,
	input [31:0]           	reg2_i,
	input [31:0]       		wd_i,
	input                   wreg_i,
	input  [31:0]			ex_inst,

	
	output reg[31:0]       	wd_o,
	output reg              wreg_o,
	output reg[31:0]		wdata_o,
	output  [7:0] 			aluop_o,
	output  [31:0]			mem_addr_o,
	output  [31:0]			reg2_o
);
	assign reg2_o = reg2_i;
	reg [31:0] logic;
	reg [31:0] shift;
	reg [31:0] math;
	wire [31:0] reg2_i_mux = ((aluop_i == `SUB_OP) || (aluop_i == `SUBU_OP) ||(aluop_i == `SLT_OP) ) ? (~reg2_i)+1 : reg2_i;
	wire [31:0] result_sum = reg1_i + reg2_i_mux;	
	wire [31:0] ov_sum = ((!reg1_i[31] && !reg2_i_mux[31]) && result_sum[31]) || ((reg1_i[31] && reg2_i_mux[31]) && (!result_sum[31])); 
	assign  aluop_o = aluop_i;
	assign mem_addr_o = reg1_i + {{16{ex_inst[15]}},ex_inst[15:0]};
	
	always @ (*) begin
		if(~rst) begin
			logic <= 32'd0;
		end else begin
			case (aluop_i)
				`OR_OP:			begin
					logic <= reg1_i | reg2_i;
				end
				`AND_OP:		begin
					logic <= reg1_i & reg2_i;
				end
				`NOR_OP:		begin
					logic <= ~(reg1_i |reg2_i);
				end
				`XOR_OP:		begin
					logic <= reg1_i ^ reg2_i;
				end
				default:				begin
					logic <= 32'd0;
				end
			endcase
		end    
	end     

	always @ (*) begin
		if(~rst) begin
			shift <= 32'd0;
		end else begin
			case (aluop_i)
				`SLL_OP:			begin
					shift <= reg2_i << reg1_i[4:0] ;
				end
				`SRL_OP:		begin
					shift <= reg2_i >> reg1_i[4:0];
				end
				`SRA_OP:		begin
					shift <= ({32{reg2_i[31]}} << (6'd32-{1'b0, reg1_i[4:0]})) | reg2_i >> reg1_i[4:0];
				end
				default:				begin
					shift <= 32'd0;
				end
			endcase
		end    
	end      	
	always @ (*) begin
		if(~rst) begin
			math <= 32'd0;
		end else begin
			case (aluop_i)
				`ADD_OP, `ADDU_OP, `ADDI_OP, `ADDIU_OP:		begin
					math <= result_sum; 
				end
				`SUB_OP, `SUBU_OP:		begin
					math <= result_sum; 
				end		
				default:				begin
					math <= 32'd0;
				end
			endcase
		end
	end

 always @ (*) begin
	 wd_o <= wd_i;		 	 	
	 if(((aluop_i == `ADD_OP) || (aluop_i == `ADDI_OP) || 
	      (aluop_i == `SUB_OP)) && (ov_sum == 1'b1)) begin
	 	wreg_o <= 1'd0;
	 end else begin
	  wreg_o <= wreg_i;
	 end
	 case ( alusel_i ) 
	 	`RES_LOGIC:		begin
	 		wdata_o <= logic;
	 	end
	 	`RES_SHIFT:		begin
	 		wdata_o <= shift;
	 	end	 	
	 	`RES_ARITHMETIC:	begin
	 		wdata_o <= math;
	 	end
	 	default:					begin
	 		wdata_o <= 32'd0;
	 	end
	 endcase
 end	

endmodule
