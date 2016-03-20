function estimate = applyGradientDescent( imageKspaceData, algorithm, ...
    alpha, gama, imageKspaceMask)
    [rows, columns] = size(imageKspaceData);
    lambda = ones(rows, columns);
    estimate = abs(ifft2(imageKspaceData));
    
%      likelyhood_series = zeros(1, 100);
%     rrmse_series = zeros(1, 100);
    
    for i = 1:100
        [likelyhood, derivative] = ... 
            getLikelyhoodAndDerivative(imageKspaceData, ...
            estimate, algorithm, alpha, gama, imageKspaceMask);
        
        new_estimate = estimate - derivative .*(2*lambda);
        
        [new_likelyhood] = ...
            getLikelyhoodAndDerivative(imageKspaceData, ...
            new_estimate, algorithm, alpha, gama, imageKspaceMask);

        limits = (real(new_likelyhood) < real(likelyhood));
        lambda(limits) = 1.1 * lambda(limits);
        estimate(limits) = new_estimate(limits);
        lambda(~limits) = lambda(~limits) / 2;
        
%         likelyhood_series(1, i) = norm(likelyhood);
%         rrmse_series(1, i) = rrmse(imageNoiseless, estimate);
    end
    
%     figure; plot(1:100, rrmse_series);
%      figure; plot(1:100, likelyhood_series);
end

