% Xinlei Chen
% CV Fall 2013 - Provided Code
% Does computation of the filter bank and dictionary, and saves
% it in dictionary.mat
%

load('traintest.mat');
% give the absolute path
toProcess = strcat([cd,'/../datasets/'],imTrs);
[filterBank, dictionary] = getFilterBankAndDictionary(toProcess);
save('dictionary.mat','filterBank', 'dictionary');
clear toProcess
