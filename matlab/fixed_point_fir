%fixed_point_fir
clear;
clc;
close all;

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

y_float = filter(h,1,x);

x_fix = fi(x,1,16,15);
h_fix = fi(h,1,16,15);


y_fix = filter(h_fix, 1, x_fix);

err = y_float - y_fix;

figure;
plot(t, y_float, 'LineWidth',1.0);
hold on;
plot(t, y_fix,'--', 'LineWidth',1.0);
grid on;

xlabel('Time(s)');
ylabel('Amplitude');
title ('Float vs fixed-point FIR output');
legend('Float output','Fixed-point output');


figure;
plot(t, err, 'LineWidth',1.0);
grid on;
xlabel('Time(s)');
ylabel('Error');
title ('Float - fixed-point error');
