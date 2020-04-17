function output = sum_of_sq_diff(image, filter)
    original = image;

    % Padding to template image
    [m, n] = size(filter);
    if (mod(m, 2) == 0)
        filter = padarray(filter, [1 0], 'post');
    end

    if (mod(n, 2) == 0)
        filter = padarray(filter, [0 1], 'post');
    end

    % Padding to query image
    original = padarray(original, [((size(filter, 1)) - 1) / 2,((size(filter, 2)) - 1) / 2]);

    % SSD calculation of query image and template image
    for k = 1 : size(image, 3)
        for i = 1 + (((size(filter, 1)) - 1) / 2) : size(image, 1) + (((size(filter, 1)) - 1) / 2)
            for j = 1 + (((size(filter, 2)) - 1) / 2) : size(image, 2)+(((size(filter, 2)) - 1) / 2)
                temp = (filter - original(i - (((size(filter, 1)) - 1) / 2) : i + (((size(filter, 1)) - 1) / 2), j - (((size(filter, 2)) - 1) / 2) : j + (((size(filter, 2)) - 1) / 2), k)).^2 ;
                out(i - (((size(filter, 1)) - 1) / 2), j - (((size(filter, 2)) - 1) / 2), k) = sum(temp(:));
            end
        end
    end

    output = out;