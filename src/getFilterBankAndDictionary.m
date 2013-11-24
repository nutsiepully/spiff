function [ filterBank, dictionary ] = getFilterBankAndDictionary( imPaths )
    alpha = 150;
    K = 100;

    % Test code to limit runs over images
    % imPaths = imPaths(1:50);
   
	filterBank = createFilterBank();
 
    num_images = length(imPaths);
    % 128 harcoded here since that is the size of the descriptor vector from vl_feat.
    %filterResponses = zeros(alpha * num_images, 128);
    filterResponses = [];

    for i = 1:num_images,
        %fprintf('Processing Image number %d\n %s', i, imPaths{i});
        fprintf('Processing Image number %d\n', i);
        
        img = imread(imPaths{i});
        % skip grayscale images
        if (size(img, 3) == 1)
            continue;
        end
        
        fr = extractFilterResponses(img, filterBank);
        
        filterResponses = [ filterResponses; fr(randperm(size(fr, 1), min(size(fr, 1), alpha)), :) ];
        
        %start_index = (i - 1) * alpha + 1; end_index = start_index + (alpha - 1);
        %filterResponses(start_index:end_index, :) = fr(randperm(size(fr, 1), alpha), :);
    end
    
	%display(size(filterResponses));
    [~, dictionary] = kmeans(filterResponses, K, 'EmptyAction', 'drop');
end
