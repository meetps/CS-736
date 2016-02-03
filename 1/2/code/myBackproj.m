function [ backPropImage ] = myBackproj( R,theta)

backPropImage = 0.5*iradon(R,theta,'linear','none',1,256);

end