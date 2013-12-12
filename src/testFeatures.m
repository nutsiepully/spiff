function testFeatures( imgs, imgFeatures, kernelType, numRuns )
    if (nargin < 4)
        numRuns = 5;
    end
    
    for n = 1:numRuns
        Xtrain = []; Ytrain = [];
        Xtest = []; Ytest = [];
        for i = 1:length(imgs)
            P = cvpartition(ones(size(imgs{i}, 1), 1), 'Holdout', 0.25);
            
            Xtrain = [ Xtrain; imgFeatures{i}(P.training, :) ];
            Xtest = [ Xtest; imgFeatures{i}(P.test, :) ];
            Ytrain = [ Ytrain; i * ones(P.TrainSize, 1) ];
            Ytest = [ Ytest; i * ones(P.TestSize, 1) ];
        end

        Ytrain = double(Ytrain); Xtrain = double(Xtrain);
        Ytest = double(Ytest); Xtest = double(Xtest);

        if (nargin < 3)
            kernelType = 0;
        end
        if (kernelType <= 4)
            svmStruct = svmtrain(Ytrain, Xtrain, [ '-q -t ', num2str(kernelType) ]);
            [ C, ~, ~ ] = svmpredict(Ytest, Xtest, svmStruct);
        else
            svmStruct = svmtrain(Ytrain, [ (1:size(Xtrain, 1))', kernel(Xtrain, Xtrain, kernelType) ], [ '-t ', num2str(4) ]);
            [ C, ~, ~ ] = svmpredict(Ytest, [ (1:size(Xtest, 1))', kernel(Xtest, Xtrain, kernelType) ], svmStruct);
        end

        errRate = sum(Ytest ~= C) / size(Xtest, 1);
        conMat = confusionmat(Ytest, C);

        display(errRate);
        display(conMat);
    end
end
