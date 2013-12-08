% Find the number of edges in a picture %

function [num_lines] = edgespy(picture)

picfile = im2double(picture);

pic_gray = rgb2gray(picfile);   % edge only works with intensity images

edge_detect = edge(pic_gray,'sobel');  % edge detect the image

% find the number of lines that are length 8 or longer 
[l, num_lines] = bwlabel(edge_detect, 8);  

% divide by the size of the picture to make sure that size does not influence
num_lines = num_lines/prod(size(edge_detect));