clc;
clear all;
close all;

x = [1,1,1,1,1,1,1,1];
h = [1,1,1,1,2,2,2,2];

hN = length(h);
xN = length(x);

L = max(xN,hN);

h = [h,zeros(1,L-hN)];
H2 = cirmat(xN,h);

y2 = transpose(H2*transpose(x));

D = MyDFT(L);

Hk = D * transpose(h);
Xk = D * transpose(x);

yk = Hk.*Xk;
D0 = MyIDFT(L);
Y_out = transpose(1/L * abs(D0*yk));
H = cirmat(xN,h);
D8 = MyDFT(L);
Xf = D8*transpose(x);
Hf = D8*H*inv(D8);
Yf = Hf*Xf;
y = inv(D8)*Yf;
y = transpose(abs(y));

display(y);
display(Yf);