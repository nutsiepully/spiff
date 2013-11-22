function [wordMap] = getVisualWords(I, filterBank, dictionary)
    
    filterResponses = extractFilterResponses(I, filterBank);
    
    [ ~, Ind ] = pdist2(dictionary, filterResponses, 'euclidean', 'Smallest', 1);

    wordMap = reshape(Ind, [ size(I, 1), size(I, 2) ]);
end
