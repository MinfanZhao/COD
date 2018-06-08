`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/12 18:34:54
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
input [31:0]read_data,
output reg [31:0]out1,
output reg [31:0]out2,
output reg [5:0]read,
output reg wena,
output reg [5:0]write,
output reg [5:0]read_ram,
input wire [31:0]read_data_ram,
output reg wen_ram
    );
    reg [1:0]count;
    reg [5:0]ram_control;
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        begin 
            count<=0;
            read<=0;
            wena<=0;
            out1<=0;
            out2<=0;
            ram_control<=0;
            read_ram<=0;
            wen_ram<=0;
        end
    else if(read<63)
        begin
            if(ram_control==0)begin
                read_ram<=0;
                wena<=0;
                ram_control<=ram_control+1;
            end
            else if (ram_control==1)begin
            ram_control<=ram_control+1;
            wena<=0;
            end
            else if (ram_control==2)begin
            ram_control<=ram_control+1;
            out1<=read_data_ram;
            out2<=0;
            write<=0;
            wena<=0;
            end
            else if (ram_control==3)begin
            ram_control<=ram_control+1;
            wena<=1;
            end
            else if(ram_control==4)begin
                            read_ram<=1;
                            wena<=0;
                            ram_control<=ram_control+1;
                        end
                        else if (ram_control==5)begin
                        ram_control<=ram_control+1;
                        wena<=0;
                        end
                        else if (ram_control==6)begin
                        ram_control<=ram_control+1;
                        wena<=0;
                        out1<=read_data_ram;
                        out2<=0;
                        write<=1;
                        end
                        else if (ram_control==7)begin
                        ram_control<=ram_control+1;
                        wena<=1;
                        end
            else
            case(count)
    2'h0:
    begin
    out1<=read_data;
    read<=read+1;
    count<=count+1;
    wena<=0;
    wen_ram<=0;
    end
    2'h1:
    begin
    out2<=read_data;
    write<=read+1;
    count<=count+1;
    wena<=0;
    wen_ram<=0;
    end
    2'h2:
    begin
    wena<=1;
    count<=0;
    wen_ram<=1;
    end
            endcase
        end
endmodule
