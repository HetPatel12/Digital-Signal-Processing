clc;
clear all;

A = 0.5;
f=3000;

Fs = [12000,10000,6000,5000,4000];

for i=1:5
    n1 = 0:1:4*(Fs(i)/f);
    x1 = A* cos(2*pi*n1*(f/Fs(i)));
    y = fft(x1);
    subplot(5,1,i);
    %stem(abs(y));
    stem(n1,x1);
    title("sampling frequency",Fs(i));
end
