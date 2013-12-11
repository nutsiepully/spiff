function [ feats ] = getColor( imgGray )
    r = size(imgGray, 1); c = size(imgGray, 2);

    mu1 = numel(imgGray(imgGray <= 0.25)) / numel(imgGray);

    %dx = diff(imgGray); dy = diff(imgGray, 2);
    [ dx, dy ] = gradient(imgGray);
    mu2 = sum(sum(sqrt(dx .^ 2 + dy .^ 2) / numel(dx)));

    h = hist(double(imgGray(:)), 256) / numel(imgGray);

    mu3 = numel(h(h > 0.008));

    [ ~, mu4 ] = max(h);

    nrows = r - mod(r, 3); ncols = c - mod(c, 3);
    mat = reshape(imgGray(1:nrows, 1:ncols), nrows / 3, ncols / 3, 9);
    meanBlocks = mean(mean(mat, 1), 2);
    meani = mean(mean(imgGray));
    mu5 = sum(meani - meanBlocks);

    sigma = sum(sum((imgGray - meani) .^ 2)) / (numel(imgGray) - 1);
    mu6 = sum(sum((imgGray - (meani / sigma)) .^ 3)) / numel(imgGray);
    
    %feats = [ mu1 mu2 mu3 mu4 mu5 mu6 ];
    feats = [ mu1 mu2 mu4 ];
end
