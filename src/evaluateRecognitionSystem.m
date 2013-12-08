function evaluateRecognitionSystem(type)
load('traintest.mat');
load(visionFileName(type));

C = zeros(length(mapping));

numTss = length(imTss);
for i = 1:numTss,
    imPath = strcat('../datasets/', imTss{i});    
    fprintf('Matching image : %s\n', imPath);

    image = imread(imPath);
    if (size(image, 3) == 1)
        continue;
    end

    actualClass = csTss(i);
    [ ~, guessedImageClass ] = guessImage(image, filterBank, dictionary, featureTrs, classTrs, mapping, type);

    C(actualClass, guessedImageClass) = C(actualClass, guessedImageClass) + 1;
end

display(C);

accuracy = trace(C) / sum(C(:)) * 100;
fprintf('Accuracy is %.2f\n', accuracy);

end
