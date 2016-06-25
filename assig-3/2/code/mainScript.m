addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageReconstructionBrain.mat');

min_rrmse = 10000000;
best_estimate = 0;
figure; imshow(abs(ifft2(imageKspaceData))); title('Inverse Fourier-kspaceData');

%% Quadratic Prior 1
algorithm = 1;
best_alpha = 0.0002;
best_gamma = 0;
[estimate, series] = applyGradientDescent(imageKspaceData, algorithm, best_alpha ,best_gamma, imageKspaceMask);
display('Quadratic Prior');
display(strcat( ['Best alpha :' num2str(best_alpha)] )); 
display(strcat( ['Best gamma :' num2str(best_gamma)] )); 
figure; imshow(abs(estimate)); title('Quadratic Prior Reconstructed Image');
figure; plot(1:100, series); title('Quadratic MRF Image');

%% Huber Prior 2 
algorithm = 2;
best_alpha = 0.00001;
best_gamma = 0.015;
[estimate, series] = applyGradientDescent(imageKspaceData, algorithm, best_alpha , best_gamma , imageKspaceMask);
display('Huber Prior');
display(strcat( ['Best alpha :' num2str(best_alpha)] )); 
display(strcat( ['Best gamma:' num2str(best_gamma)] )); 
figure; imshow(abs(estimate)); title('Huber Prior Reconstructed Image');
figure; plot(1:100, series); title('Huber MRF Image');

%% Adaptive Prior 3
algorithm = 3;
best_alpha = 0.00001;
best_gamma = 0.08;
[estimate, series] = applyGradientDescent(imageKspaceData, algorithm, best_alpha , best_gamma , imageKspaceMask);
display('Adaptive Prior');
display(strcat( ['Best alpha :' num2str(best_alpha)] )); 
display(strcat( ['Best gamma:' num2str(best_gamma)] )); 
figure; imshow(abs(estimate)); title('Adaptive Prior Reconstructed Image');
figure; plot(1:100, series); title('Adaptive MRF Image');