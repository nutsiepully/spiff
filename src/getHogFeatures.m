function [ feats ] = getHogFeatures( imgs )
    feats = cellfun(@getHog, imgs);
end
