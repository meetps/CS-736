function G = getMRFHuber( image, gama )
    G = zeros(size(image, 1), size(image, 2));
    
    for dim = 1:4
        Gt = getModU(image, dim);
        limit = (Gt <= gama);
        Gt(limit) = 0.5 * Gt(limit).^2;
        Gt(~limit) = gama * Gt(~limit) - 0.5*gama*gama;
        G = G + Gt;
    end
end

