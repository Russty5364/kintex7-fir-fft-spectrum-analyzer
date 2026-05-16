# Fixed-Point Analysis

This note summarizes the fixed-point settings used in the MATLAB FIR model for Week 1 of the project. [file:1]

## Input and coefficient format

The input samples and FIR coefficients were quantized to signed Q1.15 format using MATLAB `fi(...)`. [file:1]  
This means both samples and coefficients use 16-bit signed fixed-point representation with 15 fractional bits. [web:268][web:311]

## Filter output format

The fixed-point FIR output was not kept at the same width as the input. [web:311]  
According to `numerictype(y_fix)`, the filter output uses signed fixed-point format with `WordLength = 37` and `FractionLength = 30`. [web:311]

## Arithmetic settings

The MATLAB fixed-point model used `fimath` settings with `RoundingMethod = Nearest` and `OverflowAction = Saturate`. [web:296]  
Both `ProductMode` and `SumMode` were set to `FullPrecision`, so intermediate products and sums were allowed to grow in width instead of being truncated early. [web:296]

## Exported vectors

The MATLAB script `generate_test_vectors.m` exported three files for RTL verification: input samples, FIR coefficients, and expected FIR output. [file:1]  
Stored integer values were exported with `storedInteger(...)`, which makes the files suitable for comparison against a future SystemVerilog testbench. [page:1][file:1]

## Notes for RTL

For the RTL implementation, the initial working assumption is `DATA_W = 16`, `COEF_W = 16`, `TAPS = 32`, and an accumulator/output width based on the MATLAB result. [file:1]  
Since the MATLAB output type was wider than the input type, the RTL verification flow must account for a wider internal result or apply a clearly defined output quantization stage. [web:311][file:1]
## Summary

- Input format: signed Q1.15
- Coefficient format: signed Q1.15
- FIR output format: signed S37.30
- Exported vectors: ready for SystemVerilog FIR testbench
