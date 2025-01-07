clc;
close all;
clear all;
[Y,Fs]=audioread("handel.wav");
hiss=zeros(8,1);
hiss(3,1)=40;
hiss(7,1)=40;
z=zeros(length(Y),1);
for i=1:8:length(Y)-8
    x=fft(Y(i:i+7))+hiss;
    z(i:i+7)=ifft(x);
end
audiowrite("AudioWithBeep2.wav",z,Fs);
% Audio Filtering
h=[1,-2*cos(pi/2),1];
y=conv(z,h);
audiowrite('FilteredAudio.wav',y,Fs);
zfilt=[1,1,0,1,1,1,0,1];
for i=1:8:length(z)-8
    X=fft(z(i:i+7));
    y=X.*zfilt';
    filtered_audio(i:i+7)=real(ifft(y));
end
audiowrite("AudioWithoutBeep2.wav",filtered_audio,Fs);