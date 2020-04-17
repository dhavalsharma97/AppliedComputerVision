%% Clear all figures and initialize the parameters
clc;
clear all;
close all;

% Initialize the input image
input_image = im2single(imread('.\data\nitro.jpg'));
input_image = rgb2gray(input_image);

% Declare the position of the x and y of the template image
original_x = 170;
original_y = 90;

% Initialize the template image
template_image = im2single(imread('.\data\nitro_eye.jpg'));
template_image = rgb2gray(template_image);
[fm1, fn1] = size(template_image);


%% Visualize the results and save corresponding outputs
% Zero Mean Correlation
ZMC =  zero_mean_corr(input_image, template_image);
[mx, ind] = max(ZMC(:));
[y, x] = ind2sub(size(ZMC), ind);
ZMC_error = sqrt((original_x - x).^2 + (original_y - y).^2);

% Result Image
figure(1)
imshow(ZMC,[]);
imwrite(ZMC, './results/ZMC_Fixed.jpg');

% Thresholded Image
figure(2)
imshow(ZMC > 0.9 * max(ZMC(:)), []);
imwrite(ZMC > 0.9 * max(ZMC(:)), './results/ZMC_Fixed_Threshold.jpg');


% Sum of Squared Difference
SSD = sum_of_sq_diff(input_image,template_image);
[mx, ind] = max(SSD(:));
[y, x] = ind2sub(size(SSD), ind);
SSD_error = sqrt((original_x - x).^2 + (original_y - y).^2);

% Result Image
figure(3);
imshow(SSD,[]);
imwrite(SSD, './results/SSD_Fixed.jpg');

% Thresholded Image
figure(4);
imshow(SSD > 0.9 * max(SSD(:)), []);
imwrite(SSD > 0.9 * max(SSD(:)), './results/SSD_Fixed_Threshold.jpg');


% Normalized Cross Correlation
NCC = normxcorr2(template_image,input_image);

[mx, ind] = max(NCC(:));
[y, x] = ind2sub(size(NCC), ind);
NC_error = sqrt((original_x - x).^2 + (original_y - y).^2);

% Result Image
figure(5)
imshow(NCC,[]);
imwrite(NCC, './results/NCC_Fixed.jpg');

% Thresholded Image
figure(6)
imshow(NCC > 0.9 * max(NCC(:)), []);
imwrite(NCC > 0.9 * max(NCC(:)), './results/NCC_Fixed_Threshold.jpg');


%% Print the corresponding errors
fprintf('Error from ZMC - %f\n', ZMC_error);
fprintf('Error from SSD - %f\n', SSD_error);
fprintf('Error from NC  - %f\n', NC_error);