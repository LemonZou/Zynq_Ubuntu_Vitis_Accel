
#include <cstring>
#include <iostream>
#include <numbers>
#include <cmath>

// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"

#define DATA_SIZE	1024
#define ITS			12

typedef float dtype;
typedef float wtype;
typedef struct
{
    dtype real;
    dtype imag;
}cplx;

int main(int argc, char** argv) 
{
    // Read settings
    std::string binaryFile = argv[1];
    int device_index = 0;

    if (argc != 2) 
    {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
        return EXIT_FAILURE;
    }

    std::cout << "Open the device" << device_index << std::endl;
    auto device = xrt::device(device_index);
    std::cout << "Load the xclbin " << binaryFile << std::endl;
    auto uuid = device.load_xclbin(binaryFile);
    
	// Starting the input mm2s kernels
	std::cout << "Starting the input mm2s kernels" << std::endl;
	auto in_0 = xrt::kernel(device, uuid, "mm2s:{mm2s_1}");

	int bsize = DATA_SIZE * sizeof(cplx);
	std::cout << "in_0_bo xrt::bo" << std::endl;
	auto in_0_bo = xrt::bo(device, bsize, XCL_BO_FLAGS_NONE, in_0.group_id(0));
	auto in_0_bo_mapped = in_0_bo.map<cplx*>();

	// Starting the output s2mm kernels
	std::cout << "Starting the output s2mm kernels" << std::endl;
	auto out = xrt::kernel(device, uuid, "s2mm:{s2mm_1}");

	std::cout << "out_bo xrt::bo" << std::endl;
	auto out_bo = xrt::bo(device, bsize, XCL_BO_FLAGS_NONE, out.group_id(0));
	auto out_bo_mapped = out_bo.map<cplx*>();

	// Starting the FFT kernel
	std::cout << "Starting the FFT kernel" << std::endl;
	auto dut = xrt::kernel(device, uuid, "FFT:{FFT_1}");

    float x[DATA_SIZE];
    float y[DATA_SIZE];
    for(int it = 0; it < ITS; it++)
    {
		std::cout << "it ==> " << it << std::endl;
		//setting input data
		for (int i = 0; i < DATA_SIZE; i++)
		{
			x[i] = cos(0.25 * std::numbers::pi * i);
			in_0_bo_mapped[i].real = x[i];
			in_0_bo_mapped[i].imag = 0;
		}

		std::cout << "in_0_bo.sync" << std::endl;
		in_0_bo.sync(XCL_BO_SYNC_BO_TO_DEVICE);
		std::cout << "in_0_run" << std::endl;
		auto in_0_run = in_0(in_0_bo, nullptr, DATA_SIZE);

		std::cout << "out_run" << std::endl;
		auto out_run = out(out_bo, nullptr, DATA_SIZE);

		std::cout << "dut_run" << std::endl;
		auto dut_run = dut(nullptr, nullptr);
		
		std::cout << "Waiting for kernels to end..." << std::endl;
		std::cout << "Waiting for in_0_run" << std::endl;
		in_0_run.wait();
		std::cout << "Waiting for dut_run" << std::endl;
		dut_run.wait();
		std::cout << "Waiting for out_run" << std::endl;
		out_run.wait();
		
		// Retrieving the results
		std::cout << "Retrieving the results" << std::endl;
		out_bo.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

		for (int i = 0; i < DATA_SIZE; i++)
		{
			y[i] = sqrt(out_bo_mapped[i].real * out_bo_mapped[i].real + 
						out_bo_mapped[i].imag * out_bo_mapped[i].imag);
		}
	}

    float max = y[0];
    int max_idx = 0;
    for(int i = 1;i < DATA_SIZE; i++)
    {
    	if(y[i] > max)
    	{
    		max = y[i];
    		max_idx = i;
    	}
    }
    if(max_idx / (float)DATA_SIZE * 2 != 0.25)
    {
    	std::cout << "Fail!\n" << std::endl;
    	return 1;
    }

    std::cout << "TEST PASSED." << std::endl;
    
    return 0;
}

