function [ feats ] = getSimpSalFeatures( imgs )
    feats = cellfun(@getSimpSal, imgs, 'UniformOutput', false);
    feats = cell2mat(feats);
end

function [ feats ] = getSimpSal( img )
    img = imresize(img, [ 100 100 ]);
    feats = simpsal(img, default_fast_param);
    feats = feats(:)';
end
