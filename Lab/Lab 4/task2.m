clc;
close all;
clear all;

x = [1,2,3,4];
h = [2,1,2,1];

M = length(x);
N = length(h);
H = zeros(N,N);

x2 = [0,0,0,0,0,0,0,0,0,0];
h2 = [2,1,2,1,0,0,0,0,0,0];

for i=1:10
    x2(i) = 0.5.^(i-1);
end

M2 = length(x2);
N2 = length(h2);
H2 = zeros(N,N);


for n=1:N
    for i=1:N
        index = mod((n-i),N)+1;
        H(n,i) = h(index);
    end
end
Y = cconv(x,h,4);
Y2 = cconv(x2,h2,10);

%display(H)
display(Y)

display(Y2);
