% Name - Dhaval Harish Sharma
% Red ID - 824654344
% Applied Computer Vision (CS-696)
% Assignment 1
% Question-1 : Using MATLAB

% Generating a random 100 X 100 grayscale image
arr = rand(100, 100) * 255;
A = uint8(arr);
imshow(A);

% Sorting all the intensities in A, putting the result in a single 
% 10,000 dimensional vector x and plotting the array
[row, col] = size(A);
length = row * col;
x = reshape(A, 1, length);
x = sort(x);
plot(x);

% Displaying a figure showing histogram of image intensities using 32 bins
figure;
histogram(A, 32);
title("Histogram of A using 32 bins");

% Creating and displaying a binary image the same size of A and
% thresholding against t
figure;
b = A > 128;  % b = image > threshold t
imshow(b);

% Generating a new image same as A but with A's mean intensity value
% subtracted from each pixel. Also, setting any negative values to 0
figure;
c = A - mean(mean(A)); % A is uint8, so negative values are set to 0
imshow(c);

% Calling rollDice() function from rollDice.m
rollDice()

% Using reshape function to generate z
y = [1:6];
z = reshape(y, 3, 2)

% Using min and find function to set x to a single minimum value that
% occurs in A and setting r and c to row and column in which it occurs
% respectively
x = min(unique(A))
[r, c] = find(A == x);

% Using unique function to compute the total number of unique values that
% occur in v
v = [1, 8, 8, 2, 1, 3, 9, 8];
numUniqValue = size(unique(v), 2)