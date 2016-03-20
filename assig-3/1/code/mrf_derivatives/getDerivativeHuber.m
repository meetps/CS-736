function D = getDerivativeHuber( image, gama )
    D = zeros(size(image, 1), size(image, 2));
    for dim = 1:4
        Df = getDiffU(image, dim);
        Dt = getModU(image, dim);
        limit = (Dt <= gama);
        Dt(limit) = Dt(limit);
        Dt(~limit) = gama;
        Dt = Dt .* sign(Df);
        D = D + Dt;
    end
end

