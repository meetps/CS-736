function [ likelyhood, derivative ] = getLikelyhoodAndDerivative( imageKspaceData, estimate, algorithm, alpha, gama, imageKspaceMask)
    likelyhood = alpha * getSparseAcquistion(imageKspaceData, estimate, imageKspaceMask);
    derivative = alpha * getSparseAcquistionDerivative(imageKspaceData, estimate, imageKspaceMask);
    
    if algorithm == 1
        likelyhood = likelyhood + (1 - alpha) * getMRFQuadratic(estimate);
     	derivative = derivative + (1 - alpha) * getDerivativeQuadratic(estimate);
    elseif algorithm == 2
        likelyhood = likelyhood + (1 - alpha) * getMRFHuber(estimate, gama);
     	derivative = derivative + (1 - alpha) * getDerivativeHuber(estimate, gama);
    else
        likelyhood = likelyhood + (1 - alpha) * getMRFAdaptive(estimate, gama);
     	derivative = derivative + (1 - alpha) * getDerivativeAdaptive(estimate, gama);
    end
end

