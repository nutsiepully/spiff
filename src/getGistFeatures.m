function [ feats ] = getGistFeatures( imgs )
    feats = cellfun(@getGist, imgs, 'UniformOutput', false);
    feats = cell2mat(feats);
end

function [ feats ] = getGist( im )
    param.imageSize = [256 256];
    param.orientationsPerScale = [8 8 8 8];
    param.numberBlocks = 4;
    param.fc_prefilt = 4;
    
    [gist, ~] = LMgist(im, '', param);
    feats = gist(:)';
end
