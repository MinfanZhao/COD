`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/06 21:08:20
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst_n
    );
  /*  reg [5:0]read;
    reg [5:0]write;
    reg [31:0]data;
    reg [31:0]out1;
    reg [31:0]out2;*/
    wire [5:0]read;
    wire [5:0]write;
    wire [31:0]out1;
    wire [31:0]out2;
    wire [31:0]Din;
    wire [31:0]read_data;
    wire wen;
     control control1(
     .clk (clk),
     .rst_n (rst_n),
     .read_data (read_data),
     .out1 (out1),
     .out2 (out2),
     .read (read),
      .wena (wen),
     .write (write)
    
     );
     regfile  regfile1(
           .clk (clk),
           .rst_n (rst_n),
           .rAddr (read),
           .wAddr (write),
           .wDin (Din),
           .rDout (read_data),
           .wEna (wen)
           );
     ALU alu(
     .alu_a (out1),
     .alu_b (out2),
     .alu_op (5'h1),
     .alu_out (Din)
     );
  /*  always@(posedge clk or negedge rst_n)
    begin
    if(!rst_n)
        begin
        regfile1(clk,rst_n,0,0,0,out1,0);
        count<=0;
        read<=0;
        write<=0;
        data<=0;
        out1<=0;
        out2<=0;
        end
    else
        begin 
            if (count==0)
                begin
                write<=0;
                regfile(clk,rst_n,read,write,2,out1,1);
                write<=1;
                regfile(clk,rst_n,read,write,2,out1,1);
                count=count+1;
                end
            else if(count < 63)
                begin
                 regfile(clk,rst_n,count-1,write,2,out1,0);
                 regfile(clk,rst_n,count,write,2,out2,0);
                 ALU(out1,out2,1,data);
                 regfile(clk,rst_n,count,count+1,data,1);
                end
         end
    end*/
endmodule
