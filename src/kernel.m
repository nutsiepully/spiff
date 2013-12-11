function [ kernel ] = kernel(X, Y, kernelType)
    % 5 chi-square
    % 6 histogram intersection
    
    chiDist = @(X, Y) 1 - sum(2 * ((X - Y) .^ 2) ./ (X + Y), 2);
    histIntDist = @(X, Y) sum(min(X, Y), 2) .^ -1;
    
    if (kernelType == 5)
        kernel = pdist2(X, Y, @(xi, xj) chiDist(repmat(xi, size(xj, 1), 1), xj));
    elseif (kernelType == 6)
        kernel = pdist2(X, Y, @(xi, xj) histIntDist(repmat(xi, size(xj, 1), 1), xj));        
    end
end
