function [kernel_x,kernel_y] = derivative_kernel(n)
% DERIVATIVE_KERNEL provides the user with the means to create a kernel
% matrix
% Prompt => Will ask for type of kernel which is desired
% User Input => Select type of Kernel thorugh an integer
% Function Output => Kernel matrix in both x and y direction
% Types of kernel available: 
% Central Difference, Forward Difference,
% Prewitt & Sobel
% User Input corresponds to:
% 1 ===> Central Difference
% 2 ===> Forward Difference
% 3 ===> Prewitt
% 4 ===> Sobel

% Ask for user input on type of kernel
%prompt = 'Which type of kernel do you want? (1=>Central Difference, 2=>Forward Difference, 3=>Prewitt, 4=>Sobel)';
%n = input(prompt,'s');

if (n == 1) %Central Difference

kernel_x = [1 0 -1]; 
kernel_y = rot90(kernel_x); 
disp('Using Central Difference Kernel');

elseif (n == 2) %Forward Difference

kernel_x = [0 1 -1];
kernel_y = rot90(kernel_x); 
disp('Using Forward Difference Kernel');

elseif (n == 3) %Prewitt

kernel_x = [1 0 -1;1 0 -1;1 0 -1];
kernel_y = rot90(kernel_x); 
disp('Using Prewitt Kernel');

elseif (n == 4) %Sobel

kernel_x = [1 0 -1;2 0 -2;1 0 -1];
kernel_y = rot90(kernel_x); 
disp('Using Sobel Kernel');
end


end

