clc;
clear all;
close all;

A = 0.5;
f = 3000;
Fs = 1e5;
%n = 0:1:4*(f/fs);
t = linspace(0,4/f,1000);

x = A * cos(2*pi*(f)*t);
subplot(3,1,1);
plot(t,x);
title("Original Signal");