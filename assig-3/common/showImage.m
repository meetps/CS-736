function showImage( image, image_title )
image = abs(image);
figure;
my_num_of_colors = 200;
my_color_scale = [ [0:1/(my_num_of_colors-1):1]' , ...
    [0:1/(my_num_of_colors-1):1]' , [0:1/(my_num_of_colors-1):1]' ];
imagesc (single (image));
title(image_title);
colormap (my_color_scale);
colormap jet;
daspect ([1 1 1]);
axis tight;
colorbar;
end

