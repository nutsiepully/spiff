function buildRecognitionSystem( type )

load('traintest.mat');
load(dictionaryFileName(type));

numLayers = 3;
dictionarySize = size(dictionary, 1);

numTrs = length(imTrs);
featureTrs = zeros(getNumDimensions(dictionarySize, numLayers), numTrs);
%featureTrs = zeros(dictionarySize, numTrs);

for i = 1:numTrs,
    imPath = imTrs{i};
    % TODO: assumes a 3 character extension.
    wordMapFilePath = char(strcat('../datasets/', imPath(1:end-3), 'mat'));
    
    load(wordMapFilePath, 'wordMap');
    
    f = getImageFeaturesSPM(numLayers, wordMap, dictionarySize);
    %f = getImageFeatures(wordMap, dictionarySize);
    featureTrs(:, i) = f;
end

classTrs = csTrs;

save(visionFileName(type), 'filterBank', 'dictionary', 'featureTrs', 'classTrs');
