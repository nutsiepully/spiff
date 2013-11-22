function [ h ] = getImageFeatures( wordMap, dictionarySize )
    h = (hist(reshape(wordMap, [numel(wordMap) 1]), dictionarySize) / numel(wordMap))';
end
