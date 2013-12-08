%artspy2(picture) where picture is a atring containing the picture name
%takes in a picture and runs two operations on it. One to calculate the number of edges
%detects the artist based on intensity
function [artist] = artspy2(picture)
     picfile = imread(picture);%changes jpg format to enlarged readable version
     imagesc(picfile)%displays picture 
picfile = im2double(picfile);%changes image matrix to simpler double format for operations

picgray = rgb2gray(im2double(imread(picture)));%changes rgb Matrix to simple black and white image

pic_edge = edge(picgray,'sobel');%edge detects image

[L, numlines] = bwlabel(pic_edge,8);%counts number of lines of length 8 or greater

numlines = numlines/(size(pic_edge,1)*size(pic_edge,2));%normalizes value for numlines by size of image

pic_vec = reshape(picgray,1,prod(size(picgray)));%changes image matrix into a vector in order to take mean 

pic_mean = mean(pic_vec);%takes mean of vector

artist = artid2(pic_mean,numlines);%uses exterior program to analyze data

