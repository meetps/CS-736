function X = getStartingLabel( Y, M, L )
    minimum = min(Y(:));
    Y = Y - minimum;
    maximum = max(Y(:));
    
    X = zeros(size(Y, 1), size(Y, 2));
    
    positions = and(Y <= maximum, M == 1);
    X(positions) = 3;
    
    positions = and(Y <= 2 * maximum / 3, M == 1);
    X(positions) = 2;
    
    positions = and(Y <= maximum / 3, M == 1);
    X(positions) = 1; 
end

