clc;
clear all;
close all;

% Rect Window

M = 32;
wc=pi/2;

%lpf
for n=1:M
    W=1;
    r=@(w)exp(-1i*w*(n-(M-1)/2));
    wc=pi/2;
    q=integral(r,-wc,0);
    y(n+1) = q/(2*pi);
    h(n+1) = y(n+1)*W;
end
figure;
freqz(h);

%hamming
for n=1:M
    r=@(w)exp(-1i*w*(n-(M-1)/2));
    %wc=pi/2;
    q=integral(r,-wc,0);
    y(n+1) = q/(2*pi);
    w(n+1) = 0.54-0.46*cos(2*pi*n/(M-1));
    h(n+1) = y(n+1)*w(n+1);
end
figure;
freqz(h);

%blackman
for n=1:M
    r=@(w)exp(-1i*w*(n-(M-1)/2));
    %wc=pi/2;
    q=integral(r,-wc,0);
    y(n+1) = q/(2*pi);
    
    w(n+1)=0.42-0.5*cos(2*pi*n/(M-1))+0.08*cos(4*pi*n/(M-1));
    h(n+1) = y(n+1)*w(n+1);
end
figure;
freqz(h);