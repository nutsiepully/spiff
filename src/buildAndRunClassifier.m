
%{
  Receive argin -
    1. directory of images (XTrain - essentially)
    2. directory of annotations (YTrain - essentially)
    3. Random cross-validation, or specified.
    4. Method to use - Simple BoW. Spatial BoW etc.

    Approaches
    1. Variation of filter bank
    2. BoW
    3. Spatial BoW
    4. Image similarity functions. L2-Norm, Chi-Squared, Intersection
    5. Implementation using SIFT etc.
    6. Soft assignment using Encoding.
    7. Variations of ML classifiers - SVM, Random Forests etc.
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
