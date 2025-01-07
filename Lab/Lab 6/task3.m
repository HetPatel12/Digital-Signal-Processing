clc;
clear all;
close all;
img = imread('cameraman.tif');
img = imresize(img, [256, 256]);
N1 = 64;
N2 = 8;
N3 = 64;
img = img(1:N1, 1:N1);
[M, N] = size(img);
no_of_blocks = M/N2;
save = [48, 32, 16, 8];
for k=1:length(save)
    for i = 1:(M/N2)
        for j = 1:(M/N2)
            x(1:N2, 1:N2) = img(N2*(i-1)+1 : N2*(i-1)+N2, N2*(j-1)+1 : N2*(j-1)+N2);
            dct_x = dct2(x);
            dct_x1 = dct_x(:);
            dct_x2 = dct_x1(1:save(k), 1);
            dct_x3 = [dct_x2 ; zeros(N3-save(k), 1)];
            dct_final1 = reshape(dct_x3, [N2, N2]);
            z1(N2*(i-1)+1 : N2*(i-1)+N2, N2*(j-1)+1 : N2*(j-1)+N2) = idct2(dct_final1);
            dct_y = my_comp(x);
            dct_y1 = dct_y(:);
            dct_y2 = dct_y1(1:save(k), 1);
            dct_y3 = [dct_y2 ; zeros(N3-save(k), 1)];
            dct_final2 = reshape(dct_y3, [N2, N2]);
            z2(N2*(i-1)+1 : N2*(i-1)+N2, N2*(j-1)+1 : N2*(j-1)+N2) = idct2(dct_final2);
            
            error(k) = mse(z1, z2);
            p(k) = ((N3.*N3) - ((N3-save(k)).*(N3-save(k))))/(N3.*N3);
        end
    end
end
figure;
stem(error, p);
xlabel("mse");
ylabel("comp ratio");


