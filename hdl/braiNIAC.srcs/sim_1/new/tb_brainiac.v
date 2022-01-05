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


module tb_brainiac();
    reg clk, test_input;
    reg [7:0] test_in;
    
    top top(
        .RX     (),
        .TX     (),
        .reset  (),
        .seg    (),
        .an     (),
        .clk    (clk),
        .test_in(test_in),
        .test_input(test_input));

//    brainiac BRAIN(
//        .IN     (10),
//        .INPUT  (),  
//        .OUT    (OUT),
//        .OUTPUT (OUTPUT),
//        .clk    (clk)
//    );
        
    initial begin
        test_input = 0;
        test_in = 0;
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    initial begin
        #100 test_in = 53;  //ASCII 5
        #12400 test_input = 1; //t = 12500
        #1 test_input = 0;
        
        #100 test_in = 10; //ASCII LF
        #1400 test_input = 1; //t = 13900
        #1 test_input = 0;
        
        #100 test_in = 50; //ASCII 2
        #26999 test_input = 1; //t = 41000
        #1 test_input = 0;
        
        #100 test_in = 10; //ASCII LF
        #1999 test_input = 1; //t = 43100
        #1 test_input = 0;
        
//        #1000 $finish;
//        #12000 $finish;
    end
    
endmodule
