function[H] = cirmat(N,h)
H = zeros(N,N);
Temp = 0;
for i=1:N
    if(i==1)
        H(:,i) = h(:);
    else
        H(1,i) = Temp;
        H(2:N,i) = H(1:N-1,i-1);
        Temp = H(N,i);
    end
end
end