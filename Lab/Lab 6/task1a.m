clc;
clear all;
close all;

Im= imread("cameraman.tif");
[M,N]= size(Im);
dct_coeff = dct2(Im);
z = zeros(M,N);

for i = 1 : M
    for j = 1 : N
        if (i <= M/2 && j <= N/2)
            z(i, j) = dct_coeff(i,j);
        else
            z(i, j) = z(i, j);
        end
    end
end

ans = imshow(uint8(z));

recons_img = idct2(z);

subplot(1,2,1);
imshow(Im);
title('Original Image');

subplot(1,2,2);
imshow(uint8(recons_img));
title('Reconstructed Image');