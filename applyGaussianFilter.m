% Read the grayscale image
img = imread('tobi.jpg');
gray_img = rgb2gray(img);

% Define the Gaussian filter parameters
filter_size = 5; % Size of the filter (e.g., 5x5)
sigma = 2; % Standard deviation of the Gaussian distribution

% Create the Gaussian filter
gaussian_filter = fspecial('gaussian', filter_size, sigma);

% Apply the Gaussian filter to the grayscale image
filtered_img = imfilter(gray_img, gaussian_filter, 'symmetric');

% Display the original and filtered images
figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(filtered_img);
title('Filtered Image with Gaussian Filter');
