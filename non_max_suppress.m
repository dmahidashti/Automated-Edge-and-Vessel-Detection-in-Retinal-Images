function [out_img_h,out_img_v] = non_max_suppress(img, H, W, P, type)
%NON_MAX_SUPPRESS takes an image, and a window size, and performs NMS
% Input => Image and the Window Size (H and W, for height and width)
% Additional Input => P: use 'yes' to get plots
%                  => type: enter string to use in plot titles
% Output => NMS filtered image
% Process => NMS is a non-linear filter which serves to attenuate all
% values in a single window except the highest amonf the group
% This is necessary in order further improve pronounciation of the edges
% The NMS serves to create think, sudden transition lines at the edge
% The process is defined as:
%            NMS(w(n))={ 0 if w(n)<w max | w(n) otherwise }
% Note: This operation is not affected by the offset from the centre pixel.
% The process of NMS is usually followed by thresholding

% Check the image type
x = isa(img,'double');
% If the image is not double, then cast to double
if x==0
img = im2double(img);
end
%Extract the row, column of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis
% Define empty 2D arrays for vertical and horizonal output images
out_img_h = zeros(row,column);
out_img_v = zeros(row,column);
% Define empty 1D arrays for vertical and horizonal windows
win_h = zeros(1,W);
win_v = zeros(H,1);
% Loop through all pixels around (x,y), based on window size

% Horizontal
for i=1:row % Loop through all 
    for j=1:W:(column-W+1)% Jump through columns based on the wisth size, upto before the max column
        win_h = img(i,j+W-1);% Keeping a static row, select all row pixels in that row
        m = max(win_h(:));% Find max value within the window of pixels
        % Call NMS operation function
        out_img_h(i,j:j+W-1) = NMS(win_h,m);% Return evaluated row, with the all but max suppressed
    end
end

% Vertical
for i=1:H:(row-H+1)% Jump through rows based on the height size, upto before the max row
    for j=1:column % Loop through all columns
        win_v = img(i:i+H-1,j);% Keeping a static column, select all row pixels in that column
        m = max(win_v(:));% Find max value within the window of pixels
        % Call NMS operation function
        out_img_v(i:i+H-1,j) = NMS(win_v,m);% Return evaluated column, with the all but max suppressed
    end
end

% Plotting
if P=='y'
    figure;
    subplot(3,2,1);
    imshow(img,[]);
    title(type + " | Original");
    subplot(3,2,2);
    imshow(img,[]);
    title(type + " | Original | Zoomed");
    subplot(3,2,3);
    imshow(out_img_h,[]);
    title(type + " | Horizontal Edge Thining using NMS | " + int2str(H) + "x" + int2str(W) + " Window");
    subplot(3,2,4);
    imshow(out_img_h,[]);
    title(type + " | Horizontal Edge Thining using NMS | " + int2str(H) + "x" + int2str(W) + " Window | Zoomed");
    subplot(3,2,5);
    imshow(out_img_v,[]);
    title(type + " | Vertical Edge Thining using NMS | " + int2str(H) + "x" + int2str(W) + " Window");
    subplot(3,2,6);
    imshow(out_img_v,[]);
    title(type + " | Vertical Edge Thining using NMS | " + int2str(H) + "x" + int2str(W) + " Window | Zoomed");
    
end
 
end

