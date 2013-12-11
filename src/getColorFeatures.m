function [ feats ] = getColorFeatures( imgs )
    feats = cellfun(@getColor, imgs, 'UniformOutput', false);
    feats = cell2mat(feats);
end
