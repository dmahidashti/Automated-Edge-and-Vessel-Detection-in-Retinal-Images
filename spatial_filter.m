function [out_img] = spatial_filter(img, h, p,name)

% Check the image type
type = isa(img,'double');
% If the image is not double, then cast to double
if type==0
img = im2double(img);
end
% Convert image from double to grey
if (size(img,3)>1)
img_grey = rgb2gray(img);
else
    img_grey = img;
end
% Zero padding
%img_grey = padarray(img_grey,[4 4],0);

% Perform 2D convolution
out_img = convolve(img_grey,h);

% Plotting
if p=='y' % Select if we want the plots or not
figure;
subplot(2,2,1)
imshow(img_grey,[]);
colorbar;
title(name + " | Original")
subplot(2,2,2)
imshow(img_grey,[]);
colorbar;
title(name + " | Original | Zoomed")
subplot(2,2,3)
imshow(out_img,[]);
colorbar;
title(name + " | Post Spatial Filtering")
subplot(2,2,4)
imshow(out_img,[]);
colorbar;
title(name + " | Post Spatial Filtering | Zoomed")
end
end

