function [estimate, likelyhood_series] = applyGradientDescent( imageNoisy, algorithm, ...
    alpha, gamma, to_plot)
    if nargin < 5
        to_plot = 0;
    end
    [rows, columns] = size(imageNoisy);
    lambda = ones(rows, columns);
    estimate = imageNoisy;
    
    likelyhood_series = zeros(1, 100);
    
    for i = 1:100
        [likelyhood, derivative] = ... 
            getLikelyhoodAndDerivative(imageNoisy, ...
            estimate, algorithm, alpha, gamma);
        
        new_estimate = estimate - derivative .* lambda;
        [new_likelyhood] = ...
            getLikelyhoodAndDerivative(imageNoisy, ...
            new_estimate, algorithm, alpha, gamma);

        limits = (real(new_likelyhood) < real(likelyhood));
        lambda(limits) = 1.1 * lambda(limits);
        estimate(limits) = new_estimate(limits);
        lambda(~limits) = lambda(~limits) / 2;
        
        if to_plot == 1
            likelyhood_series(1, i) = norm(likelyhood);
        end;
    end
end

