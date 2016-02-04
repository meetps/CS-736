clc;
clear;
close all

inputImg=phantom(128);
figure
imshow(inputImg)

%% Radon Transforms for different deltaS 
tic
deltaS=0.5;
R = myRadonTransform(inputImg,deltaS,1); % 1 for high resolution, i.e. deltaT = 1
figure
imagesc(R);
title('Radon Transform with deltaS=0.5')
toc

tic
deltaS=1;
R = myRadonTransform(inputImg,deltaS,1);
figure
imagesc(R);
title('Radon Transform with deltaS=1')
toc

tic
deltaS=3;
R = myRadonTransform(inputImg,deltaS,1);
figure
imagesc(R);
title('Radon Transform with deltaS=3')
toc

% 
% We can see the that the computation time decreases with increasing deltaS
% but then the blurring increases. Observing the tradeoff between the both,
% an optimal choice for computing the radon transform would be deltaS=1 
% which is both smooth and fast enough. 
%  

%%  1D function plots for the Radon-transform image values
deltaS=0.5;
figure
theta=0; 
t=-90:5:90;
m=length(t);
R=zeros(1,m);
for i=1:m
    R(i)=myIntegration(t(i),theta,inputImg,deltaS);
end
subplot(2,3,1);
plot(t,R);
title('Plot of Rf(t) vs t for theta=0 and deltaS=0.5')
xlabel('t (-90 to 90 in steps of 5)')
ylabel('Radon Transform Value')


theta=90;
t=-90:5:90;
m=length(t);
R=zeros(1,m);
for i=1:m
    R(i)=myIntegration(t(i),theta,inputImg,deltaS);
end
subplot(2,3,4);
plot(t,R);
title('Plot of Rf(t) vs t for theta=90 and deltaS=0.5')
xlabel('t(-90 to 90 in steps of 5)')
ylabel('Radon Transform Value')    


deltaS=1;
theta=0; 
t=-90:5:90;
m=length(t);
R=zeros(1,m);
for i=1:m
    R(i)=myIntegration(t(i),theta,inputImg,deltaS);
end
subplot(2,3,2);
plot(t,R);
title('Plot of Rf(t) vs t for theta=0 and deltaS=1')
xlabel('t (-90 to 90 in steps of 5)')
ylabel('Radon Transform Value')


theta=90;
t=-90:5:90;
m=length(t);
R=zeros(1,m);
for i=1:m
    R(i)=myIntegration(t(i),theta,inputImg,deltaS);
end
subplot(2,3,5);
plot(t,R);
title('Plot of Rf(t) vs t for theta=90 and deltaS=1')
xlabel('t(-90 to 90 in steps of 5)')
ylabel('Radon Transform Value')    



deltaS=3;
theta=0; 
t=-90:5:90;
m=length(t);
R=zeros(1,m);
for i=1:m
    R(i)=myIntegration(t(i),theta,inputImg,deltaS);
end
subplot(2,3,3);
plot(t,R);
title('Plot of Rf(t) vs t for theta=0 and deltaS=3')
xlabel('t (-90 to 90 in steps of 5)')
ylabel('Radon Transform Value')


theta=90;
t=-90:5:90;
m=length(t);
R=zeros(1,m);
for i=1:m
    R(i)=myIntegration(t(i),theta,inputImg,deltaS);
end
subplot(2,3,6);
plot(t,R);
title('Plot of Rf(t) vs t for theta=90 and deltaS=3')
xlabel('t(-90 to 90 in steps of 5)')
ylabel('Radon Transform Value') 


% 
% We can see that the plots with theta=0 are less smoother than theta=90 
% and get sharper with increasing deltaS. The reason for this can be given 
% as the image has relatively shorter dark patches in X direction while it
% is fairly long in Y direction, which corresponds to theta=90
%  


%% Radon transform using large deltaT
deltaS=0.5;
R = myRadonTransform(inputImg,deltaS,0); % 0 for low resolution, i.e. deltaT = 5
figure
imagesc(R);
title('Radon Transform with deltaS=0.5 but large deltaT')

%
% We see that deltaT is a important factor for getting a quality radon
% transform. Also, using a large deltaTheta causes blurring in the blue
% part of the radon transform. So, the optimum value for deltaTheta is 1
% and that for deltaT is 1.
%

%% Very large and very small deltaS
% 
% If deltaS is very low, we make much extra efforts but don't gain much 
% information. But if deltaS is very large, we lose lot of information in 
% in between the iterations and hence the result looks highly undersampled.
%