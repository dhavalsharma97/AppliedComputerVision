% This function returns an averageImage of all images that exists in the path
% The second argument suggests whether the image is rgb or gray

function averageImage = averagingImage(imagePath, isImageRGB)

    % Read filepath present at imagePath and store it into memory
    imageDir = dir(imagePath + "*.jpg");
    totalImages = length(imageDir);

    averageImage = 0.0;
    for imageIndex = 1:totalImages
        % Traverse each image and read into memory
        image = imageDir(imageIndex);
        imageFullPath = image.folder + "\" + image.name;
        imageRead = imread(imageFullPath);
        
        % Change scale of image from 0-255 to 0-1
        imageDouble = im2double(imageRead);
        
        % If image is color image, keep it as it is
        % Else convert it to gray scale image
        if isImageRGB == false
            imageDouble = rgb2gray(imageDouble);
        end
        
        % Add current image to result image
        averageImage = averageImage + imageDouble;
    end
    
    % Average of result image by diving it to total number of images
    averageImage = averageImage./totalImages;
end