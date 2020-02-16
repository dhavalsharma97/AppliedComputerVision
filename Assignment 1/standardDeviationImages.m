% This function returns a standard deviation at each pixel of all images

function stdImage = standardDeviationImages(imagePath)

    % Read filepath present at imagePath and store it into memory
    imageDir = dir(imagePath + "*.jpg");
    totalImages = length(imageDir);

    % Create array equals to size of first image
    image1FullPath = imageDir(1).folder + "\" + imageDir(1).name;
    image1Read = imread(image1FullPath);
    imageSize = size(image1Read);
    imageArray = zeros(imageSize);
    
    for imageIndex = 1:totalImages
        % Traverse each image and read into memory
        image = imageDir(imageIndex);
        imageFullPath = image.folder + "\" + image.name;
        imageRead = imread(imageFullPath);
        
        % Change scale of image from 0-255 to 0-1
        imageDouble = im2double(imageRead);
        
        % If image is color image, keep it as it is.
        % Else convert it to gray scale image
        imageDouble = rgb2gray(imageDouble);
        
        % Store each image in 3rd dimension
        imageArray(:,:,imageIndex) = imageDouble;
    end
    
    % Standard deviation of images with respect to third dimension
    % 3rd dimension std performs pixel by pixel standard deviation
    stdImage = std(imageArray,0,3);
end