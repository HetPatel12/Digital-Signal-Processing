clc;
clear all;
close all;

f=3000;
A = 1;
fs = 1e5;
n = 0:1:4*(fs/f);

x = A * sin(2*pi*f*n*(1/fs));

L = [8,16,32,64];

for i=1:4
    step = (max(x) - min(x))/L(i);
    qlevel = (min(x) + (step/2)) : (step) : (max(x) - (step/2));
    sigp = ((x-min(x))/step) + 1/2;
    qindex = round(sigp);
    qindex = min(qindex,L(i));
    Xq = qlevel(qindex);
    N = ceil(log2(L(i)));
    st = dec2bin(qindex-1,N);
    disp(L(i));
    display(st);
end

