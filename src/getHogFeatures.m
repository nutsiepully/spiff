function [ feats ] = getHogFeatures( imgs )
    feats = cellfun(@getHog, imgs, 'UniformOutput', false);
    feats = cell2mat(feats);
end
