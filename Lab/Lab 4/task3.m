clear all;
close all;
clc;

h=[1,1,1,1,2,2,2,2];
x=[1,1,1,1,1,1,1,1];

M=length(x);
N=length(h);

L=max(M,N);


x=[x,zeros(1,L-M)];
h=[h,zeros(1,L-N)];

H=cirmat(N,h);
Y=H*transpose(x);

D=MyDFT(8);

H_k=D*transpose(h);
X_k=D*transpose(x);
Y_k=H_k.*X_k;
Do=MyIDFT(8);
Yout=(Do*Y_k)/8;

display(Yout)