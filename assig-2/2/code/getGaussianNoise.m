function N = getGaussianNoise( noisy_image, estimate, sigma )
    N = abs(noisy_image - estimate).^2;
    N = N/(2 * sigma * sigma);
end

