function [ features ] = getColorFeatures2( img )
    [L, a, b] = RGB2Lab(img(:,:,1), img(:,:,2), img(:,:,3));
    
    h1 = hist(L, 4);
    h2 = hist(a, 14);
    h3 = hist(b, 14);
end

