function [ features ] = getColorFeatures( imgGray )
    r = size(imgGray, 1); c = size(imgGray, 2);

    mu1 = numel(imgGray(imgGray <= 64)) / numel(imgGray);

    dx = diff(imgGray); dy = diff(imgGray, 2);
    mu2 = sum(sum(sqrt(dx .^ 2 + dy .^ 2)));

    h = hist(double(imgGray(:)), 256);

    thresh = 100;
    mu3 = sum(h(thresh:end));

    mu4 = max(h);

    nrows = r - mod(r, 3); ncols = c - mod(c, 3);
    mat = reshape(imgGray(1:nrows, 1:ncols), nrows / 3, ncols / 3, 9);
    meanBlocks = mean(mean(mat, 1), 2);
    meani = mean(mean(imgGray));
    mu5 = sum(meani - meanBlocks);

    sigma = sum(sum((imgGray - meani) .^ 2)) / (numel(imgGray) - 1);
    mu6 = sum(sum((imgGray - (meani / sigma)) .^ 3)) / numel(imgGray);
    
    features = [ mu1 mu2 mu3 mu4 mu5 mu6 ];
end
