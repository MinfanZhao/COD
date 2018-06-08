`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/19 18:23:03
// Design Name: 
// Module Name: control
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

module control(
input clk,
input rst_n,
output reg [31:0]out1,
output reg [31:0]out2,
output reg wena,
output reg [7:0]write,
output reg [7:0]read_ram,
output reg [7:0]write_reg,
output reg [4:0]alu_op,
input wire [31:0]read_data_ram,
output reg wen_ram
    );
    reg [2:0]count;
    reg [5:0]ram_control;
    reg [7:0]read_op;
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        begin 
            read_op<=100;
            read_ram<=0;
           count<=0;
            write<=200;
            write_reg<=0;
            wena<=0;
            wen_ram<=0;
            alu_op<=0;
        end
   else 
   begin
            case(count)
    3'h0:
    begin
    read_ram<=read_ram+1;
    count<=count+1;
    wena<=1;
    wen_ram<=0;
    end
    3'h1:
    begin
    read_ram<=read_op;
    ram_control<=read_ram;
    read_op<=read_op+1;
    count<=count+1;
    wena<=1;
    write_reg<=write_reg+1;
    wen_ram<=0;
    end
    3'h2:
    begin
    out1<=read_data_ram;
    write_reg<=write_reg+1;
    count<=count+1;
    wena<=1;
    wen_ram<=0;
    end
    3'h3:
    begin
    out2<=read_data_ram;
    wen_ram<=0;
    write<=write+1;
    count<=count+1;
    wena<=1;
    end
    3'h4:
    begin
    alu_op<=read_data_ram;
    write_reg<=0;
    read_ram<=ram_control+1;
    wen_ram<=1;
    wena<=0;
    count<=0;
    end
            endcase
    end
endmodule

