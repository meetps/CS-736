function D = getDerivativeAdaptive( image, gama )
    [rows, columns] = size(image);
    D = zeros(rows, columns);
    for dim = 1:4
        Df = getDiffU(image, dim);
        Dt = getModU(image, dim);
        Dt = sign(Df) .* (gama + gama*ones(rows, columns)./(1 + Dt / gama));
        D = D + Dt;
    end
end

