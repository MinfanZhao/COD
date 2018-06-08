`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/26 19:36:02
// Design Name: 
// Module Name: CPU
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


module CPU(
input clk
    );
    wire [31:0]IR;
    wire [31:0]PCdata;
    wire [31:0]PC;
    wire [31:0]NPC;
    wire PCSrc;
    wire MemtoReg;
    wire MemWrite;
    wire Branch;
    wire [2:0]ALUControl;
    wire ALUSrc;
    wire RegDist;
    wire RegWrite;
    wire [4:0]WriteReg;
    wire [31:0]SrcB; 
    wire [31:0]SrcA;
    wire [31:0]Result;
    wire [31:0]PCBranch;
    wire [31:0]SignImm;
    wire [31:0]RD2;
    wire Zero;
    wire [31:0]ALUResult;
    wire [31:0]ReadData;
    wire jump;
    wire INIT;
    assign PCSrc=Branch & Zero;
    assign WriteReg=RegDist>0?IR[15:11]:IR[20:16];
    assign SrcB=ALUSrc>0?SignImm:RD2;
    assign Result=MemtoReg>0?ReadData:ALUResult;
    assign PCdata=PCSrc>0?PCBranch:NPC;
    PCins CPU_PCins(
    .clk (clk),
    .PCdata (PCdata),
    .PC (PC),
    .IR (IR),
    .JUMP (jump),
    .INIT (INIT)
    );
    dist_mem_gen_0 Instruction_Memory(
    .a (PC[7:0]),
    .d (),
    .clk (clk),
    .we (0),
    .spo (IR)
    );
    regfile CPU_RegFile(
    .clk (clk),
    .rst_n (),
    .rAddr1 (IR[25:21]),
    .rAddr2 (IR[20:16]),
    .wAddr (WriteReg),
    .wDin (Result),
    .rDout1 (SrcA),
    .rDout2 (RD2),
    .wEna (RegWrite),
    .INIT (INIT)
    );
    ALU CPU_ALU(
    .alu_a (SrcA),
    .alu_b (SrcB),
    .alu_op (ALUControl),
    .alu_out (ALUResult),
    .Zero (Zero)
    );
    dist_mem_gen_1 Data_Memory(
   .a (ALUResult[15:0]),
   .d (RD2),
   .clk (clk),
   .we (MemWrite),
   .spo (ReadData)
    );
    PCplus CPU_PCplus(
    .PC (PC),
    .NPC (NPC)
    );
    PCBranch CPU_PCBranch(
    .SignImm (SignImm),
    .NPC (NPC),
    .ALUControl (ALUControl),
    .PCBranch (PCBranch)
    );
    SignExtend CPU_SignExtend(
    .data (IR[15:0]),
    .SignImm (SignImm)
    );
    controlunit CPU_ControlUnit(
    .OP (IR[31:26]),
    .func (IR[5:0]),
    .RegWrite (RegWrite),
    .RegDist (RegDist),
    .ALUSrc (ALUSrc),
    .ALUControl (ALUControl),
    .Branch (Branch),
    .MemWrite (MemWrite),
    .MemtoReg (MemtoReg),
    .jump (jump)
    );
endmodule
