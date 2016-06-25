function N = getGaussianDerivative( noisy_image, estimate, sigma )
    N = (noisy_image - estimate);
    N = -N /(sigma * sigma);
end

