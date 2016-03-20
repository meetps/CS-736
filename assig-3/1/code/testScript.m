addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageDenoisingPhantom.mat');

imageNoisy = imageNoisy(1:50, :);
imageNoiseless = imageNoiseless(1:50, :);

min_rrmse = 10000000;
best_estimate = 0;
best_alpha = 0.5400;
best_gamma = 0.5400;
algorithm = 3;

best_estimate = applyGradientDescent(imageNoisy, algorithm,...
    best_alpha, best_gamma);

display(rrmse(imageNoiseless, imageNoisy));
display(rrmse(imageNoiseless, best_estimate));

figure; imshow(abs(imageNoisy));
figure; imshow(abs(best_estimate));
figure; imshow(imageNoiseless);