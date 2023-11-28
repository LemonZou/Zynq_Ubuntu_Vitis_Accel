// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Mon Nov 27 13:27:03 2023
// Host        : ZWJ-HP-ZHAN-99 running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vitis_design_FFT_1_0_stub.v
// Design      : vitis_design_FFT_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "FFT,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_CONTROL_AWADDR, 
  s_axi_CONTROL_AWVALID, s_axi_CONTROL_AWREADY, s_axi_CONTROL_WDATA, s_axi_CONTROL_WSTRB, 
  s_axi_CONTROL_WVALID, s_axi_CONTROL_WREADY, s_axi_CONTROL_BRESP, s_axi_CONTROL_BVALID, 
  s_axi_CONTROL_BREADY, s_axi_CONTROL_ARADDR, s_axi_CONTROL_ARVALID, 
  s_axi_CONTROL_ARREADY, s_axi_CONTROL_RDATA, s_axi_CONTROL_RRESP, s_axi_CONTROL_RVALID, 
  s_axi_CONTROL_RREADY, ap_clk, ap_rst_n, interrupt, x_in_TVALID, x_in_TREADY, x_in_TDATA, 
  x_in_TKEEP, x_in_TSTRB, x_in_TLAST, y_out_TVALID, y_out_TREADY, y_out_TDATA, y_out_TKEEP, 
  y_out_TSTRB, y_out_TLAST)
/* synthesis syn_black_box black_box_pad_pin="s_axi_CONTROL_AWADDR[3:0],s_axi_CONTROL_AWVALID,s_axi_CONTROL_AWREADY,s_axi_CONTROL_WDATA[31:0],s_axi_CONTROL_WSTRB[3:0],s_axi_CONTROL_WVALID,s_axi_CONTROL_WREADY,s_axi_CONTROL_BRESP[1:0],s_axi_CONTROL_BVALID,s_axi_CONTROL_BREADY,s_axi_CONTROL_ARADDR[3:0],s_axi_CONTROL_ARVALID,s_axi_CONTROL_ARREADY,s_axi_CONTROL_RDATA[31:0],s_axi_CONTROL_RRESP[1:0],s_axi_CONTROL_RVALID,s_axi_CONTROL_RREADY,ap_rst_n,interrupt,x_in_TVALID,x_in_TREADY,x_in_TDATA[63:0],x_in_TKEEP[7:0],x_in_TSTRB[7:0],x_in_TLAST[0:0],y_out_TVALID,y_out_TREADY,y_out_TDATA[63:0],y_out_TKEEP[7:0],y_out_TSTRB[7:0],y_out_TLAST[0:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input [3:0]s_axi_CONTROL_AWADDR;
  input s_axi_CONTROL_AWVALID;
  output s_axi_CONTROL_AWREADY;
  input [31:0]s_axi_CONTROL_WDATA;
  input [3:0]s_axi_CONTROL_WSTRB;
  input s_axi_CONTROL_WVALID;
  output s_axi_CONTROL_WREADY;
  output [1:0]s_axi_CONTROL_BRESP;
  output s_axi_CONTROL_BVALID;
  input s_axi_CONTROL_BREADY;
  input [3:0]s_axi_CONTROL_ARADDR;
  input s_axi_CONTROL_ARVALID;
  output s_axi_CONTROL_ARREADY;
  output [31:0]s_axi_CONTROL_RDATA;
  output [1:0]s_axi_CONTROL_RRESP;
  output s_axi_CONTROL_RVALID;
  input s_axi_CONTROL_RREADY;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
  output interrupt;
  input x_in_TVALID;
  output x_in_TREADY;
  input [63:0]x_in_TDATA;
  input [7:0]x_in_TKEEP;
  input [7:0]x_in_TSTRB;
  input [0:0]x_in_TLAST;
  output y_out_TVALID;
  input y_out_TREADY;
  output [63:0]y_out_TDATA;
  output [7:0]y_out_TKEEP;
  output [7:0]y_out_TSTRB;
  output [0:0]y_out_TLAST;
endmodule
