function [R1] = myRadonTransform(inputImg,deltaS, resolution)
    
    if(resolution==0)
        deltaT = 5;
    else
        deltaT = 1;
    end
    
    t = -90:deltaT:90;
    theta = 0:5:175;

    for i=1:size(t,2)
        for j=1:size(theta,2)
            R1(i,j)=myIntegration(t(i),theta(j),inputImg,deltaS);
        end
    end

end