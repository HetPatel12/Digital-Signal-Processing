clc;
close all;

Fs = [10000,12000,6000,5000,4000];
A = 0.5;
f = 3000;
N=4;
for i=1:5
   n1 = 0:1:4*(Fs/f);
   x1 = A*cos(2*pi*n1*(f/Fs(i)));
   subplot(5,1,i);
   stem(n1,x1);

end