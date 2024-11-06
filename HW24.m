clear all;
close all;
clc;

load('ECG_1min.mat');
fs = 250;
n = length(ecg);
X = fft(ecg);
f = (1:n)*fs/n;

m_plot = round(20/(fs/n));
magnitude = abs(X(2:m_plot)) / n;
Phase = angle(X(2:m_plot));

subplot(2,1,1);
plot(f(1:m_plot-1), magnitude);
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
xlim([0 20]);

phase = unwrap(angle(X));
phase = phase * 360/(2*pi);

subplot(2,1,2);
plot(f(1:m_plot-1), Phase);
title('Unwrapped Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase');
grid on;
xlim([0 20]);

[peak, m_peak] = max(abs(X(2:m_plot)));
max_freq = f(m_peak);

disp(['Max frequency: ' num2str(max_freq)]);
