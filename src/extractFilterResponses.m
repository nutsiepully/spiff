function [filterResponses] = extractFilterResponses(I, filterBank, type)
% Xinlei Chen
% CV Fall 2013 - Provided Code
% Inputs: 
%   I:                  a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses

if strcmp(type, 'sift')
  [~, fr] = vl_sift(single(rgb2gray(I)));
  filterResponses = double(fr');
  return;
end

%Convert to Lab
doubleI = double(I);
[L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
pixelCount = size(doubleI,1)*size(doubleI,2);
filterResponses = zeros(pixelCount, length(filterBank)*3);
%for each filter and channel, apply the filter, and vectorize
for filterI=0:length(filterBank)-1
    filter = filterBank{filterI+1};
    filterResponses(:,filterI*3+1) = reshape(imfilter(L, filter), pixelCount, 1);
    filterResponses(:,filterI*3+2) = reshape(imfilter(a, filter), pixelCount, 1);
    filterResponses(:,filterI*3+3) = reshape(imfilter(b, filter), pixelCount, 1);
end

end
