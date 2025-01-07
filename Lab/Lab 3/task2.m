clc;
close all;
clear all;

n=0:99;
h1 = [1,1];
h2 = [1,-1];
h3 = (1/3)*[1,1,1];
h4 = (1/4)*[1,1,-4,1,1];
f = [0,1/10,1/5,1/4,1/2];

n1 = 0:1;
n2 = 0:1;
n3 = 1:1;
n4 = 2:2;

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
    y1 = MyLinConv(x,h1);
    y2 = MyLinConv(x,h2);
    y3 = MyLinConv(x,h3);
    y4 = MyLinConv(x,h4);

    n1 = linspace(0,1,length(y1));
    n2 = linspace(0,1,length(y2));
    n3 = linspace(-1,1,length(y3));
    n4 = linspace(-2,2,length(y4));

    
    [Y1,H1] = MyLinConv(x,h1);
    subplot(8,1,1);
    stem(n1,y1);
    subplot(8,1,2);
    z1 = conv(x,h1);
    stem(n1,z1);

    [Y2,H2] = MyLinConv(x,h2);
    subplot(8,1,3);
    stem(n2,y2);
    subplot(8,1,4);
    z2 = conv(x,h2);
    stem(n2,z2);

    [Y3,H3] = MyLinConv(x,h3);
    subplot(8,1,5);
    stem(n3,y3);
    subplot(8,1,6);
    z3 = conv(x,h3);
    stem(n3,z3);

    [Y4,H4] = MyLinConv(x,h4);
    subplot(8,1,7);
    stem(n4,y4);
    subplot(8,1,8);
    z4 = conv(x,h4);
    stem(n4,z4)
end

