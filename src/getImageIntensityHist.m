function [ feats ] = getImageIntensityHist( imgs )
    feats = cell2mat(cellfun(@(x) imhist(x, 128)', imgs, 'UniformOutput', false));
end
