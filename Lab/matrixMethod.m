function [y] = matrixMethod(x,h)
    xlen = length(x);
    hlen = length(h);
    L = xlen+hlen-1;
    D = zeros(hlen,xlen);
    for i = 1:hlen
        for j = 1:xlen
            D(i,j)=h(i).*x(j);
        end
    end
    
    y=zeros(1,L);
    for k = 1:L
        for i = 1:hlen
            for j = 1:xlen
                if(i+j==k+1)
                    y(k)=y(k)+D(i,j);
                end
            end
        end
    end
    
end 
