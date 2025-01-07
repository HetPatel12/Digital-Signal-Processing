clc;
close all;
clear all;

n=0:99;
h1 = [1,1];
h2 = [1,-1];
h3 = (1/3)*[1,1,1];
h4 = (1/4)*[1,1,-4,1,1];
f = [0,1/10,1/5,1/4,1/2];

for i=1:length(f)
    figure;
    x = cos(2*pi*n*f(i));
    [Y1,H1] = MyLinConv(x,h1);
    subplot(8,1,1);
    stem(Y1);
    subplot(8,1,2);
    z1 = conv(x,h1);
    stem(z1);

    [Y2,H2] = MyLinConv(x,h2);
    subplot(8,1,3);
    stem(Y2);
    subplot(8,1,4);
    z2 = conv(x,h2);
    stem(z2);
    [Y3,H3] = MyLinConv(x,h3);

    subplot(8,1,5);
    stem(Y3);
    subplot(8,1,6);
    z3 = conv(x,h3);
    stem(z3);

    [Y4,H4] = MyLinConv(x,h4);
    subplot(8,1,7);
    stem(Y4);
    subplot(8,1,8);
    z4 = conv(x,h4);
    stem(z4)
end

