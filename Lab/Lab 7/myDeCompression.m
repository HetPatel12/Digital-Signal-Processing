function z = myDeCompression(y,N)

w1 = 1/sqrt(N);
w2 = sqrt(2/N);
z = zeros(1,N);
for k = 1:N
    temp = 0;
    for l = 1:N
        if(l==1)
            w=w1;
        else
            w=w2;
        end
        temp = temp + (w*y(l)*cos(pi*(1/(2*N))*((2*k)-1)*(l-1)));
    end
    z(k) = temp;
end