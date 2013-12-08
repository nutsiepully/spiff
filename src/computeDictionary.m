% Xinlei Chen
% CV Fall 2013 - Provided Code
% Does computation of the filter bank and dictionary, and saves
% it in dictionary.mat
%

function computeDictionary(type)
load('traintest.mat');
% give the absolute path
toProcess = strcat([cd,'/../datasets/'],imTrs);
[filterBank, dictionary] = getFilterBankAndDictionary(toProcess, type);
save(dictionaryFileName(type), 'filterBank', 'dictionary');
clear toProcess

end
