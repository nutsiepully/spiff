function [ filterBank, dictionary ] = getFilterBankAndDictionary( imPaths, type )
    alpha = 150;
    K = 100;

    filterBank = createFilterBank();
 
    num_images = length(imPaths);
    filterResponses = [];

    for i = 1:num_images,
        fprintf('Processing Image number %d\n', i);
        
        img = imread(imPaths{i});
        % skip grayscale images
        if (size(img, 3) == 1)
            continue;
        end
        
        fr = extractFilterResponses(img, filterBank, type);
        
        filterResponses = [ filterResponses; fr(randperm(size(fr, 1), min(size(fr, 1), alpha)), :) ];
    end
    
    [~, dictionary] = kmeans(filterResponses, K, 'EmptyAction', 'drop');
end
