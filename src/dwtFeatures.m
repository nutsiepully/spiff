function [ feats ] = dwtFeatures( imgs )
    feats = cellfun(@besov, imgs);
end
