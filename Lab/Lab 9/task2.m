clc;
clear all;
close all;
% rect
wc=pi/2;
M=31;

for n=0:M
    w=1;
    r=@(w) exp(-1i*w*(n-(M-1)/2));
    Q=integral(r,-pi,-wc);
    y(n+1)=(1/(2*pi))*Q;
    h(n+1)=y(n+1).*w;
end
figure;
freqz(h);

% hamming
for n=0:M
    w2=0.42-0.5*cos(2*pi*n/(M-1))+0.08*cos(4*pi*n/(M-1));
     r=@(w) exp(-1i*w*(n-(M-1)/2));
          Q=integral(r,-pi,-wc);
    y(n+1)=(1/(2*pi))*Q;
    h2(n+1)=y(n+1).*w2;
end
figure;
freqz(h2);

% blackman
for n=0:M
    w3=0.54-0.46*cos(2*pi*n/(M-1));
     r=@(w) exp(-1i*w*(n-(M-1)/2));
     Q=integral(r,-pi,-wc);
     y(n+1)=(1/(2*pi))*Q;
    h3(n+1)=y(n+1).*w3;
end
figure;
freqz(h3);