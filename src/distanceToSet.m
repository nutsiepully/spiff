function [histInter] = distanceToSet(wordHist, histograms, type)
    histInter = sum(bsxfun(@min, histograms, wordHist));
    %histInter = sum(bsxfun(@minus, histograms, wordHist) .^ 2) .^ -1;
end
