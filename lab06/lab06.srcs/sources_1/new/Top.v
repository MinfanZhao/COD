`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/30 13:45:05
// Design Name: 
// Module Name: Top
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


module Top(
input clk
    );
	wire [31:0]PCnext;
	wire [31:0]PC;
	wire [31:0]Adr;
	wire [31:0]ALUOUT;
	wire [31:0]SrcB_RD;
	wire [31:0]RD;
	wire [31:0]Data;
	wire [31:0]IR;
	wire [4:0]A3;
	wire [31:0]WD3;
	wire [31:0]RD1;
	wire [31:0]RD2;
	wire [31:0]SrcA_RD;
	wire [31:0]SrcB;
	wire [31:0]SrcA;
	wire [31:0]ALUResult;
	wire Zero;
	wire IorD;
	wire PCEn;
	wire MemWrite;
	wire IRWrite;
	wire RegDist;
	wire MemtoReg;
	wire RegWrite;
	wire ALUSrcA;
	wire [1:0]ALUSrcB;
	wire [2:0]ALUControl;
	wire Branch;
	wire PCWrite;
	wire [1:0]PCSrc;
	wire INIT;
	wire [31:0]PCJump;
	wire [31:0]SignImm;
	assign Adr=IorD>0?ALUOUT:PC;
	assign A3=RegDist>0?IR[15:11]:IR[20:16];
	assign WD3=MemtoReg>0?Data:ALUOUT;
	assign SrcA=ALUSrcA>0?SrcA_RD:PC;
	assign PCJump={PC[31:28]+IR[25:0]+2'b00};
	assign PCEn=PCWrite|(Branch&Zero);

	ALU CPU_ALU(
		.alu_a (SrcA),
    	.alu_b (SrcB), 
    	.alu_op (ALUControl),
    	.alu_out (ALUResult),
    	.Zero (Zero)
    );
    SrcPC CPU_SrcPC(
    	.PCSrc (PCSrc),
		.ALUResult (ALUResult),
		.ALUOUT (ALUOUT),
		.PCJump (PCJump),
		.PCnext (PCnext)
    	);
	ControlUnit CPU_ControlUnit(
		.clk (clk),
		.OP (IR[31:26]),
		.Funct (IR[5:0]),
		.IorD (IorD),
		.MemWrite (MemWrite),
		.IRWrite (IRWrite),
		.PCWrite (PCWrite),
		.Branch (Branch),
		.PCSrc (PCSrc),
		.ALUControl (ALUControl),
		.ALUSrcB (ALUSrcB),
		.ALUSrcA (ALUSrcA),
		.RegWrite (RegWrite),
		.RegDist (RegDist),
		.MemtoReg (MemtoReg),
		.INIT (INIT)
				);
	Instr CPU_Instr(
		.IRWrite (IRWrite),
		.clk (clk),
		.RD (RD),
		.IR (IR)
		);
	PCUnit CPU_PCUnit(
		.clk (clk),
		.PCEn (PCEn),
		.INIT (INIT),
		.PCnext (PCnext),
		.PC (PC)
		);
	RegALUOUT CPU_RegALUOUT(
		.clk (clk),
		.ALUResult (ALUResult),
		.ALUOUT (ALUOUT)
		);
	RegData CPU_RegData(
		.clk (clk),
		.RD (RD),
		.Data (Data)
		);
	RegRD CPU_RegRD(
		.RD1 (RD1),
		.RD2 (RD2),
		.clk (clk),
		.SrcA_RD (SrcA_RD),
		.SrcB_RD (SrcB_RD)
		);
	SignExtend CPU_SignExtend(
		.data (IR[15:0]),
		.SignImm (SignImm)
		);
	SrcBMUX CPU_SrcBMUX(
		.RD2_B (SrcB_RD),
		.SignImm (SignImm),
		.ALUSrcB (ALUSrcB),
		.SrcB (SrcB)
		);
	regfile CPU_regfile(
		.clk (clk),
		.rst_n (),
		.rAddr1 (IR[25:21]),
		.rAddr2 (IR[20:16]),
		.wAddr (A3),
		.wDin (WD3),
		.rDout1 (RD1),
		.rDout2 (RD2),
		.wEna (RegWrite),
		.INIT(INIT)
		);
	blk_mem_gen_0 cpu_IDMem(
		.clka (clk),
    	.ena (1),
    	.wea (MemWrite),
    	.addra (Adr[15:0]),
    	.dina (SrcB_RD),
    	.douta (RD)
		);
endmodule
