function batchToVisualWords(numCores)
% Xinlei Chen
% CV Fall 2013 - Provided Code
% Does parallel computation of the visual words 
%
% Input:
%   numCores - number of cores to use (default 2)

if nargin < 1
    %default to 2 cores
    numCores = 2;
end

% Close the pools, if any
try
    fprintf('Closing any pools...\n');
    matlabpool close; 
catch ME
    disp(ME.message);
end

fprintf('Starting a pool of workers with %d cores\n', numCores);
matlabpool('local',numCores);

%load the files and texton dictionary
load('traintest.mat','imPaths','mapping');
load('dictionary.mat','filterBank','dictionary');

source = '../datasets/';
% storing mat files in the same directory as the jpg.
target = '../datasets/';

if ~exist(target,'dir')
    mkdir(target);
end

% for cate = mapping
%     if ~exist([target,cate{1}],'dir')
%         mkdir([target,cate{1}]);
%     end
% end

%This is a peculiarity of loading inside of a function with parfor. We need to 
%tell MATLAB that these variables exist and should be passed to worker pools.
filterBank = filterBank;
dictionary = dictionary;

%matlab can't save/load inside parfor; accumulate
%them and then do batch save
l = length(imPaths);

wordRepresentation = cell(l,1);
parfor i=1:l
    fprintf('Converting to visual words %s\n', imPaths{i});
    image = imread([source, imPaths{i}]);
    % skip grayscale images
    if (size(image, 3) == 1)
        continue;
    end
    wordRepresentation{i} = getVisualWords(image, filterBank, dictionary);
end

%dump the files
fprintf('Dumping the files\n');
for i=1:l
    wordMap = wordRepresentation{i};
    % TODO: Brittle. Will fail if extension is not jpg.
    save([target, strrep(imPaths{i},'.jpg','.mat')],'wordMap');
end

%close the pool
fprintf('Closing the pool\n');
matlabpool close

end
