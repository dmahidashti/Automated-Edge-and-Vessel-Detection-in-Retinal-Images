function [out_img] = image_threshold(img, T, P, type)
%IMAGE_THRESHOLD performs thresholding on the given image, based on the
%threshold value of T
% T can be any number between 0 and 1 (including 1)
% It is used to enhance gradient lines in an image

% Check the image type
% x = isa(img,'double');
% % If the image is not double, then cast to double
% if x==0
% img = im2double(img);
% end
% Extract the row, column of the image
%row = size(img, 1); % Effectively the x axis
%column = size(img, 2); % Effectively the y axis
[row column] = size(img);
% Define an empty 2D array for thr output image
%out_img = zeros(row,column);
% Loop through all pixels
for i=1:row
    for j=1:column
        pixel = img(i,j);% Select a pixel
        % Apply thresholding condition
        if(pixel >= T);
            out_img(i,j) = 1;
        else
            out_img(i,j) = 0;
        end
    end
end
% Plotting
if P=='y'
  figure;
  subplot(2,2,1)
  imshow(img,[]);
  title(type + " | Original")
  subplot(2,2,2)
  imshow(img,[]);
  title(type + " | Original | Zoomed")
  subplot(2,2,3)
  imshow(out_img,[]);
  title(type + " | Threholded with T=" + num2str(T));
  subplot(2,2,4)
  imshow(out_img,[]);
  title(type + " | Threholded with T=" + num2str(T) + " | Zoomed");
end  



end

