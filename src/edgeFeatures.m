function [ feats ] = edgeFeatures( imgs )
    edges = cellfun(@(x) edge(x, 'canny'), imgs, 'UniformOutput', false);
    cc4s = cellfun(@(x) bwconncomp(x, 4), edges, 'UniformOutput', false);
    cc8s = cellfun(@(x) bwconncomp(x, 8), edges, 'UniformOutput', false);

    num4Objects = cellfun(@(x) x.NumObjects / prod(x.ImageSize), cc4s);
    num8Objects = cellfun(@(x) x.NumObjects / prod(x.ImageSize), cc8s);
    hist4Objects = cellfun(@fun1, cc4s, 'UniformOutput', false);
    hist8Objects = cellfun(@fun1, cc8s, 'UniformOutput', false);

    feats = [ num4Objects cell2mat(hist4Objects) num8Objects cell2mat(hist8Objects) ];

%     [ (cc4.NumObjects / numel() cc8.NumObjects]
    
%     feats = [
%         cellfun(@fun, edges, 'UniformOutput', false), ...
%         cellfun(@fun2, edges, 'UniformOutput', false)
%     ];
% 
%     feats = cell2mat(feats);
end

function [ ret ] = fun1(cc)
    imTotalSize = prod(cc.ImageSize);
    ret = hist(cellfun(@(x) numel(x) / imTotalSize, cc.PixelIdxList), 50);
end

function [ ret ] = fun(x)
    [ ~, num ] = bwlabel(x, 4);
    ret = double(num / numel(x));
end

function [ ret ] = fun2(x)
    [ ~, num ] = bwlabel(x, 8);
    ret = double(num / numel(x));
end
