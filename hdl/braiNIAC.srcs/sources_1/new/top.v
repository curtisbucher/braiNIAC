`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2021 02:24:01 PM
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
    input   RX,
    output  TX,
    input   reset,
    output  [7:0] seg,
    output  [3:0] an,
    input   clk
//    input   clk,
//    input   [7:0] test_in,  //used in place of uart during testing
//    input   test_input     //used in place of uart during testing
    );
    
//    assign tx = clk;
    wire div_clk, OUTPUT, output_dbnc, rx_received, INPUT, input_empty;
    wire [7:0] OUT, IN, uart_dout;
    
    // Clock Divider
    clk_2n_div_test #(.n(15)) MY_DIV (
        .clockin   (clk), 
        .fclk_only (1'b0),          
        .clockout  (div_clk));  
    
    // brainfuck processor   
    brainiac BRAIN(
        .IN             (IN),
        .INPUT          (INPUT),
        .input_empty    (input_empty),  
        .OUT            (OUT),
        .OUTPUT         (OUTPUT),
        .clk            (div_clk));
    
    //Button debouncer to only transmit once
    button_debounce DEBOUNCE(
        .clk        (clk),
        .reset      (reset),
        .button_in  (OUTPUT),
        .button_out (output_dbnc));
    
    //UART transeiver
    UART TRANSEIVER(
        .clk        (clk),
        .reset      (reset),
        .tx_start   (output_dbnc),
        .rx_received(rx_received),
        .data_in    (OUT),
        .data_out   (uart_dout),
        .rx         (RX),
        .tx         (TX));

    //Output Buffer
    
    
    //Input Buffer
    input_buffer INPUT_BUFFER(
        .data_in    (uart_dout),        //implementation: uart_dout, simuilation: test_in
        .push       (rx_received),      //implementation: rx_received, simulation: test_input
//        .data_in    (test_in),
//        .push       (test_input),
        .reset      (reset),
        .clk        (clk),
        .INPUT      (INPUT),    // data_out
        .IN         (IN),       // pop
        .empty      (input_empty));
           
    univ_sseg my_univ_sseg (
        .cnt1    ({6'b0, OUT}), 
        .cnt2    (0), 
        .valid   (1), 
        .dp_en   (0), 
        .dp_sel  (0), 
        .mod_sel (2'b10), 
        .sign    (0), 
        .clk     (clk), 
        .ssegs   (seg), 
        .disp_en (an)); 
endmodule
