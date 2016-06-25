function [segmented_image, class_membership, class_means, bias_field, bias_removed_image, residual_image, initial_means ...
         initial_segment, objective_function] = performFCM(cropped_image,q,K)

[m, n] = size(cropped_image); 

objective_function = [];

weights = fspecial('gaussian');
figure;imshow(weights,[]);
bias_field = 0.5*ones(m,n);

[reference_image,initial_means] = kmeans(reshape(cropped_image,[m*n,1]),4);
reference_image =reshape(reference_image,[m,n]);
initial_segment=zeros(m,n,3);
j=0;
for i=1:4
    if i~=find(initial_means<0.1);
        j=j+1;
        initial_segment(:,:,j)=(reference_image==i)*initial_means(i);
    end
end

image_max = max(max(cropped_image));
image_min = min(min(cropped_image));
range = image_max-image_min;
class_membership = zeros(m,n,K);
class_means = zeros(1,K);

for i=1:K  
   class_membership(:,:,i) = (cropped_image >= image_min + range* (i-1)/K).*(cropped_image < image_min + range * i/K);
   class_means(i) = image_min + range*(2*i-1)/(2*K);
end

class_membership(:,:,K) = class_membership(:,:,K) + (cropped_image == image_max);


% class_means = initial_means(initial_means>0.1);
class_means = [0.4572, 0.6362 ,0.2530];
initial_means = class_means;

segmented_image = zeros(m,n,K);
bias_removed_image = zeros(size(cropped_image,1),size(cropped_image,2));
prev_objective = inf;
flag = true;
n_iter = 0;

while(flag)
    n_iter = n_iter+1;    
    squared_convolution = conv2(bias_field.^2,weights,'same');
    convolution = conv2(bias_field,weights,'same');
    
    temp = zeros(m,n); 
    for i=1:K
        segmented_image(:,:,i) = cropped_image.^2+class_means(i)^2*squared_convolution-2*class_means(i)*(cropped_image.*convolution);
        segmented_image(:,:,i) = segmented_image(:,:,i)+(segmented_image(:,:,i)==0)*mean(mean(segmented_image(:,:,i)));
        class_membership(:,:,i) = segmented_image(:,:,i).^(1/1-q)/100;
        temp = temp + class_membership(:,:,i);
    end

    bias_num = zeros(m,n);
    bias_denom = zeros(m,n);

    for i=1:K
        class_membership(:,:,i) = class_membership(:,:,i)./temp;
        num =  sum(sum(class_membership(:,:,i).^q.*cropped_image.*convolution));
        denom = sum(sum(class_membership(:,:,i).^q.*squared_convolution));
        class_means(i) = num/denom;
        bias_num = bias_num + class_membership(:,:,i).^q*class_means(i);
        bias_denom = bias_denom + class_membership(:,:,i).^q*class_means(i)^2;
    end
    bias_field = conv2(cropped_image.*bias_num,weights,'same')./conv2(bias_denom,weights,'same');
    
    temp=zeros(m,n);
    for i=1:K
        temp = temp + (class_membership(:,:,i).^q).*segmented_image(:,:,i);
    end
  
    objective = sum(sum(temp));
    if abs(objective - prev_objective)/abs(objective) < 0.01 && n_iter >= 200
        flag=0;     
    end
    objective_function = [objective_function log(objective)];
    prev_objective = objective;
end

for i=1:K
    bias_removed_image = bias_removed_image + class_membership(:,:,i)*class_means(i);
end
    residual_image = cropped_image - bias_removed_image.*bias_field;
end
