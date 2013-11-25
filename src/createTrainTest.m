
%clear;

imPaths = importdata('../out/imPaths.txt');
mapping = importdata('../out/mapping.txt');
imTrs = importdata('../out/imTrs.txt');
imTss = importdata('../out/imTss.txt');
csTrs = importdata('../out/csTrs.txt');
csTss = importdata('../out/csTss.txt');

bw_ims = [];
for i = 1:length(imPaths)
    im = imread(['../datasets/', imPaths{i}]);
    if(size(im, 3) == 1)
        bw_ims = [ bw_ims i ];
    end
end
inds = true(size(imPaths));
inds(bw_ims) = false;
imPaths = imPaths(inds);

bw_ims = [];
for i = 1:length(imTrs)
    im = imread(['../datasets/', imTrs{i}]);
    if(size(im, 3) == 1)
        bw_ims = [ bw_ims i ];
    end
end
inds = true(size(imTrs));
inds(bw_ims) = false;
imTrs = imTrs(inds);
csTrs = csTrs(inds);

bw_ims = [];
for i = 1:length(imTss)
    im = imread(['../datasets/', imTss{i}]);
    if(size(im, 3) == 1)
        bw_ims = [ bw_ims i ];
    end
end
inds = true(size(imTss));
inds(bw_ims) = false;
imTss = imTss(inds);
csTss = csTss(inds);

save('traintest.mat', 'imPaths', 'imTrs', 'imTss', 'csTrs', 'csTss', 'mapping');
