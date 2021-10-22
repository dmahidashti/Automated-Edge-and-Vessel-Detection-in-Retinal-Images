function [ image ] = convolve( img,matrix )
  [rows,cols] = size(img); %Define row and columns

  %Create a padded matrix that is the same class as the input
  new_img = zeros(rows+2,cols+2);%Image of zeros but larger size
  new_img = cast(new_img, class(img));%Ensure image is a double

  %Place original image in padded result
  new_img(2:end-1,2:end-1) = img;%Keeping the added padding while inclduing the image

  %Also create new output image the same size as the padded result
  image = zeros(size(new_img));
  image = cast(image, class(img));%Ensure image is a double

  for i=2:1:rows+1 
    for j=2:1:cols+1 
      value=0;
      for g=-1:1:1
        for l=-1:1:1
          value=value+new_img(i+g,j+l)*matrix(g+2,l+2); 
        end
      end
     image(i,j)=value;
    end
  end

%Crop the image and remove the extra border pixels
image = image(2:end-1,2:end-1);
end