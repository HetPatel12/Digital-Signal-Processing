clc;
clear all;
close all;

A = 0.1:0.1:1;
L = 8;
f = 3000;
fs = 1e5;
n = 0:1:4*(fs/f);
sqnr = zeros(1,length(A));

for i=1:length(A)
    x = A(i) * sin(2*pi*f*n*(1/fs));
    step = (max(x) - min(x))/L;
    qlevel = (min(x) + (step/2)) : (step) : (max(x) - (step/2));
    sigp = ((x-min(x))/step) + 1/2;
    qindex = round(sigp);
    qindex = min(qindex,L);
    Xq = qlevel(qindex);
    nq = mean((x-Xq).^2);
    noise_power = 0.5*(A(i).^2);
    signal_power = nq;
    sqnr(i) = noise_power/nq;
end

%subplot(2,1,1);
stem(A,sqnr);
hold on;
title('amp vs sqnr');

b=3;
%subplot(2,1,2);
th_sqnr = 1.5 * (2^(2*b));
stem(th_sqnr);
title('amp vs theo_sqnr');