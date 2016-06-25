close all;
clear all;

%% Part a)
	% getDmatrix function estimates the D matrix using the Levenberg-Marquadtt Optimization using a Cholesky Decomposition of D.
intitial_l1 = 0.1;
intitial_l2 = 0.1;
intitial_l3 = 0.1;
[D,L,objective,d1,d2,d3,d4] = getDMatrix(intitial_l1,intitial_l2,intitial_l3);

disp('The estimate of D is :');
disp(D);

	% Plot the log(objective) and di's as a function of iterations
figure;
plot(objective);
title('Log(objective)  vs. iteration');
plotD(d1,d2,d3,d4);

%% Part b) 
	% The diffusion is mac along the principal vector ie. the max eigenvector of D

[U,S,V] = svd(L);
principalVector = U(:,1);

disp('The direction along which max. diffusion takes place is :');
disp(principalVector);

%% Part c)
	% The multiplication factor is just the ratio of the eigenvectors in the corresponding directions.
multiplicationFactor = U(:,1)./U(:,2);

disp('The multiplication factor along principalVector and orthogonal vector is :');
disp(multiplicationFactor);
