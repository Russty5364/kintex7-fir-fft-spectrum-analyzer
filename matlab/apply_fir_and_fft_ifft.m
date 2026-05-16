%%apply_fir_and_fft
clear;
clc;
close all;

Fs = 1e6;
N = 4096;
t = (0:N-1)/Fs;

f_sig = 50e3;
f_int = 180e3;

sig_useful = 0.8 * sin(2*pi*f_sig*t);
sig_interf = 0.3 * sin(2*pi*f_int*t);

noise = 0.05 * rand(1,N);

x = sig_useful + sig_interf + noise ; 

num_taps = 32; 

fc = 100e3;

h = fir1(num_taps - 1, fc/(Fs/2), 'low');

y = filter(h,1,x);

X = fft(x);
Y = fft(y);

X_shift = fftshift(X);
Y_shift = fftshift(Y);

f = (-N/2:N/2-1)*(Fs/N);
x_rec = real(ifft(X));
y_rec = real(ifft(Y));
figure;
plot(f, abs(X_shift), 'LineWidth', 1.2);
hold on;
plot(f, abs(Y_shift), 'LineWidth', 1.2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Double-sided spectrum before and after FIR filtering');
legend('Before filtering', 'After filtering');


x_rec = real(ifft(X));
y_rec = real(ifft(Y));

figure;
subplot(2,1,1);
plot(t, x, 'LineWidth', 1.0);
hold on;
plot(t, x_rec, '--', 'LineWidth', 1.0);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Original and reconstructed input signal');
legend('Original x', 'Reconstructed x');

subplot(2,1,2);
plot(t, y, 'LineWidth', 1.0);
hold on;
plot(t, y_rec, '--', 'LineWidth', 1.0);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered and reconstructed filtered signal');
legend('Filtered y', 'Reconstructed y');



