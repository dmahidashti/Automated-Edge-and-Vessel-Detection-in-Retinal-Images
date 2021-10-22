function [out_img] = NMS(win,m)
% NMS is the operation function for NON_MAX_SUPPRESS
% It takes in windowed pixels, and the max among them, and performs NMS

%Extract the row, column of the image
h = size(win, 1); % Effectively the x axis
w = size(win, 2); % Effectively the y axis
% Loop through all pixels
    for a = 1:h
        for b = 1:w
            pixel = win(a,b);
            % Implement condition for NMS
            if (pixel < m)
                out_img(a,b) = 0;
            else
                out_img(a,b) = pixel;
            end
        end
    end

end

