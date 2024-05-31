% Read the grayscale image
img = imread('tobi.jpg');
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Convert image to double precision for DCT
img_double = double(gray_img);

% Define the block size
block_size = 8;

% Get the size of the image
[height, width] = size(img_double);

% Pad the image so that its dimensions are multiples of block_size
padded_height = ceil(height / block_size) * block_size;
padded_width = ceil(width / block_size) * block_size;
padded_img = padarray(img_double, [padded_height - height, padded_width - width], 'post');

% Create a DCT matrix
dct_matrix = dctmtx(block_size);

% Quantization matrix for luminance
Q = [16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];

% Initialize the reconstructed image
reconstructed_img = zeros(padded_height, padded_width);

% Process each block
for i = 1:block_size:padded_height
    for j = 1:block_size:padded_width
        % Extract the block
        block = padded_img(i:i+block_size-1, j:j+block_size-1);
        
        % Apply DCT
        dct_block = dct_matrix * block * dct_matrix';
        
        % Quantize the DCT coefficients
        quant_dct_block = round(dct_block ./ Q);
        
        % Dequantize the DCT coefficients
        dequant_dct_block = quant_dct_block .* Q;
        
        % Apply inverse DCT
        idct_block = dct_matrix' * dequant_dct_block * dct_matrix;
        
        % Store the reconstructed block
        reconstructed_img(i:i+block_size-1, j:j+block_size-1) = idct_block;
    end
end

% Crop the padded area to original image size
reconstructed_img = reconstructed_img(1:height, 1:width);

% Convert the reconstructed image back to uint8
reconstructed_img = uint8(reconstructed_img);

% Display the original and compressed images
figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(reconstructed_img);
title('Reconstructed Image after DCT Compression');
% Read the grayscale image
img = imread('tobi.jpg');
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Convert image to double precision for DCT
img_double = double(gray_img);

% Define the block size
block_size = 8;

% Get the size of the image
[height, width] = size(img_double);

% Pad the image so that its dimensions are multiples of block_size
padded_height = ceil(height / block_size) * block_size;
padded_width = ceil(width / block_size) * block_size;
padded_img = padarray(img_double, [padded_height - height, padded_width - width], 'post');

% Create a DCT matrix
dct_matrix = dctmtx(block_size);

% Quantization matrix for luminance
Q = [16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];

% Initialize the reconstructed image
reconstructed_img = zeros(padded_height, padded_width);

% Process each block
for i = 1:block_size:padded_height
    for j = 1:block_size:padded_width
        % Extract the block
        block = padded_img(i:i+block_size-1, j:j+block_size-1);
        
        % Apply DCT
        dct_block = dct_matrix * block * dct_matrix';
        
        % Quantize the DCT coefficients
        quant_dct_block = round(dct_block ./ Q);
        
        % Dequantize the DCT coefficients
        dequant_dct_block = quant_dct_block .* Q;
        
        % Apply inverse DCT
        idct_block = dct_matrix' * dequant_dct_block * dct_matrix;
        
        % Store the reconstructed block
        reconstructed_img(i:i+block_size-1, j:j+block_size-1) = idct_block;
    end
end

% Crop the padded area to original image size
reconstructed_img = reconstructed_img(1:height, 1:width);

% Convert the reconstructed image back to uint8
reconstructed_img = uint8(reconstructed_img);

% Display the original and compressed images
figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(reconstructed_img);
title('Reconstructed Image after DCT Compression');
