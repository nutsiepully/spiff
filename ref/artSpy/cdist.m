%Computes distance between the color of two pixels in RGB 3 dimensional space
%I is matrix for image file, x and y, and a and b are the pixel coordinates of
%the two colors in the image being compared
function [dist] = cdist(I,x,y,a,b)

%Finds the distance between the 2 colors in the RGB 3 dimensional color space
dist = sqrt((I(x,y,1)-I(a,b,1))^2+(I(x,y,2)-I(a,b,2))^2+(I(x,y,3)-I(a,b,3))^2);


    
