function [Im1] = my_comp(Im)

[M,N]=size(Im);
beta=[sqrt(1/2),ones(1,N-1)];
Im1=zeros(M,N);
for k=1:M
    for l=1:N
        for i=1:N
            for j=1:N
           Im1(k,l)=Im1(k,l)+Im(i,j)*cos(pi*2*(i-1)+1*(k-1)/2*N)*cos(pi*2*(j-1)+1*(l-1)/2*N);
           
 
            end
        end
        Im1(k,l)=sqrt(1/(2*N))*beta(k)*beta(l)*Im1(k,l);
    end
end
end

