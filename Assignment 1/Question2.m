% Name - Dhaval Harish Sharma
% Red ID - 824654344
% Applied Computer Vision (CS-696)
% Assignment 1
% Question-2 : Programming problem: Averaging Images

% Getting the paths of the image sets
% set1 contains boat images
set1 = "C:\Users\admin\Desktop\Dhaval\ha1\set1\";
% set2 contains plane images
set2 = "C:\Users\admin\Desktop\Dhaval\ha1\set2\";


% Generating a new figure to display the results
figure;

% Function call to average the images
averageImageGraySet1 = averagingImage(set1, false); 
subplot(2,2,1); % First image in window that holds 4 images in 2*2 dimension
imshow(averageImageGraySet1);
title("Average of set 1 (gray) - Boat Images");

% Function call to average the images
averageImageGraySet2 = averagingImage(set2, false); 
subplot(2,2,2); % Second image in window that holds 4 images in 2*2 dimension
imshow(averageImageGraySet2);
title("Average of set 2 (gray) - Plane Images");

% Function call to average the images
averageImageRgbSet1 = averagingImage(set1, true);
subplot(2,2,3); % Third image in window that holds 4 images in 2*2 dimension.
imshow(averageImageRgbSet1);
title("Average of set 1 (rgb) - Boat Images");

% Function call to average the images
averageImageRgbSet2 = averagingImage(set2, true);
subplot(2,2,4); % Fourth image in window that holds 4 images in 2*2 dimension.
imshow(averageImageRgbSet2);
title("Average of set 2 (rgb) - Plane Images");


% Generating a new figure to display the results
figure;

% Function call to get standard deviation images
stdImageSet1 = standardDeviationImages(set1);
subplot(1,2,1); % First image in window that holds std of set1.
imshow(stdImageSet1);
title("Standard deviation of set 1 (gray) - Boat Images");

% Function call to get standard deviation images
stdImageSet2 = standardDeviationImages(set2);
subplot(1,2,2); % % Second image in window that holds std of set2.
imshow(stdImageSet2);
title("Standard deviation of set 2 (gray) - Plane Images");