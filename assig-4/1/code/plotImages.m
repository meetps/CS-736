function plotImages(initial_segment,class_membership,cropped_image,bias_field,bias_removed_image,residual_image,objective_function)

%% Initial Class Membershio Binary Images
figure; imshow(initial_segment); title('Initial Class Binaries'); 

%% Final Class Membershio Binary Images
figure; imshow(class_membership(:,:,1)); title('Class 1 Binary'); 
figure; imshow(class_membership(:,:,2)); title('Class 2 Binary');
figure; imshow(class_membership(:,:,3)); title('Class 3 Binary');

%% Bias Removal
figure; imshow(cropped_image); title('corrupted input Image(cropped)');
figure; imshow(bias_field); title('Bias Removed Image');
figure; imshow(bias_removed_image); title('optimal bias field');
figure; imshow(residual_image,[]); title('residual Image');

%% Log(Objective)vs iterations
figure;plot(objective_function);
title('log(objective) vs n_iter');

end