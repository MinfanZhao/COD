`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:00 05/22/2017 
// Design Name: 
// Module Name:    Define 
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
`define AND  6'b100100
`define OR   6'b100101
`define XOR 6'b100110
`define NOR 6'b100111
`define ANDI 6'b001100
`define ORI  6'b001101
`define XORI 6'b001110
`define LUI 6'b001111
`define SLL  6'b000000
`define SLLV  6'b000100
`define SRL  6'b000010
`define SRLV  6'b000110
`define SRA  6'b000011
`define SRAV  6'b000111
`define SLT  6'b101010
`define SLTU  6'b101011
`define ADD  6'b100000
`define ADDU  6'b100001
`define SUB  6'b100010
`define SUBU  6'b100011
`define ADDI  6'b001000
`define ADDIU  6'b001001
`define J  6'b000010
`define JR  6'b001000
`define BEQ  6'b000100
`define BGEZ  5'b00001
`define BGTZ  6'b000111
`define BLEZ  6'b000110
`define BLTZ  5'b00000
`define BNE  6'b000101
`define LW  6'b100011
`define SW  6'b101011
`define NOP 6'b000000


`define SPECIAL_INST 6'b000000
`define REGIMM_INST 6'b000001
`define SPECIAL2_INST 6'b011100


`define AND_OP   8'b00100100
`define OR_OP    8'b00100101
`define XOR_OP  8'b00100110
`define NOR_OP  8'b00100111
`define ANDI_OP  8'b01011001
`define ORI_OP  8'b01011010
`define XORI_OP  8'b01011011
`define LUI_OP  8'b01011100   

`define SLL_OP  8'b01111100
`define SLLV_OP  8'b00000100
`define SRL_OP  8'b00000010
`define SRLV_OP  8'b00000110
`define SRA_OP  8'b00000011
`define SRAV_OP  8'b00000111


`define SLT_OP  8'b00101010
`define SLTU_OP  8'b00101011
`define ADD_OP  8'b00100000
`define ADDU_OP  8'b00100001
`define SUB_OP  8'b00100010
`define SUBU_OP  8'b00100011
`define ADDI_OP  8'b01010101
`define ADDIU_OP  8'b01010110



`define J_OP  8'b01001111
`define JR_OP  8'b00001000
`define BEQ_OP  8'b01010001
`define BGEZ_OP  8'b01000001
`define BGTZ_OP  8'b01010100
`define BLEZ_OP  8'b01010011
`define BLTZ_OP  8'b01000000
`define BNE_OP  8'b01010010

`define LW_OP  8'b11100011
`define SW_OP  8'b11101011


`define NOP_OP    8'b00000000


`define RES_LOGIC 3'b001
`define RES_SHIFT 3'b010
`define RES_MOVE 3'b011	
`define RES_ARITHMETIC 3'b100	
`define RES_JUMP_BRANCH 3'b110
`define RES_LOAD_STORE 3'b111	

`define RES_NOP 3'b000





