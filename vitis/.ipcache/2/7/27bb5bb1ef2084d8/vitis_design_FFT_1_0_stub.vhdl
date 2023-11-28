-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Mon Nov 27 13:27:03 2023
-- Host        : ZWJ-HP-ZHAN-99 running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vitis_design_FFT_1_0_stub.vhdl
-- Design      : vitis_design_FFT_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_CONTROL_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CONTROL_AWVALID : in STD_LOGIC;
    s_axi_CONTROL_AWREADY : out STD_LOGIC;
    s_axi_CONTROL_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CONTROL_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CONTROL_WVALID : in STD_LOGIC;
    s_axi_CONTROL_WREADY : out STD_LOGIC;
    s_axi_CONTROL_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CONTROL_BVALID : out STD_LOGIC;
    s_axi_CONTROL_BREADY : in STD_LOGIC;
    s_axi_CONTROL_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CONTROL_ARVALID : in STD_LOGIC;
    s_axi_CONTROL_ARREADY : out STD_LOGIC;
    s_axi_CONTROL_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CONTROL_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CONTROL_RVALID : out STD_LOGIC;
    s_axi_CONTROL_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    x_in_TVALID : in STD_LOGIC;
    x_in_TREADY : out STD_LOGIC;
    x_in_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    x_in_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    x_in_TSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    x_in_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    y_out_TVALID : out STD_LOGIC;
    y_out_TREADY : in STD_LOGIC;
    y_out_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    y_out_TKEEP : out STD_LOGIC_VECTOR ( 7 downto 0 );
    y_out_TSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    y_out_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_CONTROL_AWADDR[3:0],s_axi_CONTROL_AWVALID,s_axi_CONTROL_AWREADY,s_axi_CONTROL_WDATA[31:0],s_axi_CONTROL_WSTRB[3:0],s_axi_CONTROL_WVALID,s_axi_CONTROL_WREADY,s_axi_CONTROL_BRESP[1:0],s_axi_CONTROL_BVALID,s_axi_CONTROL_BREADY,s_axi_CONTROL_ARADDR[3:0],s_axi_CONTROL_ARVALID,s_axi_CONTROL_ARREADY,s_axi_CONTROL_RDATA[31:0],s_axi_CONTROL_RRESP[1:0],s_axi_CONTROL_RVALID,s_axi_CONTROL_RREADY,ap_clk,ap_rst_n,interrupt,x_in_TVALID,x_in_TREADY,x_in_TDATA[63:0],x_in_TKEEP[7:0],x_in_TSTRB[7:0],x_in_TLAST[0:0],y_out_TVALID,y_out_TREADY,y_out_TDATA[63:0],y_out_TKEEP[7:0],y_out_TSTRB[7:0],y_out_TLAST[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "FFT,Vivado 2023.2";
begin
end;
