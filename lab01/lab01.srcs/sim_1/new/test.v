`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/29 19:35:36
// Design Name: 
// Module Name: test
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


module test(

    );
    reg [31:0]alu_a;
    reg [31:0]alu_b;
    wire [31:0]alu_out;
    reg [4:0]alu_op;
   main test(
    .alu_a (alu_a),
    .alu_b (alu_b),
    .alu_out (alu_out)
    );
  /* alu test(
    .alu_a (alu_a),
    .alu_b (alu_b),
    .alu_out (alu_out),
    .alu_op (alu_op)
    );*/
    initial begin
    alu_a=32'h2;
    alu_b=32'h2;
  //  alu_op=5'h1;
  /*  #100
    alu_op=5'h1;
     #100
       alu_op=5'h2;
        #100
          alu_op=5'h3;
           #100
             alu_op=5'h4;
              #100
                alu_op=5'h5;
                 #100
                   alu_op=5'h6;*/
    end
    
endmodule
