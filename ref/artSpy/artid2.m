%artid2(Mean,nml)where Mean is a number correponding to the mean of a problem 
%and nml is a number corresponding to the number of lines in a edge detection of a painting
%artid2 takes in the two components of the picture and returns a string with the name of the 
%artist who most likely painted the painting. 

function [artist] = artid2(Mean,nml);

if   ((Mean > 0) & (Mean < .25) & (nml > .0010) & (nml < .011))

           artist = 'rembrandt';
           
       elseif    ((Mean > .25) & (Mean < .8) & (nml > .0061) & (nml < .02))
       
           artist = 'monet';
           
       elseif    ((Mean > .25) & (Mean < .8) & (nml > .0001) & (nml < .0061))
           
           artist = 'picasso';
           
       else
           
           artist = 'unknown';
       end




