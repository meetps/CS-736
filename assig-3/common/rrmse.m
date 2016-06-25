function R = rrmse(image_1, image_2)
    difference = abs(image_1 - image_2);
    N = difference.^2;
    D = image_1.^2;
    numerator = sqrt(sum(N(:)));
    denominator = sqrt(sum(D(:)));
    R = numerator / denominator;
end