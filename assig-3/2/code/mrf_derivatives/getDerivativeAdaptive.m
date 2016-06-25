function D = getDerivativeAdaptive( image, gamma )
    [rows, columns] = size(image);
    D = zeros(rows, columns);
    for dim = 1:4
        Df = getDiffU(image, dim);
        Dt = getModU(image, dim);
        Dt = sign(Df) .* (gamma + gamma*ones(rows, columns)./(1 + Dt / gamma));
        D = D + Dt;
    end
end

