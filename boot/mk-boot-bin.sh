#!/bin/bash
source /opt/Xilinx/Vivado/2023.2/settings64.sh
#bootgen -arch zynq -image zed.bif -o BOOT.BIN -w
bootgen -arch zynq -image $1 -o BOOT.BIN -w
