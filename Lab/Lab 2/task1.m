clc;
clear all;
close all;

f=3000;
A = 1;
fs = 1e5;
n = 0:1:4*(fs/f);

x = A * sin(2*pi*f*n*(1/fs));

stem(n,x);
title('sampled signal');
