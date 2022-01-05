`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Bucher Design
// Engineer: Curtis Bucher
// 
// Create Date: 11/21/2021 10:06:49 AM
// Design Name: the braiNIAC
// Module Name: brainiac
// Project Name: the braiNIAC
// Target Devices: 
// Tool Versions: 
// Description:
//      A computer designed to natively run the braif*ck esoteric programming language.
//      https://en.wikipedia.org/wiki/Brainfuck
// Dependencies: 
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module brainiac(
    input   [7:0] IN,
    output  INPUT,
    input   input_empty,
    output  reg [7:0] OUT,
    output  OUTPUT, //wire indicates that a new output value is present
    input   clk
    );
    
    //Addressing
    wire [15:0] PC_cnt, ST_top, DEPTH_cnt, TP_addr; 
    //Data
    wire [7:0] TP_din, DATA;
    //Signals
    wire PC_clr, PC_ld, PC_en, PC_up, 
         ST_rst, ST_pop, ST_psh, ST_emp, ST_full,
         DEPTH_clr, DEPTH_en, DEPTH_up,
         HD_clr, HD_up, HD_en, 
         TP_we, TP_rst_busy,
         OUT_ld, OUT_clr;
         
    wire [2:0] INSTR;
    wire [1:0] TM_sel;
    
    assign OUTPUT = OUT_ld;
    
    // For debugging
    wire [3:0] PS_dbg;
    
    always @(posedge OUTPUT) begin
        $write("%c", OUT); 
    end
         
//    // FINITE STATE MACHINE
    fsm FSM (
        .instr  (INSTR),  // The current instruction (ROM) (INSTR)
        .data   (DATA),   // The current tape value. (DATA)
        .ST_emp (ST_emp),       // The loop depth is current zero. (The stack is empty)
        .DEPTH_one (DEPTH_cnt == 1), //when DEPTH is 0
        .TP_rst_busy    (TP_rst_busy),  //RAM is busy, not able to load data
        .clk    (clk),
        
        .PC_en  (PC_en),       // enable the PROGRAM COUNTER
        .PC_ld  (PC_ld),       // load the PROGRAM COUNTER
        .PC_clr (PC_clr),      // clear the PROGRAM COUNTER
        .PC_up  (PC_up),       // increment the PROGRAM COUNTER
        
        .DEPTH_clr  (DEPTH_clr),   // clear the depth counter
        .DEPTH_en   (DEPTH_en),    // enable the depth counter
        .DEPTH_up   (DEPTH_up),    // increment (not decrement) depth
        
        .ST_rst (ST_rst),      // clear the LOOP STACK
        .ST_pop (ST_pop),      // pop from the LOOP STACK
        .ST_psh (ST_psh),      // push to the LOOP STACK
        
        .HD_en  (HD_en),       // enable the TAPE HEAD counter
        .HD_clr (HD_clr),      // clear the TAPE HEAD counter
        .HD_up  (HD_up),       // increment the TAPE HEAD counter
        
        .TP_we  (TP_we),       // write enable the TAPE (RAM)
        .TM_sel (TM_sel),      // Selects the input into TAPE 
        .OUT_ld (OUT_ld),      // load a value into the output register
        .OUT_clr(OUT_clr),      // clear the output register
        
        .INPUT  (INPUT),        //Request another byte of input from external input buffer
        .input_empty    (input_empty),
        
        .PS_dbg(PS_dbg));    
    
    // RELATING TO PROGRAM MEMORY
    // Program Counter
    counter PC (
        .CLK    (clk),
        .CE     (PC_en),
        .SCLR   (PC_clr),
        .UP     (PC_up),
        .LOAD   (PC_ld),
        .L      (ST_top),
        .Q      (PC_cnt));
        
    lifo2 #(.WIDTH(16), .DEPTH(255)) STACK(
	    .clk    (clk),
	    .reset  (ST_rst),
	    .q      (ST_top),
        .d      (PC_cnt - 16'b10),
        .empty  (ST_emp),
	    .push   (ST_psh),
	    .pop    (ST_pop));
    
    counter DEPTH (
        .CLK    (clk),
        .CE     (DEPTH_en),
        .SCLR   (DEPTH_clr),
        .UP     (DEPTH_up),
        .LOAD   (1'b0),
        .L      (16'b0),
        .Q      (DEPTH_cnt));
    
    // Block-ROM for storing instructions PROGRAM MEMORY
    brom_8x65k PM (
        .clka   (clk),
        .ena    (1'b1),
        .addra  (PC_cnt),
        .douta  (INSTR));
    
    // RELATING TO TAPE (RAM)
    // TAPE HEAD (HD) 
    counter HEAD (
        .CLK    (clk),
        .CE     (HD_en),
        .SCLR   (HD_clr),
        .UP     (HD_up),
        .LOAD   (1'b0),
        .L      (8'b0),
        .Q      (TP_addr));
    
    //Controls the change to DATA
    mux_4t1_nb  #(.n(8)) TAPE_MUX  (
       .SEL   (TM_sel), 
       .D0    (DATA),       //DEFAULT
       .D1    (DATA + 8'b1),   // +
       .D2    (DATA - 8'b1),   // - 
       .D3    (IN),      // .
       .D_OUT (TP_din) );  
          
    // Block-RAM for storing data (TAPE)
    bram_8x65k TAPE (
        .clka   (clk),
        .rsta   (1'b0),
        .wea    (TP_we),
        .addra  (TP_addr),
        .dina   (TP_din),
        .douta  (DATA),
        .rsta_busy  (TP_rst_busy));
    
//    //Output Register (for entering loop)
//    reg_nb_sclr #(.n(8)) OUT_REG (
//        .data_in  (DATA), 
//        .ld       (OUT_ld), 
//        .clk      (clk), 
//        .clr      (OUT_clr), 
//        .data_out (OUT)); 
    always @(DATA) begin
        OUT = DATA;
    end
endmodule
