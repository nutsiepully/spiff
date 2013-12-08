%Computes histogram of colors present in picture.  Each pixel's color is
%quanitized to be either black, white, red, yellow, green, blue, cyan, or
%magenta.  These quanitizations are based on the color value and saturation 
%of each pixel for black and white respectively, and the hue of the color for
%the other six color divisions.

function colorhistf(picname)

%Reads in and processes image
I = imread(picname);
I = im2double(I);

%Rips out colormap from image
[index,map] = rgb2ind(I);

%Computes total number of pixels in image
pixels = prod(size(index));

%Converts RGB values to HSV ones
hsv = rgb2hsv(map);

%Stores hue values
h = hsv(:,1);

%Stores saturation values
s = hsv(:,2);

%Stores color value values
v = hsv(:,3);

%Finds location of black and white pixels
darks = find(v < .2)';
lights = find(s < .05 & v > .85)';

%Sets flag in hue of white and dark pixels so they won't be counted for another
%color as well
h([darks lights]) = -1;

%Gets the number of all pixels for each color bin
black = length(darks)/pixels;
white = length(lights)/pixels;
red = length(find((h > .9167 | h <= .083) & h ~= -1))/pixels;
yellow = length(find(h > .083 & h <= .25))/pixels;
green = length(find(h > .25 & h <= .4167))/pixels;
cyan = length(find(h > .4167 & h <= .5833))/pixels;
blue = length(find(h > .5833 & h <= .75))/pixels;
magenta = length(find(h > .75 & h <= .9167))/pixels;

%Plots histogram
hold on
fill([0 0 1 1],[0 red red 0],'r')
fill([1 1 2 2],[0 yellow yellow 0],'y')
fill([2 2 3 3],[0 green green 0],'g')
fill([3 3 4 4],[0 cyan cyan 0],'c')
fill([4 4 5 5],[0 blue blue 0],'b')
fill([5 5 6 6],[0 magenta magenta 0],'m')
fill([6 6 7 7],[0 white white 0],'w')
fill([7 7 8 8],[0 black black 0],'k')

axis([0 8 0 1])
ylabel(picname)

%Simple fuction to guess which artist painted picture based on histogram data
if black > .4 & green+blue+cyan < .15 | red > .75
   artist = 'rembrandt';
elseif yellow > red
   artist = 'monet';
else
   artist = 'picasso';
end

%Outputs artist guess as title of hisotgram
title(artist)

