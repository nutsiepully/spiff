function [ guessClassName, guessClassInd ] = guessImage( image, filterBank, dictionary, featureTrs, classTrs, mapping, type )
% Xinlei Chen
% CV Fall 2013 - Provided Code
% Given a path to a scene image, guess what scene it is
% Input:
%   imageName - path to the image

% imshow(image);
fprintf('[Getting Visual Words..]\n');
wordMap = getVisualWords(image, filterBank, dictionary, type);
h = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
%h = getImageFeatures(wordMap, size(dictionary,1));
distances = distanceToSet(h, featureTrs, type);

% [ sortedDists, inds ] = sort(distances, 2, 'descend');
% display(sortedDists(1:15));
% display(classTrs(inds(1:15))');
% display(inds(1:15));

[~,nnI] = max(distances);
guessClassInd = classTrs(nnI);
guessClassName = mapping{guessClassInd};
fprintf('[My Guess]:%s.\n',guessClassName);

end

