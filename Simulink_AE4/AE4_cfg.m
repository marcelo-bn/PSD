close all
clear all
clc

% Dados dos geradores de sinais
fa = 8000;
ta = 1/fa;
spf = 256;
v1 = 0.2;
f1 = 500;
G = 0.05;

% Filtro BP IIR Chebyshev II
b_iir = [0.6474 0.4769 -1.1851 -0.1637 1.7400 -0.1637 -1.1851 0.4769 0.6474];
a = [1 2.0918 2.7698 2.6783 2.2404 1.3122 0.5892 0.1819 0.0449];

% Filtro LP FIR Parks-McClellan
b_fir = [-0.0236 -0.0487 -0.0185 0.1222 0.3419 0.5129 0.5129 0.3419 0.122 -0.0185 -0.0487 -0.0236];

