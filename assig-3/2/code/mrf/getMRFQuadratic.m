function G = getMRFQuadratic(image)
    G = zeros(size(image, 1), size(image, 2));
    for dim = 1:4
        Gt = getModU(image, dim).^2;
        G = G + Gt;
    end
end