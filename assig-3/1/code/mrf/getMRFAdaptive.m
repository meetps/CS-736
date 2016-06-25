function G = getMRFAdaptive( image, gama )
    G = zeros(size(image, 1), size(image, 2));
    
    for dim = 1:4
        Gt = getModU(image, dim);
        Gt = gama * Gt - gama * gama * log (1 + Gt / gama);
        G = G + Gt;
    end
end

