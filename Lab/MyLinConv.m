function[Y,H] = MyLinConv(x,h)
    m = length(x);
    n = length(h);
    L = m+n-1;
    x = [x,zeros(1,L-m)];
    h = [h,zeros(1,L-n)];
    Y = zeros(1,L);
    H = zeros(n,L);

    for i=1:L
        for j=1:m
            if(i-j+1>0)
                Y(i) = Y(i) + x(j).*h(i-j+1);
                H(j,i) = h(i-j+1);
            end
        end
    end
end