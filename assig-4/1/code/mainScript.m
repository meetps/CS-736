clear all;
close all;
load('../data/assignmentSegmentBrain.mat');

input_image = imageData.*imageMask;
cropped_image = cropImage(imageData,imageMask);

K = 3;
q = 5;

[segmented_image, class_membership, class_means, bias_field, bias_removed_image, residual_image, initial_means, intial_segment, objective_function] ...
			 = performFCM(cropped_image,q,K);

display(strcat( ['Used q :' num2str(q)] ));
display(strcat( ['Used K :' num2str(K)] ));

display(strcat( ['Initial Class 1 Mean:' num2str(initial_means(1))]));
display(strcat( ['Initial Class 2 Mean:' num2str(initial_means(2))]));
display(strcat( ['Initial Class 3 Mean:' num2str(initial_means(3))]));

plotImages(intial_segment,class_membership,cropped_image,bias_field,bias_removed_image,residual_image,objective_function);

display(strcat( ['Final Class 1 Mean:' num2str(class_means(1))]));
display(strcat( ['Final Class 2 Mean:' num2str(class_means(2))]));
display(strcat( ['Final Class 3 Mean:' num2str(class_means(3))]));