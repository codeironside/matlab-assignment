% Read the grayscale image
img = imread('tobi.jpg');
gray_img = rgb2gray(img);

% Convert image to double precision for DCT
img_double = double(gray_img);

% Define the block size
block_size = 8;

% Create a DCT matrix
dct_matrix = dctmtx(block_size);

% Create a function handle for DCT and inverse DCT
dct = @(block_struct) dct_matrix * block_struct.data * dct_matrix';
idct = @(block_struct) dct_matrix' * block_struct.data * dct_matrix;

% Apply DCT to each block
dct_img = blockproc(img_double, [block_size block_size], dct);

% Quantization matrix for luminance
Q = [16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];

quant_dct_img = blockproc(dct_img, [block_size block_size], @(block_struct) round(block_struct.data ./ Q));

dequant_dct_img = blockproc(quant_dct_img, [block_size block_size], @(block_struct) block_struct.data .* Q);

reconstructed_img = blockproc(dequant_dct_img, [block_size block_size], idct);

reconstructed_img = uint8(reconstructed_img);

figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(reconstructed_img);
title('Reconstructed Image after JPEG Compression');
