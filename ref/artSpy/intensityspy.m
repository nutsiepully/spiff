%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Finds the Mean of the Intensity %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%intensity(picture) where picture is a string containing the picture name
%takes in picture and returns the mean of the intensities of the pixels.
function [Mean] = intensityspy(picture)
     picfile = imread(picture);%changes jpg format to enlarged readable version
     imagesc(picfile)%displays picture 
picfile = im2double(picfile);%changes image matrix to simpler double format for operations

picgray = rgb2gray(im2double(imread(picture)));%changes rgb Matrix to simple black and white image


pic_vec = reshape(picgray,1,prod(size(picgray)));%changes image matrix into a vector in order to take mean 

Mean = mean(pic_vec);%takes mean of vestor

