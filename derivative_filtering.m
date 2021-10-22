function [img_gradient, img_x, img_y] = derivative_filtering(img, n, p, type1, type2)
% DERIVATIVE_FILTERING performs filtering based on selected kernel
% Input => Image, Derivative kernel type, whether plots are needed
% and what the image name is
% Output => Gradient image, Image with only y kernel applied &
% Image with only x kernel applied

% Select type of kernel
[kernel_x,kernel_y] = derivative_kernel(n);
% Apply kernel in x direction
[img_x] = spatial_filter(img, kernel_x, 'n','');
% Apply kernel in y direction
[img_y] = spatial_filter(img, kernel_y, 'n','');
% Derive the gradient image
img_gradient = sqrt((img_x.^2)+(img_y.^2));
% Plotting
if p=='y'
    figure;
    subplot(3,2,1)
    imshow(img_x,[]);
    colorbar;
    title( type1 + " | X-direction Gradient | " + type2);
    subplot(3,2,2)
    imshow(img_x,[]);
    colorbar;
    title( type1 + " | X-direction Gradient | Zoomed | " + type2);
    
    subplot(3,2,3)
    imshow(img_y,[]);
    colorbar;
    title( type1 + " | Y-direction Gradient | " + type2);
    subplot(3,2,4)
    imshow(img_y,[]);
    colorbar;
    title( type1 + " | Y-direction Gradient | Zoomed | " + type2);
    
    subplot(3,2,5)
    imshow(img_gradient,[]);
    colorbar;
    title( type1 + " | Gradient Magnitude | " + type2);
    subplot(3,2,6)
    imshow(img_gradient,[]);
    colorbar;
    title( type1 + " | Gradient Magnitude  | Zoomed | " + type2);
end    
end

