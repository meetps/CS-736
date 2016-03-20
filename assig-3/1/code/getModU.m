function [ U ] = getModU( image, dim )
    U = abs(getDiffU(image, dim));
end

