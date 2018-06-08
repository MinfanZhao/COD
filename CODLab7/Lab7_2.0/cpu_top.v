`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:03 05/22/2017 
// Design Name: 
// Module Name:    cpu_top 
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
`include "Define.v"
module cpu_top(
input clk,
input rrst,
input [7:0] swi,
output [3:0] sel,
output [7:0] data
    );
	 
	wire rst = ~rrst;
	wire [31:0] pc;
	wire [31:0] id_pc_i;
	wire [31:0] id_inst_i;
	
	wire [7:0] id_aluop_o;
	wire [2:0] id_alusel_o;
	wire [31:0] id_reg1_o;
	wire [31:0] id_reg2_o;
	wire  id_wreg_o;
	wire [31:0] id_wd_o;
	wire [7:0] ex_aluop_i;
	wire [2:0] ex_alusel_i;
	wire [31:0] ex_reg1_i;
	wire [31:0] ex_reg2_i;
	wire  ex_wreg_i;
	wire [31:0] ex_wd_i;
	
	wire  ex_wreg_o;
	wire [31:0] ex_wd_o;
	wire [31:0] ex_wdata_o;

	wire  mem_wreg_i;
	wire [31:0] mem_wd_i;
	wire [31:0] mem_wdata_i;

	wire  mem_wreg_o;
	wire [31:0] mem_wd_o;
	wire [31:0] mem_wdata_o;
	
	wire  wb_wreg_i;
	wire [31:0] wb_wd_i;
	wire [31:0] wb_wdata_i;
	
	wire  reg1_read;
	wire  reg2_read;
	wire [31:0] reg1_data;
	wire [31:0] reg2_data;
	wire [31:0] reg1_addr;
	wire [31:0] reg2_addr;
	wire [31:0] if_inst;
  
	wire  branch;
	wire  [31:0] branch_addr;
	wire  last_branch;
	wire  [31:0] this_inst;
	wire  [31:0] ex_inst;
	wire  [31:0] ex_mem_addr_o;
	wire  [7:0] ex_aluop_o;
	wire  [7:0] ex_aluop;
	wire  [31:0] mem_mem_addr;
	wire  [7:0] mem_aluop;
	wire  [31:0] ex_reg2;
	wire  [31:0] mem_reg2;
	wire  stall_id;
	wire  [5:0] stall;
	wire  [31:0] num;
	wire  page;
  
	div output_div(
		.clk(clk),
		.sel(sel),
		.page(page)
    );
 
	code output_code(
		.num(num),
		.page(page),
		.sel(sel),
		.data(data)
    );
  
	Stall u_Stall(
		.rst(rst),
		.stall_id(stall_id),
		.stall(stall)
    );

	pc u_pc(
		.clk(clk),
		.rst(rst),
		.stall(stall),
		.branch(branch),
		.branch_addr(branch_addr),
		.pc(pc)
			
	);
	dist_mem_gen_0 u_InstRom(
		.a(pc[9:2]), // input [7 : 0] a
		.spo(if_inst) // output [31 : 0] spo
	);

	if_id u_if_id(
		.clk		(clk),
		.rst		(rst),
		.stall	(stall),
		.if_pc	(pc),
		.if_inst	(if_inst),
		.branch	(branch),
		.id_pc	(id_pc_i),
		.id_inst	(id_inst_i),
		.last_branch(last_branch)
    );



	id u_id(
		.rst(rst),
		.pc_i(id_pc_i),
		.inst(id_inst_i),

		
		.ex_wreg_i(ex_wreg_o),
		.ex_wdata_i(ex_wdata_o),
		.ex_wd_i(ex_wd_o),

		.mem_wreg_i(mem_wreg_o),
		.mem_wdata_i(mem_wdata_o),
		.mem_wd_i(mem_wd_o),
		.reg1_data_i(reg1_data),
		.reg2_data_i(reg2_data),
		.last_branch(last_branch),
		.ex_aluop_i(ex_aluop_i),
		
		.reg1_read_o(reg1_read),
		.reg2_read_o(reg2_read), 	  

		.reg1_addr_o(reg1_addr),
		.reg2_addr_o(reg2_addr), 
	  
		.aluop_o(id_aluop_o),
		.alusel_o(id_alusel_o),
		.reg1_o(id_reg1_o),
		.reg2_o(id_reg2_o),
		.wd_o(id_wd_o),
		.wreg_o(id_wreg_o),
		.branch(branch),
		.branch_addr(branch_addr),
		.this_inst(this_inst),
		.stall_id(stall_id)
	);

	regfile u_regfile(
		.clk (clk),
		.rst (rst),
		.we	(wb_wreg_i),
		.waddr (wb_wd_i),
		.wdata (wb_wdata_i),
		.re1 (reg1_read),
		.raddr1 (reg1_addr),
		.rdata1 (reg1_data),
		.re2 (reg2_read),
		.raddr2 (reg2_addr),
		.rdata2 (reg2_data)
	);

	id_ex u_id_ex(
		.clk(clk),
		.rst(rst),
		.stall(stall),
		
		.id_aluop(id_aluop_o),
		.id_alusel(id_alusel_o),
		.id_reg1(id_reg1_o),
		.id_reg2(id_reg2_o),
		.id_wd(id_wd_o),
		.id_wreg(id_wreg_o),
		.id_inst(this_inst),
	
		.ex_aluop(ex_aluop_i),
		.ex_alusel(ex_alusel_i),
		.ex_reg1(ex_reg1_i),
		.ex_reg2(ex_reg2_i),
		.ex_wd(ex_wd_i),
		.ex_wreg(ex_wreg_i),
		.ex_inst(ex_inst)
	);		
	
	ex u_ex(
		.rst(rst),
	
		.aluop_i(ex_aluop_i),
		.alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i),
		.reg2_i(ex_reg2_i),
		.wd_i(ex_wd_i),
		.wreg_i(ex_wreg_i),
		.ex_inst(ex_inst),
	  
		.wd_o(ex_wd_o),
		.wreg_o(ex_wreg_o),
		.wdata_o(ex_wdata_o),
		.aluop_o(ex_aluop_o),
		.mem_addr_o(ex_mem_addr_o),
		.reg2_o(ex_reg2)
	);

  ex_mem u_ex_mem(
		.clk(clk),
		.rst(rst),
		.stall(stall),
	  
		.ex_wd(ex_wd_o),
		.ex_wreg(ex_wreg_o),
		.ex_wdata(ex_wdata_o),
		.ex_aluop(ex_aluop_o),
		.ex_mem_addr(ex_mem_addr_o),
		.ex_reg2(ex_reg2),
	

		.mem_wd(mem_wd_i),
		.mem_wreg(mem_wreg_i),
		.mem_wdata(mem_wdata_i),
		.mem_aluop(mem_aluop),
		.mem_mem_addr(mem_mem_addr),
		.mem_reg2(mem_reg2)
						       	
	);
	
	wire  [31:0] mem_read;
	wire  [31:0] mem_addr_o;
	wire  mem_we;
	wire  [31:0] mem_write;
	mem u_mem(
		.rst(rst),
		.wd_i(mem_wd_i),
		.wreg_i(mem_wreg_i),
		.wdata_i(mem_wdata_i),
		.alu_op(mem_aluop),
		.mem_data_i(mem_read),
		.mem_addr_i(mem_mem_addr),
		.mem_reg2(mem_reg2),
		.wd_o(mem_wd_o),
		.wreg_o(mem_wreg_o),
		.wdata_o(mem_wdata_o),
		.mem_addr_o(mem_addr_o),
		.mem_we(mem_we),
		.mem_data_o(mem_write)
	);

	mem_wb u_mem_wb(
		.clk(clk),
		.rst(rst),
		.stall(stall),

		.mem_wd(mem_wd_o),
		.mem_wreg(mem_wreg_o),
		.mem_wdata(mem_wdata_o),
	
		.wb_wd(wb_wd_i),
		.wb_wreg(wb_wreg_i),
		.wb_wdata(wb_wdata_i)
									       	
	);
	

dist_mem_gen_1 u_RAM (
  .a(mem_addr_o[9:2]), // input [7 : 0] a
  .d(mem_write), // input [31 : 0] d
  .dpra(swi), // input [7 : 0] dpra
  .clk(clk), // input clk
  .we(mem_we), // input we
  .spo(mem_read), // output [31 : 0] spo
  .dpo(num) // output [31 : 0] dpo
);

endmodule
