function [ feats ] = edgeFeatures( imgs )
    edges = cellfun(@(x) edge(x, 'canny'), imgs, 'UniformOutput', false);

    feats = [
        cellfun(@fun, edges, 'UniformOutput', false), ...
        cellfun(@fun2, edges, 'UniformOutput', false)
    ];

    feats = cell2mat(feats);
end

function [ ret ] = fun(x)
    [ ~, num ] = bwlabel(x, 4);
    ret = double(num / numel(x));
end

function [ ret ] = fun2(x)
    [ ~, num ] = bwlabel(x, 8);
    ret = double(num / numel(x));
end
