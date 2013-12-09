function [ feats ] = getHaralickFeatures( imgs )
    feats = cellfun(@(im) haralick(rgb2gray(im, 8, 1, 2, 0)), imgs, 'UniformOutput', false);
    feats = cell2mat(feats);
end
