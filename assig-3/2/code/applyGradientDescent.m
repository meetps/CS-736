function [estimate, likelyhood_series] = applyGradientDescent( imageKspaceData, algorithm, ...
    alpha, gamma, imageKspaceMask)
    [rows, columns] = size(imageKspaceData);
    lambda = ones(rows, columns);
    estimate = abs(ifft2(imageKspaceData));
    
    likelyhood_series = zeros(1, 100);
    
    for i = 1:100
        [likelyhood, derivative] = ... 
            getLikelyhoodAndDerivative(imageKspaceData, ...
            estimate, algorithm, alpha, gamma, imageKspaceMask);
        
        new_estimate = estimate - derivative .*(2*lambda);
        
        [new_likelyhood] = ...
            getLikelyhoodAndDerivative(imageKspaceData, ...
            new_estimate, algorithm, alpha, gamma, imageKspaceMask);

        limits = (abs(new_likelyhood) < abs(likelyhood));
        lambda(limits) = 1.1 * lambda(limits);
        estimate(limits) = new_estimate(limits);
        lambda(~limits) = lambda(~limits) / 2;
        
        likelyhood_series(1, i) = sum(sum(abs(likelyhood)));
    end
end

