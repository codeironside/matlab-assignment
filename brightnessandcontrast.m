
img = imread('tobi.jpg');
gray_img = rgb2gray(img);

brightness_adjustment = 50;
bright_img = gray_img + brightness_adjustment;
bright_img(bright_img > 255) = 255; 


contrast_scale = 1.5; % Increase contrast by 50%
contrast_img = imadjust(gray_img, [], [], contrast_scale);
figure;
subplot(1, 3, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(1, 3, 2);
imshow(bright_img);
title('Brightness Adjusted Image');

subplot(1, 3, 3);
imshow(contrast_img);
title('Contrast Adjusted Image');
