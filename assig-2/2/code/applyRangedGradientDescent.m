function [ best_estimate, min_rrmse, best_alpha, best_gamma ] = ...
    applyRangedGradientDescent(alpha_range, gamma_range, ...
    best_estimate, min_rrmse, imageNoisy, imageNoiseless, algorithm, ...
    best_alpha, best_gamma)

    alphas = size(alpha_range, 2);
    gammas = size(gamma_range, 2);
    
    estimates = zeros(alphas, gammas);
    h = waitbar(0, 'Estimating Best Paramters');

    for r = 1:alphas
        alpha = alpha_range(1, r);
        for c = 1:gammas
            gamma = gamma_range(1, c);
            estimate = applyGradientDescent(imageNoisy, algorithm, alpha, gamma);
            estimates(r, c) = rrmse(imageNoiseless, estimate);

            if min_rrmse > estimates(r, c)
                best_alpha = alpha;
                best_gamma = gamma;
                best_estimate = estimate;
                min_rrmse = estimates(r, c);
            end
            waitbar(((r - 1)*gammas + c) / (alphas * gammas));
        end
    end

    close(h);
    figure; surf(estimates);
end

