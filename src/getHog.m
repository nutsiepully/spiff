function [ feats ] = getHog( img )
    imr = imresize(img, [100 100]);
    hog = vl_hog(single(imr), 8);
    feats = hog(:)';
end
