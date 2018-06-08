`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/26 18:54:05
// Design Name: 
// Module Name: controlunit
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


module controlunit(
input [5:0]OP,
input [5:0]func,
output reg RegWrite,
output reg RegDist,
output reg ALUSrc,
output reg [2:0]ALUControl,
output reg Branch,
output reg MemWrite,
output reg MemtoReg,
output reg jump
    );   
     parameter    LOAD = 6'h23;
     parameter    STORE= 6'h2b; 
     parameter    ADD_SUB = 6'h0;   
     parameter    ORI = 6'hd;   
     parameter    BGTZ = 6'h7;   
     parameter    JUMP = 6'h2; 
     parameter    ADDI = 6'h8;
    always@(*)
    case(OP)
    LOAD:begin
            RegWrite<=1;
            RegDist<=0;
            ALUSrc<=1;
            Branch<=0;
            MemWrite<=0;
            MemtoReg<=1;
            jump<=0;
            ALUControl<=3'b010;
            end
    STORE:begin
                RegWrite<=0;
                RegDist<=0;
                ALUSrc<=1;
                Branch<=0;
                MemWrite<=1;
                MemtoReg<=1;
                jump<=0;
                ALUControl<=3'b010;
    end
    ADD_SUB:begin
                RegWrite<=1;
                RegDist<=1;
                ALUSrc<=0;
                Branch<=0;
                MemWrite<=0;
                MemtoReg<=0;
                jump<=0;
                case(func[3:0])
                4'b0000:ALUControl<=3'b010;
                4'b0010:ALUControl<=3'b110;
                4'b0100:ALUControl<=3'b000;
                4'b0101:ALUControl<=3'b001;
                4'b1010:ALUControl<=3'b111;
                endcase
    end
    ORI:begin
                    RegWrite<=1;
                    RegDist<=0;
                    ALUSrc<=1;
                    Branch<=0;
                    MemWrite<=0;
                    MemtoReg<=0;
                    jump<=0;
                    ALUControl<=3'b001;
    end
    BGTZ:begin
                    RegWrite<=0;
                    RegDist<=1;
                    ALUSrc<=0;
                    Branch<=1;
                    MemWrite<=0;
                    MemtoReg<=0;
                    jump<=0;
                    ALUControl<=3'b011;//自定义了一个与0比较的alu命令
    end
    JUMP:begin
                    RegWrite<=0;
                    RegDist<=1;
                    ALUSrc<=0;
                    Branch<=1;
                    MemWrite<=0;
                    MemtoReg<=0;
                    jump<=1;
    end
    ADDI:begin
                        RegWrite<=1;
                        RegDist<=0;
                        ALUSrc<=1;
                        Branch<=0;
                        MemWrite<=0;
                        MemtoReg<=0;
                        jump<=0;
                        ALUControl<=3'b010;
    end
    default:begin
                    RegWrite<=0;
                    RegDist<=0;
                    ALUSrc<=1;
                    Branch<=0;
                    MemWrite<=0;
                    MemtoReg<=0;
                    jump<=0;
                    ALUControl<=3'b010;
                    //INIT<=0;
    end
    endcase
    
endmodule
