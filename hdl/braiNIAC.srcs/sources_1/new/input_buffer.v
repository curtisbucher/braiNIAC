`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2021 02:20:01 PM
// Design Name: 
// Module Name: input_buffer
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



module input_buffer(
    input [7:0] data_in,
    input push,
    input reset,
    input clk,
    input INPUT,
    output [7:0] IN,
    output empty
    );
    
    reg wr_en;
    wire wr_ack;
    // First in first out input buffer
    FIFO fifo(
        .clk    (clk),
        .srst   (reset),
        .din    (data_in),
        .wr_en  (wr_en),
        .rd_en  (INPUT),
        .dout   (IN),
        .full   (),
        .wr_ack (wr_ack),
        .empty  (empty));
        
    // Set-Reset latch for converting 'push' pulse into persistant signal that lasts for one clock signal
    initial begin
        wr_en = 0;
    end
    
    always @(posedge push, posedge wr_ack) begin
        wr_en = 0;
        if(push) wr_en = 1;
    end
        
        

endmodule
