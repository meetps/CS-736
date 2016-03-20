function [ U ] = getDiffU( image, dim )
    if dim == 1
        U = (image - circshift(image, +1, 1));
    elseif dim == 2
        U = (image - circshift(image, -1, 1));
    elseif dim == 3
        U = (image - circshift(image, +1, 2));
    else
        U = (image - circshift(image, -1, 2));
    end
end

