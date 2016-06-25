function estimate = applyGradientDescent( imageKspaceData, algorithm, ...
    alpha, gama, imageKspaceMask,imageNoiseless,plot_)
    [rows, columns] = size(imageKspaceData);
    lambda = ones(rows, columns);
    estimate = abs(ifft2(imageKspaceData));

    n_iters = 250;
    likelyhood_series = zeros(1, n_iters);
    rrmse_series = zeros(1, n_iters);
    rrmse_old = rrmse(imageNoiseless,abs(ifft2(imageKspaceData)));
    rrmse_new = 1;
    i = 1;
    for i=1:n_iters
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
        
        likelyhood_series(1, i) = norm(likelyhood);
        rrmse_series(1, i) = rrmse(imageNoiseless, estimate);
        if i == 1
            rrmse_new = rrmse(imageNoiseless, estimate);
        else 
            rrmse_new = rrmse(imageNoiseless, estimate);
            rrmse_old = rrmse(1,i-1);
        end
    end
    
    if plot_ == 1 
     figure; plot(1:n_iters, likelyhood_series); title('Objective vs iters'); 
     figure; plot(1:n_iters, rrmse_series); title('RRMSE vs iters');
    end
end

