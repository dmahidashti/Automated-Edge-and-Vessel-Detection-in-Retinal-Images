function [out_img] = threshold_combine(x_gradient,y_gradient, P, type, T)

out_img = x_gradient + y_gradient; % Combining the two binary images
% Plotting
if P=='y'
  figure;
  subplot(1,2,1)
  imshow(out_img,[]);
  title(type + " | Combine Threshold with T=" + num2str(T));
  subplot(1,2,2)
  imshow(out_img,[]);
  title(type + " | Combine Threshold with T=" + num2str(T) + " | Zoomed");
end  
end

