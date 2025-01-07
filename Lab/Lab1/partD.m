clc;
clear all;
close all;

A = 0.5;

f = 3000;
fs = 1e5;
n = 0:1:ceil(4*(fs/f));
x = A*cos(2*pi*n*(f/fs));

Fs = [12000,10000,6000,5000,4000];

err=[0,0,0,0,0];


for i=1:5
    n1 = 0:1:(4*(Fs(i)/f));
    x1 = A*cos(2*pi*n1*(f/Fs(i)));
    l1 = 1:length(x1);
    l2 = 1:length(x1)/length(x):length(x1);
    y = interp1(l1,x1,l2);
    err(i) = mean((x(1:length(l2))-y).^2);
    %subplot(5,1,i);
    
end
stem(Fs,err);
