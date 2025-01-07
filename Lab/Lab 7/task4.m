clc;
clear all;
close all;

[x, fs] = audioread("input.wav",[1,1e4]);

len1 = ceil(length(x)/256);
len2 = len1 * 256;

y = [x;zeros((len2-length(x)),1)];
count=0;

for i=1:256:length(x)
    y1 = y(i:i+255);
    y2 = dct(y1);
    for j=1:256
        if(y2(j)>=-0.01 && y2(j)<0.01)
            y2(j) = 0;
            count = count+1;
        else
            y2(j) = y2(j);
        end
    end
    %y3 = myDeCompression(y2,1e4); 
    y4 = idct(y2);
    %r(i:i+255) = y3;
    r(i:i+255) = y4;
end

for i=1:256:length(x)
    y11 = y(i:i+255);
    y22 = dct(y1,length(y1));
    for j=1:256
        if(y2(j)>=-0.01 && y2(j)<0.01)
            y2(j) = 0;
            count = count+1;
        else
            y2(j) = y2(j);
        end
    end
    y3 = myDeCompression(y2,length(y2)); 
    %y4 = idct(y2);
    z(i:i+255) = y3;
    %r(i:i+255) = y4;
end

display(mse(r-z));
N = 1e4;
cr = (N^2 - count)/(N^2);
display(cr);
