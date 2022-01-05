`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 01:25:20 PM
// Design Name: 
// Module Name: tb_rom
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


module tb_rom();
    reg [15:0] in;
    wire [7:0] out;
    reg clk;
    
    brainiac BRAINIAC (
        .INPUT  (in),
        .OUTPUT (out),
        .clk    (clk));
        
    initial begin
        in = 0;
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    initial begin
        forever #2 in = in + 1;
    end
    
    initial begin
        #100 $finish;
    end
    
endmodule
