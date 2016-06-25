
%% Initial Loading
% Getting a starting image

load('../data/assignmentSegmentBrainGmmEmMrf.mat');

Y = imageData;
M = imageMask;
K = 3;
X = getStartingLabel(Y, M, K);
u = zeros(1, K);
s = zeros(1, K);
beta = 0.36;
   
for label = 1:K
    positions = X == label;
    u(1, label) = mean(Y(positions));
    s(1, label) = std(Y(positions));
end;

%% GMM EM MRF With beta = 0.36
% Gaussian Mixture Model, with Expectation Maximisation with potential beta
% equal to 0.36

[L, G] = getEMLabels(Y, M, K, X, u, s, beta, 1);
showImage(imageData, 'Original Corrupted Image');
showImage(G(:, :, 1), 'Label 1 Class-Membership for beta = 0.36');
showImage(G(:, :, 2), 'Label 2 Class-Membership for beta = 0.36');
showImage(G(:, :, 3), 'Label 3 Class-Membership for beta = 0.36');
showImage(L, 'GMM-MRF-EM Optimised Image Segmentation for beta = 0.36');

%% GMM EM MRF With beta = 0
% Gaussian Mixture Model, with Expectation Maximisation with no MRF

[L, G] = getEMLabels(Y, M, K, X, u, s, 0, 1);
showImage(G(:, :, 1), 'Label 1 Class-Membership for beta = 0');
showImage(G(:, :, 2), 'Label 2 Class-Membership for beta = 0');
showImage(G(:, :, 3), 'Label 3 Class-Membership for beta = 0');
showImage(L, 'GMM-MRF-EM Optimised Image Segmentation for beta = 0');