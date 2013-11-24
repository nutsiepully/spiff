
%clear;

imPaths = importdata('../out/imPaths.txt');
mapping = importdata('../out/mapping.txt');
imTrs = importdata('../out/imTrs.txt');
imTss = importdata('../out/imTss.txt');
csTrs = importdata('../out/csTrs.txt');
csTss = importdata('../out/csTss.txt');

save('traintest.mat', 'imPaths', 'imTrs', 'imTss', 'csTrs', 'csTss', 'mapping');

