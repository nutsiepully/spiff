
load('traintest.mat');

C = zeros(size(mapping, 2));

numTss = size(imTss, 2);
for i = 1:numTss,
    imPath = strcat('../', imTss{i});    
    fprintf('Matching image : %s\n', imPath);
    
    actualClass = csTss(i);
    guessedImageClass = getClassIndFromClass(mapping, guessImage(imPath));

    C(actualClass, guessedImageClass) = C(actualClass, guessedImageClass) + 1;
end

display(C);

accuracy = trace(C) / sum(C(:)) * 100;
fprintf('Accuracy is %.2f\n', accuracy);
