clc;
clear all;
close all;
[Y,Fs]=audioread("handel.wav");
sig=zeros(8,1);
sig(3,1)=40;
sig(7,1)=40;
z=zeros(length(Y),1);
for i=1:8:length(Y)-8
    x=fft(Y(i:i+7))+sig;
    z(i:i+7)=ifft(x);
end
audiowrite("AudioWithBeep2.wav",z,Fs);
% Audio Filtering
h=[1,-2*cos(pi/2),1];
y=conv(z,h);
audiowrite('FilteredAudio.wav',y,Fs);