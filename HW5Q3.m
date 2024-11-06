clear all;
close all;
clc;

N = 5000; %population
S = zeros(1, N);
I = zeros(1, N);
R = zeros(1, N);
S(1) = 4999;
I(1) = 1;
R(1) = 0;

B = 1.5; %unit 1/day
r = 0.75; %unit 1/day
R0 = 2;

deltaT = 0.01; %unit day
time = linspace(0, 30, 3000);

for k = 1:3000
    S(k+1) = S(k) - ((deltaT)*(B*I(k))*(S(k)))/N;
    I(k+1) = I(k) + ((deltaT)*(B*I(k))*(S(k)))/N - (deltaT)*(r)*(I(k));
    R(k+1) = R(k) + (deltaT)*(r)*(I(k));
end

figure;
hold on;
plot(k, S);
plot(k, I);
plot(k, R);
grid on;
