clear all;
close all;
clc;

%a)
load('EOG.mat');
figure;
plot(t, eog);
xlim([min(t) max(t)]);
ylim([min(eog)-0.2 max(eog)+0.2]);
xlabel('Time [sec]');
ylabel('EOG [V]');
grid on;

%b)
meanEOG = mean(eog);
disp(['The mean of the EOG signal is ' num2str(meanEOG) ' V.'])

%c)
power = mean(eog.*eog);
disp(['The power of the EOG signal is ' num2str(power) ' V^2.'])