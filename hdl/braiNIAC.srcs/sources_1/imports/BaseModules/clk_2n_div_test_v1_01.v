`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 12/04/2019 04:29:28 PM
// Design Name: 
// Module Name: clk_2n_div_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Divides clock by 2^n. Allows for no clock division
//              or clock division based on fclk_only input. 
// 
//              fclk_only = 1 ==> outputs the input clock signal
//              fclk_only = 0 ==> outputs the divided clock signal
//
// Usage: 
//
//      clk_2n_div_test #(.n(25)) MY_DIV (
//          .clockin   (xxxx), 
//          .fclk_only (1),          
//          .clockout  (xxxx)   );  
// 
// Dependencies: 
// 
// Dependencies: 
// 
// Revision:
// Revision 1.00 - (12-05-2019) File Created
//          1.01 - (12-20-2020) changed paramerer location & comments
// 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_2n_div_test  #(parameter n=13) (
   input wire clockin, 
   input wire fclk_only,   
   output reg clockout);  

    reg [n:0] count; 

    always@(posedge clockin) 
    begin 
        count <= count + 1; 
    end 

    always @ (*)
    begin
       if (fclk_only == 1)
          clockout = clockin; 
       else
          clockout = count[n]; 
    end
	
endmodule

`default_nettype wire
