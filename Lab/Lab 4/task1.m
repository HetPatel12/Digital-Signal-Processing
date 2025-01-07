clc;
close all;
clear all;

x = [1,2,3,4];
h = [2,1,2,1];

M = length(x);
N = length(h);

L = max(M,N);
x = [x, zeros(1,L-M)];
h = [h, zeros(1,L-N)];

H = cirmat(N,h);
Y = H * transpose(x);
y = cconv(x,h);

x1 = zeros(1,10);
h = [h,zeros(1,length(x1)-N)];

for i=1:10
    x1(i) = 0.5^(i-1);
end

H1 = cirmat(10,h);
Y1 = (H1*transpose(x1));
y1 = cconv(x1,h,length(x1));

display(H);
display(Y);
display(y);

display(H1);
display(Y1);
display(y1);
