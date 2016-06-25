function G = getMRFHuber( image, gamma )
    G = zeros(size(image, 1), size(image, 2));
    
    for dim = 1:4
        Gt = getModU(image, dim);
        limit = (Gt <= gamma);
        Gt(limit) = 0.5 * Gt(limit).^2;
        Gt(~limit) = gamma * Gt(~limit) - 0.5*gamma*gamma;
        G = G + Gt;
    end
end

