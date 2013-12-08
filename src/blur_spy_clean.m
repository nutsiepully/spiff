
function block_percentage = blur_spy_clean(image_gray)

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

% %calculate the difference in row and column contrast between 
% diff_row = (sum_row_diff_avI - sum_row_diff_avB);
% diff_col = (sum_col_diff_avI - sum_col_diff_avB);

%calculate the row and column contrast percentage change
percent_diff_row = (sum_row_diff_avI - sum_row_diff_avB)/sum_row_diff_avI;
percent_diff_col = (sum_col_diff_avI - sum_col_diff_avB)/sum_col_diff_avI;

%the graininess is approximated by the percentage change in contrast
%total percentage change is average of row and column percentage change
block_percentage = (percent_diff_row + percent_diff_col)/2;
