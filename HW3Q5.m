clear all;
close all;
clc;

A = [-1.5 -2; 1 0]; %setting up variables for the matrices
B = [0.5; 0];
C = [0 1];
D = 0;

sys = ss(A,B,C,D) %creates a continuous time state-space model for the given parameters

Ts = 0.25; %sampling period
A = [0 1; -5 -2]; %setting up variables for the matrices
B = [0; 3];
C = [0 1];
D = 0;

sys2 = ss(A,B,C,D,Ts) %creates a continuous time state-space model for the given parameters
