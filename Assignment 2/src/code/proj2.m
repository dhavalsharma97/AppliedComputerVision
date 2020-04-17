% Before trying to construct hybrid images, it is suggested that you
% implement my_imfilter.m and then debug it using proj1_test_filtering.m

% Debugging tip: You can split your MATLAB code into cells using "%%"
% comments. The cell containing the cursor has a light yellow background,
% and you can press Ctrl+Enter to run just the code in that cell. This is
% useful when projects get more complex and slow to rerun from scratch

close all; % closes all figures

%% Setup
% read images and convert to floating point format
image1 = im2single(imread('../data/dog.bmp'));
image2 = im2single(imread('../data/cat.bmp'));
image3 = im2single(imread('../data/plane.bmp'));
image4 = im2single(imread('../data/bird.bmp'));
image5 = im2single(imread('../data/bicycle.bmp'));
image6 = im2single(imread('../data/motorcycle.bmp'));

% Several additional test cases are provided for you, but feel free to make
% your own (you'll need to align the images in a photo editor such as
% Photoshop). The hybrid images will differ depending on which image you
% assign as image1 (which will provide the low frequencies) and which image
% you asign as image2 (which will provide the high frequencies)

%% Filtering and Hybrid Image construction
cutoff_frequency_1 = 5; % This is the standard deviation, in pixels, of the 
% Gaussian blur that will remove the high frequencies from one image and 
% remove the low frequencies from another image (by subtracting a blurred
% version from the original version). You will want to tune this for every
% image pair to get the best results.
filter_1 = fspecial('Gaussian', cutoff_frequency_1 * 4 + 1, cutoff_frequency_1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE BELOW. Use my_imfilter create 'low_frequencies' and
% 'high_frequencies' and then combine them to create 'hybrid_image'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove the high frequencies from image1 by blurring it. The amount of
% blur that works best will vary with different image pairs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

low_frequencies_dog =  my_imfilter(image1, filter_1);
low_frequencies_plane = my_imfilter(image3, filter_1);
low_frequencies_bicycle = my_imfilter(image5, filter_1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove the low frequencies from image2. The easiest way to do this is to
% subtract a blurred version of image2 from the original version of image2.
% This will give you an image centered at zero with negative values.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method 1 (Using single cutoff frequency)
low_pass_image_cat =  my_imfilter(image2, filter_1);
high_frequencies_cat = image2 - low_pass_image_cat;
low_pass_image_bird = my_imfilter(image4, filter_1);
high_frequencies_bird = image4 - low_pass_image_bird;
low_pass_image_motorcycle = my_imfilter(image6, filter_1);
high_frequencies_motorcycle = image6 - low_pass_image_motorcycle;


% Method 2 (Using two cutoff frequencies)
% cutoff_frequency_2 = 5;
% filter_2 = fspecial('Gaussian', cutoff_frequency_2 * 4 + 1, cutoff_frequency_2);
% low_pass_image =  my_imfilter(image2, filter_2);
% high_frequencies = image2 - low_pass_image;

% Method 3 (Using laplacian filter instead of gaussian)
% laplacian_filter = [0 1 0; 1 -4 1; 0 1 0];
% high_frequencies = my_imfilter(image2, laplacian_filter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Combine the high frequencies and low frequencies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hybrid_image_1 = low_frequencies_dog + high_frequencies_cat;
hybrid_image_2 = low_frequencies_plane + high_frequencies_bird;
hybrid_image_3 = low_frequencies_bicycle + high_frequencies_motorcycle;


%% Visualize and save outputs
% Displaying dog and cat results
figure(1); imshow(low_frequencies_dog)
figure(2); imshow(high_frequencies_cat + 0.5);
vis_1 = vis_hybrid_image(hybrid_image_1);
figure(3); imshow(vis_1);

% Displaying plane and bird results
figure(4); imshow(low_frequencies_plane)
figure(5); imshow(high_frequencies_bird + 0.5);
vis_2 = vis_hybrid_image(hybrid_image_2);
figure(6); imshow(vis_2);

% Displaying bicycle and motorcycle results
figure(7); imshow(low_frequencies_bicycle)
figure(8); imshow(high_frequencies_motorcycle + 0.5);
vis_3 = vis_hybrid_image(hybrid_image_3);
figure(9); imshow(vis_3);


% Saving the dog and cat results
imwrite(low_frequencies_dog, 'low_frequencies_dog.jpg', 'quality', 95);
imwrite(high_frequencies_cat + 0.5, 'high_frequencies_cat.jpg', 'quality', 95);
imwrite(hybrid_image_1, 'hybrid_image_1.jpg', 'quality', 95);
imwrite(vis_1, 'hybrid_image_scales_1.jpg', 'quality', 95);


% Saving the plane and bird results
imwrite(low_frequencies_plane, 'low_frequencies_plane.jpg', 'quality', 95);
imwrite(high_frequencies_bird + 0.5, 'high_frequencies_bird.jpg', 'quality', 95);
imwrite(hybrid_image_2, 'hybrid_image_2.jpg', 'quality', 95);
imwrite(vis_2, 'hybrid_image_scales_2.jpg', 'quality', 95);


% Saving the bicycle and motorcycle results
imwrite(low_frequencies_bicycle, 'low_frequencies_bicycle.jpg', 'quality', 95);
imwrite(high_frequencies_motorcycle + 0.5, 'high_frequencies_motorcycle.jpg', 'quality', 95);
imwrite(hybrid_image_3, 'hybrid_image_3.jpg', 'quality', 95);
imwrite(vis_3, 'hybrid_image_scales_3.jpg', 'quality', 95);