function [ feats ] = meanStdImgs( imgs )
    feats = [ 
        cellfun(@(x) mean(x(:)), imgs), ...
        cellfun(@(x) std(x(:)), imgs)
    ];
end
