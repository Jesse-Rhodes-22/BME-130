clear all;
close all;
clc;

N = 5000; % population
S = zeros(1, N); %Make arrays for S I and R
I = zeros(1, N); 
R = zeros(1, N); 

S(1) = 4999; %Initial values given in problem (starting at 1 not 0 because matlab indexes start at 1)
I(1) = 1;
R(1) = 0;

B = 1.5; %Value of beta given in problem (1/day)
r = 0.75; %Value of recovery rate given in problem (1/day)

deltaT = 0.01; %Value of deltaT given in problem (days)
time = 0:deltaT:30; %Time vector

%Simulation loop
for k = 1:length(time)-1
    S(k+1) = S(k) - ((deltaT) * (B * I(k)) * (S(k))) / N; %Three difference equations solved for in part (c)
    I(k+1) = I(k) + ((deltaT) * (B * I(k)) * (S(k))) / N - (deltaT) * (r) * (I(k));
    R(k+1) = R(k) + (deltaT) * (r) * (I(k));
end

%Plotting results
figure;
hold on; %Keep current plot
plot(time, S(1:length(time)), 'r', 'DisplayName', 'Susceptible (S)'); %plotting S, I, and R curves with labels
plot(time, I(1:length(time)), 'g', 'DisplayName', 'Infected (I)');
plot(time, R(1:length(time)), 'b', 'DisplayName', 'Recovered (R)');
xlabel('Time (days)'); %Axes labels
ylabel('Population');
title('SIR Model Simulation'); %Title of plot
legend show; %Display legend
grid on;