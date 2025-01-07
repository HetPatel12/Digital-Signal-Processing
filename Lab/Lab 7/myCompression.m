function y = myCompression(x,N)
w1 = 1/sqrt(N);
w2 = sqrt(2/N);
y = zeros(1,N);
for k = 1:N
    if(k==1)
        w = w1;
    else
        w = w2;
    end
    temp=0;
    for l = 1:N
            temp = temp +(x(l)*cos(pi*(1/(2*N))*((2*l)-1)*(k-1)));
    end
    y(k) = w*temp;
end