clc;
clear all;
close all;

chest_data = load('../data/CT_Chest.mat');
imshow(chest_data.imageAC,[]);
inputImage = mat2gray(chest_data.imageAC);
% phantom_data = load('../data/myPhantom.mat');
% imshow(chest_data.imageAC,[]);

thetaRange = 1:1:150;
radonTransform = radon(chest_data.imageAC,thetaRange);

RRMSE_array = zeros(1,length(thetaRange));
for i = 1:180
	backPropImage = mat2gray(0.5*iradon(radonTransform, thetaRange + i,'linear','none',1,512));
	RRMSE_array(i) = sqrt(sum((inputImage(:)-backPropImage(:)).^2)/sum((inputImage(:)).^2));
end


minIndex = find(RRMSE_array == min(RRMSE_array))
minBackPropImage = mat2gray(0.5*iradon(radonTransform, thetaRange + minIndex,'linear','none',1,512));
imshow(minBackPropImage)