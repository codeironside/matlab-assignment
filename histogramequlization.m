% Read the grayscale image
img = imread('tobi.jpg');
gray_img = rgb2gray(img);

% Perform histogram equalization
equalized_img = histeq(gray_img);

% Display the original and equalized images
figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(equalized_img);
title('Histogram Equalized Image');
