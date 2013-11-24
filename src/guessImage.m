function guessedImage = guessImage( image, filterBank, dictionary, featureTrs, classTrs )
% Xinlei Chen
% CV Fall 2013 - Provided Code
% Given a path to a scene image, guess what scene it is
% Input:
%   imageName - path to the image

% imshow(image);
fprintf('[Getting Visual Words..]\n');
wordMap = getVisualWords(image, filterBank, dictionary);
h = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
%h = getImageFeatures(wordMap, size(dictionary,1));
distances = distanceToSet(h, featureTrs);
[~,nnI] = max(distances);
load('traintest.mat','mapping');
guessedImage = mapping{classTrs(nnI)};
fprintf('[My Guess]:%s.\n',guessedImage);

end

