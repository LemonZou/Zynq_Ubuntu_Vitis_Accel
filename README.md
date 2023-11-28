# Zynq_Ubuntu_Vitis_Accel

在Zynq平台上建立Ubuntu 22.04系统，并搭建XRT运行环境。由于Xilinx官方给出的平台都是基于
PetaLinux工具构建的, PetaLinux工具构建动辄近百GB的硬盘消耗，加上构建过程过于傻瓜化，
不利于操作者学习，另外其构建出的根文件系统要添加命令应用等也没有ubuntu 使用 apt命令直接
安装来得方便，所以本项目不用官方的PetaLinux工具，而是直接制作ubuntu根文件系统。

开发主机: X64 Ubuntu Linux 22.04
测试开发板：ZedBoard
Vitis: 2023.2
XRT: XRT-202310.2.15.225
Zynq linux kernel: linux-xlnx_rebase_v5.15_LTS
Zynq u-boot: u-boot-xlnx_rebase_v2022.01
