`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/11 22:34:34
// Design Name: 
// Module Name: vga
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


module vga(
             /*clk,rst_n,
                                vga_r,vga_g,vga_b,clk_vga,
                                hsync,vsync,VGA_BLANK_N,VGA_SYNC_N,*/
       input clk,          //时钟信号
                                    input rst_n,                         //复位信号
                                    output reg [3:0] vga_r ,
                                    output reg [3:0] vga_g ,
                                    output reg [3:0] vga_b ,
                                                //VGA工作时钟
                                    output hsync,
                                    output vsync        
                                );
        
     
                            reg clk_vga; 
                             reg [9:0] x_cnt;
                             reg [9:0] y_cnt;
    //------------------------------------ 640*480，刷新频率60Hz，时钟频率25Mhz
                       parameter H_FRONT=16; 
                       parameter H_SYNC=96; 
                       parameter H_BACK=48; 
                       parameter H_ACT=640; 
                       parameter H_BLANK=H_FRONT+H_SYNC+H_BACK; 
                       parameter H_TOTAL=H_FRONT+H_SYNC+H_BACK+H_ACT; 
     
     //Vertical Parameter    11+2+32+480=525 
     
                       parameter V_FRONT=10; 
                       parameter V_SYNC=2; 
                       parameter V_BACK=33; 
                       parameter V_ACT=480; 
                       parameter V_BLANK=V_FRONT+V_SYNC+V_BACK; 
                       parameter V_TOTAL=V_FRONT+V_SYNC+V_BACK+V_ACT; 
     
                      // assign VGA_SYNC_N=1'b0;                                                                     //Ifnot SOG, Sync input should be tied to 0; 
                      // assign VGA_BLANK_N=~((x_cnt<H_BLANK)||(y_cnt<V_BLANK)); 
            
    //------------------------------------
    // 分频
      
     
              always @(posedge clk or negedge rst_n)
                if (!rst_n)
                          clk_vga<=1'b0;
               else clk_vga<=~clk_vga;
                               
            
     
    //------------------------------------
    //行列坐标的计算
                      
             
             always @(posedge clk_vga or negedge rst_n)
               if (!rst_n) begin
                   x_cnt<=10'd0;              //行计数开始
                                end
               else if (x_cnt==800)  x_cnt<=0;
               else x_cnt<=x_cnt+1;
              
              
              always @(posedge clk_vga or negedge rst_n)
               if (!rst_n) begin
                   y_cnt<=10'd0;              //行计数开始
                                end 
               else if (y_cnt==525)  y_cnt<=0;
               else if (x_cnt==800) y_cnt<=y_cnt+1;
              
    //----------------------------------        
    //同步信号的产生
         reg hsync_r,vsync_r;
         always @(posedge clk_vga or negedge rst_n)                                 
                        if (!rst_n)    hsync_r<=1'b1;      //同步信号拉高
                        else if(x_cnt==0)      
                                            hsync_r<=1'b0;           //行计数开始，行同步信号拉低
                        else if(x_cnt==96)
                                                   hsync_r<=1'b1;                  //行计数开始，行同步信号拉高
                                                  
              always @(posedge clk_vga or negedge rst_n)                                 
                        if (!rst_n)    vsync_r<=1'b1;      //同步信号拉高
                        else if(y_cnt==0)      
                                            vsync_r<=1'b0;           //行计数开始，行同步信号拉低
                        else if(y_cnt==2)      
                                            vsync_r<=1'b1;           //行计数开始，行同步信号拉高                   
            
              assign hsync=hsync_r;
              assign vsync=vsync_r;
              
    always @(posedge clk_vga or negedge rst_n)
        if (!rst_n)
              begin
                 vga_r=4'b0000;
                 vga_g=4'b0000;
                        vga_b=4'b0000;
                        end
             /* else if(144<=x_cnt&&x_cnt<=223)
                   begin
                 vga_r=4'b1111;
                 vga_g=4'b0000;
                        vga_b=4'b0000;
                        end
              else if(224<=x_cnt&&x_cnt<=303)
                   begin
                 vga_r=4'b1111;
                 vga_g=4'b1111;
                        vga_b=4'b0000;
                        end
              else if(304<=x_cnt&&x_cnt<=383)
                 begin
                 vga_r=4'b0000;
                 vga_g=4'b1111;
                        vga_b=4'b0000;
                        end
              else if(384<=x_cnt&&x_cnt<=463)
                 begin
                 vga_r=4'b0000;
                 vga_g=4'b1111;
                        vga_b=4'b1111;
                       end
              else if(464<=x_cnt&&x_cnt<=543)
                 begin
                 vga_r=4'b1111;
                 vga_g=4'b0000;
                        vga_b=4'b1111;
                        end
              else if(544<=x_cnt&&x_cnt<=623)
              begin
                 vga_r=4'b0000;
                 vga_g=4'b0000;
                        vga_b=4'b1111;
                        end
              else if(624<=x_cnt&&x_cnt<=703)
              begin
                 vga_r=4'b0000;
                 vga_g=4'b0000;
                        vga_b=4'b0000;
                        end
              else if(704<=x_cnt&&x_cnt<=783)
              begin
                 vga_r=4'b1111;
                 vga_g=4'b1111;
                        vga_b=4'b1111;
                        end
              else
                  begin
                 vga_r=4'b1111;
                 vga_g=4'b1111;
                        vga_b=4'b1111;
                        end*/
              else if(x_cnt>=112&&x_cnt<=752&&(y_cnt>=2&&y_cnt<=28)|(y_cnt>=476&&y_cnt<=492))
                       begin
                       vga_r=4'b0000;
                                        vga_g=4'b1111;
                                               vga_b=4'b1111;
                                               end
              else
              begin
               vga_r=4'b0000;
               vga_g=4'b0000;
               vga_b=4'b0000;
               end
endmodule
    
    
    
