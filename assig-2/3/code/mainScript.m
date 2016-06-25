addpath '../../2/code/';
addpath '../../2/code/mrf';
addpath '../../2/code/mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageDenoisingBrainNoisy.mat');

%% Part (a)
sigma = getNoiseLevel(imageNoisy);
% Noise level in the background
display(sigma);

best_alpha = 0.89;
best_gamma = 0.5;
algorithm = 1;
[estimate_algorithm_1, series_1] = applyGradientDescent(imageNoisy, algorithm,...
        best_alpha, best_gamma, 1);

best_alpha = 0.032;
best_gamma = 0.0070;
algorithm = 2;
[estimate_algorithm_2, series_2]  = applyGradientDescent(imageNoisy, algorithm,...
        best_alpha, best_gamma, 1);

best_alpha = 0.003;
best_gamma = 0.007;
algorithm = 3;
[estimate_algorithm_3, series_3]  = applyGradientDescent(imageNoisy, algorithm,...
        best_alpha, best_gamma, 1);

%% Part (b)
% Noisy
figure; imshow(abs(imageNoisy)); title('Noisy Image');
% Quadratic MRF
figure; imshow(abs(estimate_algorithm_1)); title('Quadratic MRF Image');
% Huber MRF
figure; imshow(abs(estimate_algorithm_2)); title('Huber MRF Image');
% Adaptive MRF
figure; imshow(abs(estimate_algorithm_3)); title('Adaptive MRF Image');


%% Part (c)
% Quadratic MRF
figure; plot(1:100, series_1); title('Quadratic MRF Image');
% Huber MRF
figure; plot(1:100, series_2); title('Huber MRF Image');
% Adaptive MRF
figure; plot(1:100, series_3); title('Adaptive MRF Image');