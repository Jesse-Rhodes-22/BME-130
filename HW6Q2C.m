clear all;
close all;
clc;

T1 = 8; %time in min
u0 = 20; %in ug/kg/min
tau = 2; %time constant in min
k = -3.0; %gain in mmHg * kg * min/ug
tfin = 20; %final time in min
t = linspace(0,tfin,1000); %time vector

u = u0 * (heaviside(t)-heaviside(t-T1));

%state-space
A = -1/tau;
B = k/tau;
C = 1;
D = 0;
sys = ss(A,B,C,D);

%system response
[y, tout] = lsim(sys,u,t);

%plotting
figure;
plot(tout, y);
xlabel('Time (min)'); %axes labels
ylabel('MAP (mmHg)');
grid on;

