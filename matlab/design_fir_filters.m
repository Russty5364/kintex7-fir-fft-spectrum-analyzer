% design_fir_filters.m
clear;
clc;
close all;

Fs = 1e6;      % Частота дискретизации
num_taps = 32; % Количество коэффициентов фильтра
fc = 100e3;    % Частота среза

h = fir1(num_taps - 1, fc/(Fs/2),'low');
% fir1 стандартная функция матлаб для проектирования FIR-фильтра 
% (num_taps - 1) порядок фильтра
% fc/(Fs/2) нормированная частота, т.к. fir1 задаёт частоту относительно
% частоты Найквиста(половины частоты дискретизации)

[H, f] = freqz(h,1,2048,Fs);

figure;
plot(f,20*log10(abs(H)), 'LineWidth',1.2);
grid on;

xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('FIR low-pass filter magnitude response');
