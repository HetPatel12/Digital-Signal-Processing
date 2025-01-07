clc;
clear all;
close all;

[x, fs] = audioread("input.wav",[1,1e4]);
y1 = myCompression(x,1e4);
y2 = dct(x);

x1 = myDeCompression(y1,1e4);
x2 = idct(y2);

z = mse(x1-x2);
z2 = mse(y1-y2);
disp(z);
disp(z2);