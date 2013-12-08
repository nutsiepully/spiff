%Recursive function used by cblock to perform quad tree decomposition
%Determines if average of matrix block is lower than threshold and if 
%not it recurs on itself and goes into another level of quad tree decomposition
%Also plots boxes for blocked color diagram of images and returns total number
%of blocks it and the recursive functions it has called have created.
%block is the portion of the matrix to be evaluated, level is the current level
%the quad tree decomp is located at, and xo and yo are offsets used for the
%drawing of the blocks.
function [blocks] = myquad(block,level,xo,yo)

%Increments level
level = level+1;

%Gets dimensions of block to be evaluated
rows = size(block,1);
cols = size(block,2);

%Color vector for drawing boxes of different colors for different sizes
colors = strvcat('r','y','g','c','b','m');

%Stops recurring if final level (6) is reached or average of matrix is less
%than the threshold (.05)
if level == 6 | mean2(block) < .05
    %Accounts for newly created block 
    blocks = 1;
    %Draws block
    fill([yo yo yo+cols yo+cols],[xo xo-rows xo-rows xo],colors(level))
else
    %Recursively calls itself to perform more quad tree decomposition on 4
    %evenly divided sections of itself
    blocks = myquad(block(1:floor(rows/2),1:floor(cols/2)),level,xo,yo)+myquad(block(1:floor(rows/2),floor(cols/2):cols),level,xo,yo+floor(cols/2))+myquad(block(floor(rows/2):rows,1:floor(cols/2)),level,xo-floor(rows/2),yo)+myquad(block(floor(rows/2):rows,floor(cols/2):cols),level,xo-floor(rows/2),yo+floor(cols/2));
end