close all;
clear all;

%% Riddhish Bhalodia and Alankar Kotwal

% Part A function will give the output of D matrix estimate 
% The input is the initial condition of L matrix
% Here the inital condition is that L = [1,0;1,1] and D = LL'
% Have applied Levenberg-marquadtt method for optimization

[D,L,objective,d1,d2,d3,d4] = getDmatrix(1,1,1);

% D

figure;
plot(objective);
title('Log(objective)  vs. iteration');
figure;
% If we require the whole complex number to be plotted we can just remove
% the real from all Di's
plot(real(d1),'g');
hold on
plot(real(d2),'b');
hold on
plot(real(d4),'c');
hold on
plot(real(d3),'r');
legend('d1','d2','d3','d4')
title('D vs iteration');

figure;
plot(abs(d1),'m');
hold on
plot(abs(d2),'b');
hold on
plot(abs(d4),'c');
hold on
plot(abs(d3),'r');
legend('d1','d2','d3','d4')
title('D vs iteration');

%% Part B 
%We take the SVD of the L matrix and find the eigenvector
%corrosponding to the maximumum eigenvalue of LL', which is the coloumn 
% of the matrix U

[U,S,V] = svd(L);
Princ_maximus = U(:,1);  % The final direction along which the diffusion is maximum
Princ_maximus

%% Part C

multi_factor = U(:,1)./U(:,2);
multi_factor