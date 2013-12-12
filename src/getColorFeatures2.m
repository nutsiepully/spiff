function [ feats ] = getColorFeatures2( imgs )
    hists = cellfun(@(x) imhist(x, 128)', imgs, 'UniformOutput', false);
    feats = cell2mat(cellfun(@intFeats, hists, 'UniformOutput', false));
end

function [ feat ] = intFeats(h)
    percDark = sum(h(1:32)) / sum(h);
    %percBright = sum(h(97:128)) / sum(h);
    
    [~, sortIndex] = sort(h(:),'descend');
    maxIndex = sortIndex(1:5)';
    
    feat = [ mean(h) std(h) skewness(h) kurtosis(h) percDark maxIndex ];
end
