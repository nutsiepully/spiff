function [ feats ] = getHaralickFeatures( img )
% img should be grayscale
    feats = haralick(img, 8, 1, 2, 0);
end
