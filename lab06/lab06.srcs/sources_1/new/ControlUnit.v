`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/29 19:56:42
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
input clk,
input [5:0]OP,
input [5:0]Funct,
output reg INIT,
output reg IorD,
output reg MemWrite,
output reg IRWrite,
output reg PCWrite,
output reg Branch,
output reg [1:0]PCSrc,
output reg [2:0]ALUControl,
output reg [1:0]ALUSrcB,
output reg ALUSrcA,
output reg RegWrite,
output reg RegDist,
output reg MemtoReg
    );
	reg [5:0]count; 
	parameter Fetch1=6'h0;
	parameter Fetch2=6'h1;
	parameter Fetch3=6'h2;
	parameter Fetch4=6'h3;
	parameter Decode=6'h4;
	parameter MemAdr=6'h5;
	parameter MemRead1=6'h6;
	parameter MemRead2=6'h7;
	parameter MemRead3=6'h8;
	parameter MemWriteBack=6'h9;
	parameter WriteMem=6'ha;
	parameter Execute=6'hb;
	parameter ALUWriteBack=6'hc;
	parameter BRANCH1=6'hd;
	parameter BRANCH2=6'he;
	parameter ADDIExecute=6'hf;
	parameter ADDIWriteBack=6'h10;
	parameter JUMP=6'h11;

	parameter LW=6'h23;
	parameter SW=6'h2b;
	parameter ADD_SUB=6'h0;
	parameter ORI=6'hd;
	parameter BEQ=6'h7;
	parameter ADDI=6'h8; 
	parameter J=6'h2;
	always@(posedge clk)
	case (count)
	Fetch1:
	begin
	INIT<=0;
	IorD<=0;
	MemWrite<=0;
	IRWrite<=1;
	PCWrite<=0;
	Branch<=0;
	PCSrc<=0;
	ALUControl<=3'b010;
	ALUSrcB<=1;
	ALUSrcA<=0;
	RegWrite<=0;
	RegDist<=0;
	MemtoReg<=0;
	count<=count+1;
	end
	Fetch2:
	begin
		PCWrite<=0;//pc<=pc+1;
		count<=count+1;
	end
	Fetch3:
	begin
		PCWrite<=0;
		count<=count+1;
	end
	Fetch4:
	begin
		PCWrite<=1;  
		count<=count+1;
	end
	Decode:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUControl<=3'b010;
		ALUSrcB<=3;
		ALUSrcA<=0;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		case(OP)
		LW: count<=MemAdr;
		SW: count<=MemAdr;
		ADD_SUB: count<=Execute;
		ORI: count<=ADDIExecute;
		BEQ: count<=BRANCH1;
		ADDI: count<=ADDIExecute;
		J: count<=JUMP;
		endcase
	end
	MemAdr:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUControl<=3'b010;
		ALUSrcB<=2;
		ALUSrcA<=1;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		case(OP)
		LW:count<=MemRead1;
		SW:count<=WriteMem;
		endcase 
	end
	MemRead1:
	begin
		IorD<=1;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUControl<=3'b010;
		ALUSrcB<=2;
		ALUSrcA<=1;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		count<=MemRead2;
	end
	MemRead2: count<=MemRead3;
	MemRead3: 
	begin
		count<=MemWriteBack;
	end
	MemWriteBack:
	begin
		IorD<=1;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUControl<=3'b010;
		ALUSrcB<=2;
		ALUSrcA<=1;
		RegWrite<=1;
		RegDist<=0;
		MemtoReg<=1;
		count<=Fetch1;
	end
	WriteMem:
	begin
		IorD<=1;
		MemWrite<=1;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUControl<=3'b010;
		ALUSrcB<=2;
		ALUSrcA<=1;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		count<=Fetch1;
	end
	Execute:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUSrcB<=0;
		ALUSrcA<=1;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		case(Funct)
        4'b0000:ALUControl<=3'b010;
        4'b0010:ALUControl<=3'b110;
        4'b0100:ALUControl<=3'b000;
        4'b0101:ALUControl<=3'b001;
        4'b1010:ALUControl<=3'b111;
        endcase
        count<=ALUWriteBack;
	end
	ALUWriteBack:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUSrcB<=0;
		ALUSrcA<=1;
		RegWrite<=1;
		RegDist<=1;
		MemtoReg<=0;
		case(Funct)
        4'b0000:ALUControl<=3'b010;
        4'b0010:ALUControl<=3'b110;
        4'b0100:ALUControl<=3'b000;
        4'b0101:ALUControl<=3'b001;
        4'b1010:ALUControl<=3'b111;
        endcase
        count<=Fetch1;
	end
	BRANCH1:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=1;
		ALUControl<=3'b010;
		ALUSrcB<=2;
		ALUSrcA<=0;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		count<=BRANCH2;
	end
	BRANCH2:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=1;
		PCSrc<=1;
		ALUControl<=3'b011;
		ALUSrcB<=0;
		ALUSrcA<=1;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		count<=Fetch1;
	end
	ADDIExecute:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		case (OP)
		ADDI:ALUControl<=3'b010;
		ORI:ALUControl<=3'b001;
		endcase
		ALUSrcB<=2;
		ALUSrcA<=1;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		count<=ADDIWriteBack; 
	end
	ADDIWriteBack:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=0;
		Branch<=0;
		PCSrc<=0;
		ALUControl<=3'b010;
		ALUSrcB<=2;
		ALUSrcA<=1;
		RegWrite<=1;
		RegDist<=0;
		MemtoReg<=0;
		count<=Fetch1;
	end
	JUMP:
	begin
		IorD<=0;
		MemWrite<=0;
		IRWrite<=0;
		PCWrite<=1;
		Branch<=0;
		PCSrc<=2;
		ALUControl<=3'b010;
		ALUSrcB<=3;
		ALUSrcA<=0;
		RegWrite<=0;
		RegDist<=0;
		MemtoReg<=0;
		count<=Fetch1;
	end
	default:
	begin
		INIT<=1;
		count<=Fetch1;
	end
	endcase 


endmodule
