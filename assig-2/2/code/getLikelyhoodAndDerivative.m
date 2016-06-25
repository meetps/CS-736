function [ likelyhood, derivative ] = getLikelyhoodAndDerivative( imageNoisy, estimate, algorithm, alpha, gamma)
    likelyhood = alpha * getGaussianNoise(imageNoisy, estimate, 1);
    derivative = alpha * getGaussianDerivative(imageNoisy, estimate, 1);
    
    if algorithm == 1
        likelyhood = likelyhood + (1 - alpha) * getMRFQuadratic(estimate);
     	derivative = derivative + (1 - alpha) * getDerivativeQuadratic(estimate);
    elseif algorithm == 2
        likelyhood = likelyhood + (1 - alpha) * getMRFHuber(estimate, gamma);
     	derivative = derivative + (1 - alpha) * getDerivativeHuber(estimate, gamma);
    else
        likelyhood = likelyhood + (1 - alpha) * getMRFAdaptive(estimate, gamma);
     	derivative = derivative + (1 - alpha) * getDerivativeAdaptive(estimate, gamma);
    end
end

