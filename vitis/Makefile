VPP := $(XILINX_VITIS)/bin/v++
TARGET:= hw
DEVICE:= 

SRCS := FFT.cpp  mm2s.cpp  s2mm.cpp

# kernel targets
KRNL_XO := $(SRCS:%.cpp=%.$(TARGET).xo)
XCLBIN := FFT.$(TARGET).xclbin

VPP_OPTS := -s -t $(TARGET) --platform $(DEVICE)
VPP_OPTS += --temp_dir ./all_builds/$(TARGET)
VPP_OPTS += --report_dir ./all_logs/$(TARGET)
VPP_OPTS += --log_dir ./all_logs/$(TARGET)
LNK_OPTS = --config ./system.cfg

# primary build targets
.PHONY: xclbin host all

xclbin:  $(XCLBIN)

all: xclbin 

clean:
	-$(RM) $(HOST_EXE) $(XCLBIN) 

cleanall: clean	
	rm -rf all_* *.log *.xclbin *.compile_summary *.link_summary *.info *.xo .ipcache .Xil

# kernel rules
%.$(TARGET).xo: %.cpp
	$(RM) $@
	$(VPP) $(VPP_OPTS) -c -k $(basename $?) -I'$(<D)' -o $@ $?

$(XCLBIN): $(KRNL_XO) 
	$(VPP) $(VPP_OPTS) $(LNK_OPTS) -l -o $@ $(KRNL_XO) 

