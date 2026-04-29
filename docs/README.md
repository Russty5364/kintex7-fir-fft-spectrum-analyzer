# kintex7-fir-fft-spectrum-analyzer

Fixed-point FIR filter and FPGA FFT spectrum analyzer on Xilinx Kintex-7.

## Project goal
This project implements a custom fixed-point FIR filter in SystemVerilog and integrates the Xilinx FFT LogiCORE IP to build a small spectral analysis pipeline.

## Planned architecture
Signal source -> FIR filter -> AXI4-Stream adapter -> Xilinx FFT IP -> FFT output capture

## Target platform
- FPGA: Xilinx Kintex-7 XC7K325T-2FFG676C
- Tools: Vivado, MATLAB
- HDL: SystemVerilog

## Status
Day 1: repository structure and project foundation created.
