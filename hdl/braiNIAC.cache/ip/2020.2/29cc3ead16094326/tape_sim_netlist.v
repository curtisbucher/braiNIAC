// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Nov 21 12:55:39 2021
// Host        : DESKTOP-0Q7T548 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ tape_sim_netlist.v
// Design      : tape
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "tape,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [7:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.3768 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "tape.mem" *) 
  (* C_INIT_FILE_NAME = "tape.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "65" *) 
  (* C_READ_DEPTH_B = "65" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "65" *) 
  (* C_WRITE_DEPTH_B = "65" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20112)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
