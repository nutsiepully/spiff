function [ feats ] = meanStdImgs( imgs )
    feats = [ 
        cellfun(@(x) mean(x(:)), imgs), ...
        cellfun(@(x) std(double(x(:))), imgs)
    ];
end
