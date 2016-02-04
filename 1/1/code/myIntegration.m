function R = myIntegration(t,theta,inputImg,delta_S)

[r, c] = size(inputImg);

if theta==0 
   s_min = -floor(r/2);
   s_max = floor(c/2)-1;
elseif theta>0 && theta<90
   s_min = ceil(max((t*cos(theta*pi/180)-floor(c/2)+1)/sin(theta*pi/180),(-floor(r/2)-t*sin(theta*pi/180))/cos(theta*pi/180)));
   s_max = floor(min((t*cos(theta*pi/180)+floor(r/2))/sin(theta*pi/180),(floor(c/2)-1-t*sin(theta*pi/180))/cos(theta*pi/180)));
elseif theta==90
   s_min = -(floor(c/2)-1);
   s_max = floor(r/2); 
else
   s_min = ceil(max((t*cos(theta*pi/180)-floor(c/2)+1)/sin(theta*pi/180),(floor(c/2)-1-t*sin(theta*pi/180))/cos(theta*pi/180)));
   s_max = floor(min((t*cos(theta*pi/180)+floor(r/2))/sin(theta*pi/180),(-floor(r/2)-t*sin(theta*pi/180))/cos(theta*pi/180)));
end

s_range = double(s_min):delta_S:double(s_max);

X_intercept = t*cos(theta*pi/180)-s_range*sin(theta*pi/180)+(c/2)+1;
Y_intercept = t*sin(theta*pi/180)+s_range*cos(theta*pi/180)+(r/2)+1;

data_points = interp2(inputImg,X_intercept,Y_intercept);

R = delta_S*sum(data_points);

end