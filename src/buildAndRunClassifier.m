
%{
  Receive argin -
    1. directory of images (XTrain - essentially)
    2. directory of annotations (YTrain - essentially)
    3. Random cross-validation, or specified.
    4. Method to use - Simple BoW. Spatial BoW etc.
}%

% Create the traintest.mat file which has the file names etc.
% and the rest of the code is dependent upon.
createTrainTest

% Compute the dictionary after running the filters on the images.
computeDictionary

% Using the dictionary, build the visual word map for all the 
% images.
batchToVisualWords

% Run an evaluation over all the images in the test set.
evaluateRecognitionSystem
