%% Clear all figures and initialize the parameters
clc;
clear all;
close all;

% Initialize the scale factors
scale = [2 1 0.5];
sz = size(scale, 2);

% Initialize the input image
image = im2single(imread('.\data\nitro.jpg'));
image = rgb2gray(image);

% Declare the position of the x and y of the template image
original_x = 170;
original_y = 90;

% Initialize the template image
template_image = im2single(imread('.\data\nitro_eye.jpg'));
template_image = rgb2gray(template_image);
[fm1, fn1] = size(template_image);

% Initializing the filter
filter = imresize(template_image, 0.5);
[fm, fn] = size(filter);

%% Looping over scale factors
for i = 1: sz
image1 = imresize(image, scale(i));

[im, in] = size(image1);

figure(i);
subplot(4, 2, 1);
imshow(image1);
subplot(4, 2, 2);
imshow(filter);

%% Visualize the results and save corresponding outputs
% Zero Mean Correlation
ZMC =  zero_mean_corr(image1, filter);
[mx, ind] = max(ZMC(:));
[y, x] = ind2sub(size(ZMC), ind);
ZMC_error = sqrt((original_x - x).^2 + (original_y - y).^2);

% Result Image
subplot(4, 2, 3);
imshow(ZMC, []);

% Thresholded Image
subplot(4, 2, 4);
imshow(ZMC > 0.9 * max(ZMC(:)), []);

% Sum of Squared Difference
SSD = sum_of_sq_diff(image1,filter);
[mx, ind] = max(ZMC(:));
[y, x] = ind2sub(size(ZMC), ind);
SSD_error = sqrt((original_x - x).^2 + (original_y - y).^2);

% Result Image
subplot(4, 2, 5);
imshow(SSD, []);

% Thresholded Image
subplot(4, 2, 6);
imshow(SSD > 0.9 * max(SSD(:)), []);

% Normalized Cross Correlation
NC = normxcorr2(filter, image1);

[mx, ind] = max(NC(:));
[y, xp] = ind2sub(size(NC), ind);
NC_error = sqrt(((original_x*scale(i)) - xp).^2 + ((original_y*scale(i)) - y).^2);

% Result Image
subplot(4, 2, 7);
imshow(NC, []);

% Thresholded Image
subplot(4,2,8);
imshow(NC > 0.9 * max(NC(:)),[]);

%% Print the corresponding errors
fprintf('Sacling Factor - %f\n', scale(i));
fprintf('Error from ZMC - %f\n', ZMC_error);
fprintf('Error from SSD - %f\n', SSD_error);
fprintf('Error from NC  - %f\n', NC_error);

end