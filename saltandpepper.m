
noisy_img = imread('tobi.jpg');
gray_noisy_img = rgb2gray(noisy_img);
filtered_noisy_img = medfilt2(gray_noisy_img, [3 3]); 
figure;
subplot(1, 2, 1);
imshow(gray_noisy_img);
title('Noisy Grayscale Image');
subplot(1, 2, 2);
imshow(filtered_noisy_img);
title('Filtered Image with Median Filter');
