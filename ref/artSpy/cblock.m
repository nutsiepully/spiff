%Takes in an image and computes the number of blocks of similar color
%an image contains.  Colors are considered to be similar if their average
%distance between the colors of neighboring pixels in the three dimensional
%RGB color space is less than a set threshold.  Performs quad tree decomposition
%on the image until blocks of similar color are found
function cblock(picname)

%Reads in and processes image
I = imread(picname);
I = im2double(I);

%Gets dimensions of image
rows = size(I,1);
cols = size(I,2);

%Initilaizes average differences matrix
diffs = zeros(rows-2,cols-2);
figure
hold on
%Does for all row pixels except for those on the very edge of the picture
for x = 2:rows-1
    %Does for all coloum pixels except for those on the very edge of the picture
    for y = 2:cols-1
        %Computes the average distance between neigboring pixels' colors in the
        %RGB three dimensional color space
        diffs(x-1,y-1) = (cdist(I,x,y,x-1,y-1)+cdist(I,x,y,x-1,y)+cdist(I,x,y,x-1,y+1)+cdist(I,x,y,x,y+1)+cdist(I,x,y,x+1,y+1)+cdist(I,x,y,x+1,y)+cdist(I,x,y,x+1,y-1)+cdist(I,x,y,x,y-1))/8;
    end
end

%Runs quad tree decomposition on matrix of average differences between color 
%values of neigboring pixels in order to determine number of similar blocks 
%of color
blocks = myquad(diffs,0,0,0)