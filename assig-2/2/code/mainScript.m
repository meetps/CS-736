addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageDenoisingPhantom.mat');

%% Part (a)
% The RRMSE between Noisy and Noiseless image
error = abs(rrmse(imageNoiseless, imageNoisy));
display(error);

%% Part (b)
best_alpha = 0.89;
best_gamma = 0.5;
algorithm = 1;
[estimate_algorithm_1, e, e1, e2, e3, e4, series_1] = ...
    runGradientDescents(imageNoisy, imageNoiseless, ...
    algorithm, best_alpha, best_gamma);
errors_1 = [best_alpha, best_gamma, e, e1, e2, e3, e4];

% Errors for Quadratic MRF model
% a b RRMSE(a, b) RRMSE(1.2a, b) RRMSE(0.8a, b) RRMSE(a, 1.2b) RRMSE(a, 0.8b) 
display(errors_1);

best_alpha = 0.032;
best_gamma = 0.0070;
algorithm = 2;
[estimate_algorithm_2, e, e1, e2, e3, e4, series_2] = ...
    runGradientDescents(imageNoisy, imageNoiseless, ...
    algorithm, best_alpha, best_gamma);
errors_2 = [best_alpha, best_gamma, e, e1, e2, e3, e4];

% Errors for Huber MRF model
% a b RRMSE(a, b) RRMSE(1.2a, b) RRMSE(0.8a, b) RRMSE(a, 1.2b) RRMSE(a, 0.8b) 
display(errors_2);

best_alpha = 0.003;
best_gamma = 0.007;
algorithm = 3;
[estimate_algorithm_3, e, e1, e2, e3, e4, series_3] = ...
    runGradientDescents(imageNoisy, imageNoiseless, ...
    algorithm, best_alpha, best_gamma);
errors_3 = [best_alpha, best_gamma, e, e1, e2, e3, e4];

% Errors for Adaptive MRF model
% a b RRMSE(a, b) RRMSE(1.2a, b) RRMSE(0.8a, b) RRMSE(a, 1.2b) RRMSE(a, 0.8b) 
display(errors_3);

%% Part (c)
% Noiseless
figure; imshow(abs(imageNoiseless)); title('Noiseless Image');
% Noisy
figure; imshow(abs(imageNoisy)); title('Noisy Image');
% Quadratic MRF
figure; imshow(abs(estimate_algorithm_1)); title('Quadratic MRF Image');
% Huber MRF
figure; imshow(abs(estimate_algorithm_2)); title('Huber MRF Image');
% Adaptive MRF
figure; imshow(abs(estimate_algorithm_3)); title('Adaptive MRF Image');

%% Part (d)
% Quadratic MRF
figure; plot(1:100, series_1); title('Quadratic MRF Image');
% Huber MRF
figure; plot(1:100, series_2); title('Huber MRF Image');
% Adaptive MRF
figure; plot(1:100, series_3); title('Adaptive MRF Image');