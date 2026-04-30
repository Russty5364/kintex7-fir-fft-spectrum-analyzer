
clear;
clc;
close all;
Fs = 1e6; %Частота дискретизации
N = 4096; %Количество отсчетов 
t = (0:N-1)/Fs; %Вектор времени

f_sig = 50e3; %Частота полезного сигнала 
f_int = 180e3; %Частота сигнала помехи;

sig_useful = 0.8 *sin(2*pi*f_sig*t);
sig_interf = 0.3*sin(2*pi*f_int*t);
noise = 0.005*randn(1,N);

x = sig_useful + sig_interf + noise;

figure;
plot (t(1:300), x(1:300), 'LineWidth', 1.2);
grid on;
xlabel('Time(s)');
ylabel('Amplitude');
title('Input signal in time domain');
