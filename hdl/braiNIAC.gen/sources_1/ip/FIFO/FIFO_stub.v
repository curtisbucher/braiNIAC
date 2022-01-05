// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Dec 26 11:20:51 2021
// Host        : DESKTOP-0Q7T548 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Curtis Bucher/OneDrive - Cal
//               Poly/braiNIAC/braiNIAC.gen/sources_1/ip/FIFO/FIFO_stub.v}
// Design      : FIFO
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *)
module FIFO(clk, srst, din, wr_en, rd_en, dout, full, wr_ack, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[7:0],wr_en,rd_en,dout[7:0],full,wr_ack,empty" */;
  input clk;
  input srst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  output [7:0]dout;
  output full;
  output wr_ack;
  output empty;
endmodule
