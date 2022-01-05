`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Bucher Design
// Engineer: Curtis Bucher
// 
// Create Date: 11/21/2021 10:12:39 AM
// Design Name: braiNIAC
// Module Name: fsm
// Project Name: braiNIAC II
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


module fsm (
        input [2:0] instr,  // The current instruction (ROM) (INSTR)
        input [7:0] data,   // The current tape value. (DATA)
        input ST_emp,       // The loop depth is current zero. (The stack is empty)
        input DEPTH_one,   // When the depth count is zero
        input TP_rst_busy,
        input clk,
        
        output reg PC_en,       // enable the PROGRAM COUNTER
        output reg PC_ld,       // load the program counter
        output reg PC_clr,      // clear the PROGRAM COUNTER
        output reg PC_up,       // increment the PROGRAM COUNTER
        
        output reg DEPTH_clr,   // clear the depth counter
        output reg DEPTH_en,    // enable the depth counter
        output reg DEPTH_up,    // increment (not decrement) depth
        
        output reg ST_rst,      // clear the LOOP STACK
        output reg ST_pop,      // pop from the LOOP STACK
        output reg ST_psh,      // push to the LOOP STACK
        
        output reg HD_en,       // enable the TAPE HEAD counter
        output reg HD_clr,      // clear the TAPE HEAD counter
        output reg HD_up,       // increment the TAPE HEAD counter
        
        output reg TP_we,       // write enable the TAPE (RAM)
        output reg [1:0] TM_sel,      // Selects the input to the TAPE (0 : DATA, 1 : DATA + 1, 2 : DATA - 1, 3 : INPUT)
        output reg OUT_ld,      // load a value into the output register
        output reg OUT_clr,     // clear the output register
        
        output reg INPUT,       //request another byte of input from the input buffer
        input input_empty,      // When the input buffer is empty
        
        output [3:0] PS_dbg);    // For debugging
        
        // NS and PS registers
        reg [3:0] NS, PS;
        assign PS_dbg = PS;     // For debugging
        
        //Defining states
        parameter [3:0] // INSTRUCTIONS
                        st_inst_plus    = 0,    // +: inc DATA
                        st_inst_minus   = 1,    // -: dec DATA
                        st_inst_right   = 2,    // >: inc TAPE HEAD
                        st_inst_left    = 3,    // <: dec TAPE HEAD
                        st_inst_enter   = 4,    // [: if DATA == 0: jump to corresponding ] else enter loop
                        st_inst_exit    = 5,    // ]: if DATA != 0: jump to corresponding [ else exit loop
                        st_inst_output  = 6,    // .: print output (latch register) and toggle output
                        st_inst_input   = 7,    // ,: receive input from buffer
                        
                        //STARTUP
                        st_start        = 8,    // Starting state
                        st_reset        = 9,    // Resetting memory (particularly RAM, needs to wait untill TP_RST_BUSY is toggled)
                        st_prep         = 10,

                        // SUPPORTING
                        st_loop_search  = 11,   // When jumping from [ to ]
                        st_delay        = 12,   // Used after a shift instruction, so Tape Read can update for one clock cycle
                        st_delay_no_pc  = 13,
                        
                        st_wait_for_input = 14, // Used when collecting input, waits untill input is available
                        st_store_input = 15;  // Used to load data from input to tape. Done after toggling input to update line in buffer
                        //When get past 16 states will need to bump up bit count of NS, PS

        // Defining instructions
        parameter [2:0] inst_plus    = 0,   // +
                        inst_minus   = 1,   // -
                        inst_right   = 2,   // >
                        inst_left    = 3,   // <
                        inst_enter   = 4,   // [
                        inst_exit    = 5,   // ]
                        inst_output  = 6,   // .
                        inst_input   = 7;   // ,
        
        // Model State Registers
        always @(posedge clk) PS <= NS;
        
        // Model Combinatorial NS and OUT decoders
        always @(instr, data, ST_emp, DEPTH_one, PS, TP_rst_busy, input_empty) begin
        
            // Default output behavior
            PC_en = 1;       // enable the PROGRAM COUNTER
            PC_ld = 0;       // load the PROGRAM COUNTER
            PC_clr = 0;      // clear the PROGRAM COUNTER
            PC_up = 1;       // increment the PROGRAM COUNTER
            
            ST_rst = 0;      // clear the LOOP STACK
            ST_pop = 0;      // pop from the LOOP STACK
            ST_psh = 0;      // push to the LOOP STACK
        
            HD_en = 0;       // enable the TAPE HEAD counter
            HD_clr = 0;      // clear the TAPE HEAD counter
            HD_up = 0;       // increment the TAPE HEAD counter
            
            DEPTH_en = 0;       // enable the DEPTH counter
            DEPTH_clr = 0;      // clear the DEPTH counter
            DEPTH_up = 0;       // increment the DEPTH counter
        
            TP_we = 0;       // write enable the TAPE (RAM)
            TM_sel = 0;      // Selecting what is fed into TAPE (0 : DATA, 1: DATA+1, 2: DATA-1, 3:INPUT)
            OUT_ld = 0;      // load a value into the output register
            OUT_clr = 0;    // clear the output register
            
            INPUT = 0;
            
            // Default next state behavior, to be overwritten by present state if necessary
            // Universal mealy output regardless of state
           
            case(instr)
                inst_plus   : NS = st_inst_plus;
                inst_minus  : NS = st_inst_minus;
                inst_right  : begin
                    NS = st_inst_right;
                    PC_en = 0;
                end
                inst_left   : begin
                    NS = st_inst_left;
                    PC_en = 0;
                end
                inst_enter  : NS = st_inst_enter;
                inst_exit   : NS = st_inst_exit;
                inst_output : NS = st_inst_output;
                inst_input  : begin
                    NS = st_wait_for_input;
                    PC_en = 0;
                end
                default     : NS = st_start; //FORBIDDEN
             endcase
             
             // MEALY OUTPUT
             // Staying in st_reset, without incrementing PC, untill RAM is ready
             if(TP_rst_busy) begin
                PC_en = 0;
                PC_clr = 1;
             end
             
            // State behavior
            case (PS)
                st_start    : begin     // Starting state
                    //Holding PROGRAM COUNTER until startup
                    PC_en = 0;
                    // Waiting for RAM to be ready to load data. Initial overhead. Signified by TP_rst_busy toggling ~125ns.
                    if(TP_rst_busy) NS = st_reset;
                    else NS = st_start;
                    // Always overwrite default NS
                end
                
                st_reset    : begin     // Booting up: Resetting memory (particularly RAM, needs to wait untill TP_RST_BUSY is toggled)
                    //Resetting all volitile memory
                    HD_clr = 1;
                    OUT_clr = 1;
                    ST_rst = 1;
                    
                    // Waiting for TP_rst_busy to fall from toggle
                    if(TP_rst_busy) NS = st_reset;
                    else begin
                        NS = st_prep;
                    end
                    // otherwise go to default NS
                end
                
                st_prep     : begin
                    // Used for timing reasons. 
                    // Need one clock cycle between reset and the next instruction, 
                    // or else first instruction is accidentally two clock signals while
                    PC_en = 1;
                end
                
                // INSTRUCTIONS
                st_inst_plus    : begin // +: inc DATA
                    TM_sel = 1; // Configuring TAPE input mux to be DATA + 1
                    TP_we = 1;      // Enabling TAPE write
                end
                
                st_inst_minus   : begin // -: dec DATA
                    TM_sel = 2; // Configuring TAPE input mux to be DATA - 1
                    TP_we = 1;      // Enabling TAPE write
                end
                
                st_inst_right   : begin // >: inc TAPE HEAD
                    NS = st_delay;  // delaying 1 clock cycle, so new tape location can be read before incrementing
                    //TODO: implement dual port ram with lookahead to increment in 1 clk cycle
                    
                    HD_en = 1;  // enabling clock for tape head   
                    HD_up = 1;  // incrementing
                    PC_en = 1;
                end
 
                st_inst_left    : begin // <: dec TAPE HEAD
                    NS = st_delay;  // delaying 1 clock cycle, so new tape location can be read before incrementing
                    //TODO: implement dual port ram with lookahead to increment in 1 clk cycle
                    
                    HD_en = 1;  // enabling clock for tape head   
                    HD_up = 0;  // decrementing 
                    PC_en = 1;         
                end
                
                st_inst_enter   : begin // [: if DATA == 0: jump to corresponding ] else enter loop
                    // Skip over loop (st_search) if data == 0
                    if(data == 0) begin
                        NS = st_loop_search;
                        DEPTH_en = 1;
                        DEPTH_up = 1;
                        PC_en = 1;
                    end
                    // Enter loop if DATA != 0, push [ loc to stack
                    else ST_psh = 1; 
                end
                
                st_inst_exit    : begin // ]: if DATA != 0: jump to corresponding [ else exit loop
                    if(data == 0) begin
                        //PC_en = 0;
                        //NS = st_delay; //Delaying one clock cycle
                    end
                    // If data != 0, pop from stack and jump to corresponding [
                    else begin
                        PC_en = 1;
                        PC_ld = 1;
                        NS = st_delay_no_pc;
                    end
                    ST_pop = 1;
                end
                
                st_inst_output  : begin // .: print output (latch register) and toggle output
                    OUT_ld = 1; // Loading output register
                end
                
                st_inst_input   : begin // ,: receive input from buffer, then direct to st_store_input to store to tape
                    INPUT = 1;
                    PC_en = 1;
                    NS = st_store_input;
                end
                
                // SUPPORTING
                st_loop_search  : begin // When jumping from [ to ]
                    //If still searching (depth != 1 or instr != exit)
                    if(!(DEPTH_one && instr == inst_exit)) begin
                        NS = st_loop_search;
                        //If hitting another enter, increment depth counter
                        
                        if(instr == inst_enter) begin
                            DEPTH_en = 1;
                            DEPTH_up = 1;
                        end
                        //If hitting an exit, decrement depth counter
                        else if(instr == inst_exit) begin
                            DEPTH_en = 1;
                            DEPTH_up = 0;
                        end
                    end
                    else begin
                        DEPTH_en = 1;
                        DEPTH_up = 0;
                        NS = st_delay;
                    end
                    PC_en = 1;
                end
                
                st_delay        : begin // Used after a shift instruction, so Tape Read can update for one clock cycle
//                    PC_en = 1; //Must be enabled to create 1 clk cycle instr signal next state
                end
                
                st_delay_no_pc : begin
                    NS = st_delay;
                    PC_en = 1;
                end
                
                st_wait_for_input : begin
                    if(input_empty) begin
                        NS = st_wait_for_input; //If input buffer is still empty, stay in st_wait_for_input
                        PC_en = 0;
                    end
                    else begin
                        NS = st_inst_input;
                        PC_en = 0;
                    end
                end
                
                st_store_input : begin
                    TM_sel = 3; // Configuring TAPE input mux to be INPUT
                    TP_we = 1;     // Enabling TAPE write
                    PC_en = 1;
                end
                
                default         : begin
                    NS = st_start;
                    PC_en = 0; // Holding Program Counter
                end
            endcase
        end
endmodule
