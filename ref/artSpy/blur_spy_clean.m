%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The function blur_spy_clean takes in a variable length of image file names and         %
%    returns an  estimate of the image's graininess based on the blurriness             %
%    after a low pass filter                                                            %
%                                                                                       %
%Command line inputs should have the following format                                   %
%              >> blur_spy_clean(strvcat('image1.jpg','image2.tif'));                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output = blur_spy(names);

%dimensions of input read in
temp = size(names);

%the number of files read in
Number_of_Names = temp(1);

%initialize output matrix
block_percentage = ones(1, Number_of_Names);

%operate on the jth input argument
for j = 1:Number_of_Names

%name of the jth file that was read in e.g 'piccasso01.jpg'
file = names(j,:);

%read in image
image = imread(file); 

%convert to gray
image_gray = rgb2gray(image);

%convert image pixel to doubles
image_gray = im2double(image_gray);

%calculate local neighborhood to be used by wiener filter, set neighborhood
% to be one-tenth the size of the original image
size_mat = size(image_gray);
m = round(size_mat(1)/10);
n = round(size_mat(2)/10);

%blur image with wiener filter
blur_image = wiener2(image_gray,[m,n]);

avg_int_image = image_gray;
avg_int_blur = blur_image;

%compute row and column contrast of original image
row_diff_avI = abs(diff(avg_int_image));
col_diff_avI = abs(diff(avg_int_image'));

%compute row and column contrast matrix of blurred image using diff
row_diff_avB = abs(diff(avg_int_blur));
col_diff_avB = abs(diff(avg_int_blur'));

%calculate total row and column contrast of original image
sum_row_diff_avI = sum(sum(row_diff_avI));
sum_col_diff_avI = sum(sum(col_diff_avI));

%calculate total row and column contrast of blurred image
sum_row_diff_avB = sum(sum(row_diff_avB));
sum_col_diff_avB = sum(sum(col_diff_avB));

%calculate the difference in row and column contrast between 
diff_row = (sum_row_diff_avI - sum_row_diff_avB);
diff_col = (sum_col_diff_avI - sum_col_diff_avB);

%calculate the row and column contrast percentage change
percent_diff_row = (sum_row_diff_avI - sum_row_diff_avB)/sum_row_diff_avI;
percent_diff_col = (sum_col_diff_avI - sum_col_diff_avB)/sum_col_diff_avI;

%the graininess is approximated by the percentage change in contrast
%total percentage change is average of row and column percentage change
block_percentage(1,j) = (percent_diff_row + percent_diff_col)/2;

end


block_percentage