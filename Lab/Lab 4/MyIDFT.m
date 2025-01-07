function[D] = MyIDFT(N)
D = zeros(N,N);
for i=1:N
    for k=1:N
        D(i,k) = exp(1j*2*pi*(i-1)*(k-1)/N);
    end
end
end
