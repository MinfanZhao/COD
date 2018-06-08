`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 12:41:35
// Design Name: 
// Module Name: id
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


module id(

	input 								rst,
	input [31:0]						pc_i,
	input [31:0]       		  		 	inst,

	input 								ex_wreg_i,
	input [31:0]						ex_wdata_i,
	input [31:0]       					ex_wd_i,
		
	input 								mem_wreg_i,
	input [31:0]						mem_wdata_i,
	input [31:0]       					mem_wd_i,
	
	input [31:0]          				reg1_data_i,
	input [31:0]           				reg2_data_i,
		
	input  								last_branch,
	input [7:0]							ex_aluop_i,

	output reg                    		reg1_read_o,
	output reg                    		reg2_read_o,     
	output reg[31:0]       				reg1_addr_o,
	output reg[31:0]       				reg2_addr_o, 	      
	
	output reg[7:0]         			aluop_o,
	output reg[2:0]       				alusel_o,
	output reg[31:0]           			reg1_o,
	output reg[31:0]           			reg2_o,
	output reg[31:0]       				wd_o,
	output reg                    		wreg_o,
	output reg 							branch,
	output reg [31:0]					branch_addr,
	output [31:0] 						this_inst,
	output 								stall_id
);
	
	reg stall_reg1;
	reg stall_reg2;
	wire [31:0] inst_i = (last_branch)? 32'd0: inst;
	wire [5:0] op = inst_i[31:26];
	wire [4:0] op2 = inst_i[10:6];
	wire [5:0] op3 = inst_i[5:0];
	wire [4:0] op4 = inst_i[20:16];
	reg[31:0]	imm;
	reg instvalid;
	wire [31:0] immsll = {{14{inst_i[15]}},inst_i[15:0],2'b00};
	wire [31:0] pc_4 = pc_i + 32'd4; 
	assign this_inst = inst;
  
	always @ (*) begin	
		if (~rst) begin
			aluop_o <= 8'd0;
			alusel_o <= 3'd0;
			wd_o <= 32'd0;
			wreg_o <= 1'd0;
			instvalid <= 1'd0;
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= 32'd0;
			reg2_addr_o <= 32'd0;
			imm <= 32'h0;	
			branch_addr <= 32'd0;
			branch <= 1'd0;
	  end else begin
			aluop_o <= 8'd0;
			alusel_o <= 3'd0;
			wd_o <= inst_i[15:11];
			wreg_o <= 1'd0;
			instvalid <= 1'b1;	   
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= inst_i[25:21];
			reg2_addr_o <= inst_i[20:16];		
			imm <= 32'd0;
			branch_addr <= 32'd0;
			branch <= 1'd0;
		  case (op)
		    `SPECIAL_INST:		begin
		    	case (op2)
		    		5'b00000:			begin
		    			case (op3)
		    				`OR:	begin
		    					wreg_o <= 1'd1;		aluop_o <= `OR_OP;
		  						alusel_o <= `RES_LOGIC; 	reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end  
		    				`AND:	begin
		    					wreg_o <= 1'd1;		aluop_o <= `AND_OP;
		  						alusel_o <= `RES_LOGIC;	  reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;	
		  						instvalid <= 1'd0;	
								end  	
		    				`XOR:	begin
		    					wreg_o <= 1'd1;		aluop_o <= `XOR_OP;
		  						alusel_o <= `RES_LOGIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;	
		  						instvalid <= 1'd0;	
								end  				
		    				`NOR:	begin
		    					wreg_o <= 1'd1;		aluop_o <= `NOR_OP;
		  						alusel_o <= `RES_LOGIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;	
		  						instvalid <= 1'd0;	
								end 
							`SLLV: begin
								wreg_o <= 1'd1;		aluop_o <= `SLL_OP;
		  						alusel_o <= `RES_SHIFT;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end 
							`SRLV: begin
								wreg_o <= 1'd1;		aluop_o <= `SRL_OP;
		  						alusel_o <= `RES_SHIFT;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end 					
							`SRAV: begin
								wreg_o <= 1'd1;		aluop_o <= `SRA_OP;
		  						alusel_o <= `RES_SHIFT;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;			
		  						end
							`SLT: begin
								wreg_o <= 1'd1;		aluop_o <= `SLT_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`SLTU: begin
								wreg_o <= 1'd1;		aluop_o <= `SLTU_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`ADD:
								begin
									wreg_o <= 1'd1;
									aluop_o <= `ADD_OP;
									alusel_o <= `RES_ARITHMETIC;
									reg1_read_o <= 1'd1;
									reg2_read_o <= 1'd1;
									instvalid <= 1'd0;
								end
							`ADDU: begin
								wreg_o <= 1'd1;		aluop_o <= `ADDU_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`SLT: begin
								wreg_o <= 1'd1;		aluop_o <= `SLT_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`SLTU: begin
								wreg_o <= 1'd1;		aluop_o <= `SLTU_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`SUB: begin
								wreg_o <= 1'd1;		aluop_o <= `SUB_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`SUBU: begin
								wreg_o <= 1'd1;		aluop_o <= `SUBU_OP;
		  						alusel_o <= `RES_ARITHMETIC;		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  						instvalid <= 1'd0;	
								end
							`JR: begin
								wreg_o <= 1'd0;		
								aluop_o <= `JR_OP;
		  						alusel_o <= `RES_JUMP_BRANCH;   
								reg1_read_o <= 1'b1;	
								reg2_read_o <= 1'b0;
		  						branch_addr <= reg1_o;
			            	branch <= 1'd1;
								instvalid <= 1'd0;	
								end
						    default:	begin
						    end
						  endcase
						 end
						default: begin
						end
					endcase	
					end									  
		  	`ORI:			begin                       
		  		wreg_o <= 1'd1;		aluop_o <= `OR_OP;
		  		alusel_o <= `RES_LOGIC; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
				imm <= {16'h0, inst_i[15:0]};		wd_o <= inst_i[20:16];
				instvalid <= 1'd0;	
		  	end
		  	`ANDI:			begin
		  		wreg_o <= 1'd1;		aluop_o <= `AND_OP;
		  		alusel_o <= `RES_LOGIC;	reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
				imm <= {16'h0, inst_i[15:0]};		wd_o <= inst_i[20:16];		  	
				instvalid <= 1'd0;	
				end	 	
		  	`XORI:			begin
		  		wreg_o <= 1'd1;		aluop_o <= `XOR_OP;
		  		alusel_o <= `RES_LOGIC;	reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
				imm <= {16'h0, inst_i[15:0]};		wd_o <= inst_i[20:16];		  	
				instvalid <= 1'd0;	
				end	 		
		  	`LUI:			begin
		  		wreg_o <= 1'd1;		aluop_o <= `OR_OP;
		  		alusel_o <= `RES_LOGIC; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
				imm <= {inst_i[15:0], 16'h0};		wd_o <= inst_i[20:16];		  	
				instvalid <= 1'd0;	
				instvalid <= 1'd0;	
				end
			`ADDI:			begin
		  		wreg_o <= 1'd1;		aluop_o <= `ADDI_OP;
		  		alusel_o <= `RES_ARITHMETIC; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
					imm <= {{16{inst_i[15]}}, inst_i[15:0]};		wd_o <= inst_i[20:16];		  	
					instvalid <= 1'd0;	
				end
			`ADDIU:			begin
		  		wreg_o <= 1'd1;		aluop_o <= `ADDIU_OP;
		  		alusel_o <= `RES_ARITHMETIC; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
					imm <= {{16{inst_i[15]}}, inst_i[15:0]};		wd_o <= inst_i[20:16];		  	
					instvalid <= 1'd0;	
				end
			`J:			begin
		  		wreg_o <= 1'd0;		
				aluop_o <= `J_OP;
		  		alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b0;	reg2_read_o <= 1'b0;
			    branch_addr <= {pc_4[31:28], inst_i[25:0], 2'b00};
			    branch <= 1'd1;	
			    instvalid <= 1'd0;
				 end
			 `BEQ:			begin
		  		wreg_o <= 1'd0;		aluop_o <= `BEQ_OP;
		  		alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  		instvalid <= 1'd0;	
		  		if(reg1_o == reg2_o) begin
			    	branch_addr <= pc_4 + immsll;
			    	branch <= 1'd1;  	
			    end
				end
			`BGTZ:			begin
		  		wreg_o <= 1'd0;		aluop_o <= `BGTZ_OP;
		  		alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;
		  		instvalid <= 1'd0;	
		  		if((reg1_o[31] == 1'b0) && (reg1_o != 32'd0)) begin
			    	branch_addr<= pc_4 + immsll;
			    	branch <= 1'd1;
			    end
				end
			`BLEZ:			begin
		  		wreg_o <= 1'd0;		aluop_o <= `BLEZ_OP;
		  		alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;
		  		instvalid <= 1'd0;	
		  		if((reg1_o[31] == 1'b1) || (reg1_o == 32'd0)) begin
			    	branch_addr <= pc_4 + immsll;
			    	branch <= 1'd1;	  	
			    end
				end
			`BNE:			begin
		  		wreg_o <= 1'd0;		aluop_o <= `BLEZ_OP;
		  		alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1;
		  		instvalid <= 1'd0;	
		  		if(reg1_o != reg2_o) begin
			    	branch_addr <= pc_4 + immsll;
			    	branch <= 1'd1;		  	
			    end
				end
			`LW:			begin
		  		wreg_o <= 1'd1;		aluop_o <= `LW_OP;
		  		alusel_o <= `RES_LOAD_STORE; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
					wd_o <= inst_i[20:16]; instvalid <= 1'd0;	
				end
			`SW:			begin
		  		wreg_o <= 1'd0;		aluop_o <= `SW_OP;
		  		reg1_read_o <= 1'b1;	reg2_read_o <= 1'b1; instvalid <= 1'd0;	
		  		alusel_o <= `RES_LOAD_STORE; 
				end
			`REGIMM_INST:		begin
					case (op4)
						`BGEZ:	begin
							wreg_o <= 1'd0;		aluop_o <= `BGEZ_OP;
		  				alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;
		  				instvalid <= 1'd0;	
		  				if(reg1_o[31] == 1'b0) begin
			    			branch_addr <= pc_4 + immsll;
			    			branch <= 1'd1;  	
			   			end
						end
						`BLTZ:		begin
						  wreg_o <= 1'd0;		aluop_o <= `BLTZ_OP;
		  				alusel_o <= `RES_JUMP_BRANCH; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;
		  				instvalid <= 1'd0;	
		  				if(reg1_o[31] == 1'b1) begin
			    			branch_addr <= pc_4 + immsll;
			    			branch <= 1'd1; 	
			   			end
						end
						default:	begin
						end
					endcase
				end				
		    default:			begin
		    end
		  endcase		  //case op
		  
		  if (inst_i[31:21] == 11'b00000000000) begin
		  	if (op3 == `SLL) begin
		  			wreg_o <= 1'd1;		aluop_o <= `SLL_OP;
		  			alusel_o <= `RES_SHIFT; reg1_read_o <= 1'b0;	reg2_read_o <= 1'b1;	  	
					imm[4:0] <= inst_i[10:6];		wd_o <= inst_i[15:11];
					instvalid <= 1'd0;	
				end else if ( op3 == `SRL ) begin
		  			wreg_o <= 1'd1;		aluop_o <= `SRL_OP;
		  			alusel_o <= `RES_SHIFT; reg1_read_o <= 1'b0;	reg2_read_o <= 1'b1;	  	
					imm[4:0] <= inst_i[10:6];		wd_o <= inst_i[15:11];
					instvalid <= 1'd0;	
				end else if ( op3 == `SRA ) begin
		  			wreg_o <= 1'd1;		aluop_o <= `SRA_OP;
		  			alusel_o <= `RES_SHIFT; reg1_read_o <= 1'b0;	reg2_read_o <= 1'b1;	  	
					imm[4:0] <= inst_i[10:6];		wd_o <= inst_i[15:11];
					instvalid <= 1'd0;	
				end
			end		  
		  
		end      
	end         
	

	always @ (*) begin
	stall_reg1 <= 1'd0;
		if(~rst) begin
			reg1_o <= 32'd0;		
		end 
		else if (ex_aluop_i == `LW_OP && ex_wd_i == reg1_addr_o && reg1_read_o == 1'b1)
			begin
				stall_reg1 <= 1'd1;
			end
		else if((reg1_read_o == 1'b1) && (ex_wreg_i == 1'b1) 
								&& (ex_wd_i == reg1_addr_o)) begin
			reg1_o <= ex_wdata_i; 
		end else if((reg1_read_o == 1'b1) && (mem_wreg_i == 1'b1) 
								&& (mem_wd_i == reg1_addr_o)) begin
			reg1_o <= mem_wdata_i; 			
	  end else if(reg1_read_o == 1'b1) begin
	  	reg1_o <= reg1_data_i;
	  end else if(reg1_read_o == 1'b0) begin
	  	reg1_o <= imm;
	  end else begin
	    reg1_o <= 32'd0;
	  end
	end
	
	always @ (*) begin
	stall_reg2 <= 1'd0;
		if(~rst) begin
			reg2_o <= 32'd0;
		end 
		else if (ex_aluop_i == `LW_OP && ex_wd_i == reg2_addr_o && reg2_read_o == 1'b1)
			begin
				stall_reg2 <= 1'd1;
			end
		else if((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1) 
								&& (ex_wd_i == reg2_addr_o)) begin
			reg2_o <= ex_wdata_i; 
		end else if((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1) 
								&& (mem_wd_i == reg2_addr_o)) begin
			reg2_o <= mem_wdata_i;			
	  end else if(reg2_read_o == 1'b1) begin
	  	reg2_o <= reg2_data_i;
	  end else if(reg2_read_o == 1'b0) begin
	  	reg2_o <= imm;
	  end else begin
	    reg2_o <= 32'd0;
	  end
	end
	assign stall_id = stall_reg1 | stall_reg2;

endmodule
