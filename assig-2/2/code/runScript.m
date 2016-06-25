addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageDenoisingPhantom.mat');

min_rrmse = 10000000;
best_estimate = 0;
best_alpha = 0.0880;
best_gamma = 0.0120;
algorithm = 1;
alpha_precision = 0.001;
gamma_precision = 0.001;
alpha_range = 0.01;
gamma_range = 0.005;
[best_estimate, min_rrmse, best_alpha, best_gamma] = ...
    applyRangedGradientDescent( ...
    max(0, best_alpha - alpha_range):alpha_precision:min(best_alpha + alpha_range, 1), ...
    max(0, best_gamma - gamma_range):gamma_precision:min(best_gamma + gamma_range, 1), ...
    best_estimate, min_rrmse, imageNoisy, ...
    imageNoiseless, algorithm, best_alpha, best_gamma);

display(best_alpha); display(best_gamma);
display(abs(rrmse(imageNoiseless, imageNoisy)));
display(abs(rrmse(imageNoiseless, best_estimate)));

figure; imshow(abs(imageNoisy));
figure; imshow(abs(best_estimate));
figure; imshow(imageNoiseless);