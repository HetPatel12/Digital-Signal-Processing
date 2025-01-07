clc;
close all;
img = imread('cameraman.tif');
img = imresize(img, [256, 256]);
img = im2double(img);
final1 = zeros(256);
for i = 1:8:256
    for j = 1:8:256
        img1 = img(i:i+7, j:j+7);
        Im = my_comp(img1);
        Im1 = idct2(Im);
        final1(i:i+7,j:j+7) = Im1;
end
end
final2 = zeros(256);
for i = 1:8:256
    for j = 1:8:256
        img1 = img(i:i+7, j:j+7);
        Im = dct2(img1);
        Im1 = idct2(Im);
        final2(i:i+7,j:j+7) = Im1;
end
end
subplot(1,2,1)
imshow(final1)
subplot(1,2,2)
imshow(final2)
