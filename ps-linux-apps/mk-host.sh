#!/bin/bash
g++ -std=c++20 `pkg-config --cflags xrt` $1.cpp -o $1 `pkg-config --libs xrt`

