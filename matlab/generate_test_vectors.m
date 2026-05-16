%generate_test_vectors.m
clear;
clc;
close all;
rng(1);
Fs = 1e6;
N = 4096;
t = (0:N-1)/Fs;

f_sig = 50e3;
f_int = 180e3;

sig_useful = 0.8*sin(2*pi*f_sig*t);
sig_interf = 0.3*sin(2*pi*f_int*t);
noise = 0.05*randn(1, N);

x = sig_useful + sig_interf + noise;

num_taps = 32;
fc = 100e3;
h = fir1(num_taps - 1, fc/(Fs/2), 'low');


x_fix = fi(x, 1, 16, 15);
h_fix = fi(h, 1, 16, 15);
y_fix = filter(h_fix, 1, x_fix);
T = numerictype(y_fix)
F = fimath(y_fix)
x_int = storedInteger(x_fix);
h_int = storedInteger(h_fix);
y_int = storedInteger(y_fix);

writematrix(x_int.', 'input_vectors.txt');
writematrix(h_int.', 'fir_coefficients.txt');
writematrix(y_int.', 'expected_output.txt');
