function [wordMap] = getVisualWords(I, filterBank, dictionary, type)

    if strcmp(type, 'sift')
      [ ~, filterResponses ] = vl_dsift(single(rgb2gray(I)));
      filterResponses = double(filterResponses');

      [ ~, Ind ] = pdist2(dictionary, filterResponses, 'euclidean', 'Smallest', 1);

      wordMap = Ind;

      return;
    end

    filterResponses = extractFilterResponses(I, filterBank, type);
    
    [ ~, Ind ] = pdist2(dictionary, filterResponses, 'euclidean', 'Smallest', 1);

    wordMap = reshape(Ind, [ size(I, 1), size(I, 2) ]);
end
