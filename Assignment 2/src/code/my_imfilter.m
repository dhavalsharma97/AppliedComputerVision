function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%
    
    % Getting the dimensions of the input image
    dimension = size(image, 3);
    output = image;
    
    % If grayscale image, then apply 1D filter once
    if dimension == 1
        output = one_dim_filter(image, filter);
        return
    end
    
    % If RGB image, then apply 1D filter on each dimension
    for dim = 1: dimension
        output(:, :, dim) = one_dim_filter(image(:, :, dim), filter);
    end
    
end


function out_image = one_dim_filter(image, filter)
    % Getting the size of the input image
    x_dim_img = size(image, 1);
    y_dim_img = size(image, 2);
    
    % Getting the size of the filter
    x_dim_filter = size(filter, 1);
    y_dim_filter = size(filter, 2);
    
    % Finding the number of pixels to pad
    padX = (x_dim_filter - 1) / 2;
    padY = (y_dim_filter - 1) / 2;
    
    % Initializing the output image
    out_image = zeros(x_dim_img, y_dim_img);
    
    % Initializing the output image with padded zeros
    padImage = zeros(x_dim_img + 2 * padX, y_dim_img + 2 * padY);
    padImage(1 + padX: x_dim_img + padX, 1 + padY: y_dim_img + padY) = image;
    
    % Applying convolution on the input image
    for i = 1: x_dim_img
        for j = 1: y_dim_img
            submatrix = padImage(i : i + 2 * padX, j: j + 2 * padY);
            pixleIJ = submatrix.*filter;
            out_image(i, j) = sum(sum(pixleIJ));
        end
    end
    
end