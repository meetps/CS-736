function D = getDerivativeQuadratic( image )
    D = zeros(size(image, 1), size(image, 2));
    for dim = 1:4
        Df = getDiffU(image, dim);
        Dt = getModU(image, dim);
        Dt = 2 * Dt .* sign(Df);
        D = D + Dt;
    end
end

