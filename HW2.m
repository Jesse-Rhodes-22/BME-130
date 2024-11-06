clear all
close all
clc

load('Resp.mat');
fs = 125; %sampling frequency
max_freq = 1; %max plotting freq
n = length(Resp); %length of resp signal
f = (1:n) * fs / n; %frequency vector
t = (1:n) / fs; %time vector

X = fft(Resp);
m_plot = round(2/(fs/n));
magnitude = abs(X(2:m_plot)) / n;
figure;
plot(f(1:m_plot-1),magnitude);
grid on;
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
[peak_magnitude, peak_index] = max(magnitude);
respiration_freq = f(peak_index + 1);
breaths = respiration_freq * 60;
disp(['Respiration rate: ' num2str(respiration_freq)]);
disp(['Breaths per minute: ' num2str(breaths)]);
phase = angle(X(2:m_plot));
figure;
plot(f(1:m_plot-1), phase);
grid on;
title('Phase Plot');
xlabel('Frequency (Hz)');
ylabel('Phase');