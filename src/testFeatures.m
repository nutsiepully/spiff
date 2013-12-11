function testFeatures( imgs, imgFeatures, kernelType )
    X = []; Y = [];
    for i = 1:length(imgs)
        X = [ X; imgFeatures{i} ];
        Y = [ Y; i * ones(size(imgs{i}, 1), 1) ];
    end

    Y = double(Y); X = double(X);
    
    P = cvpartition(Y,'Holdout',0.30);

    if (nargin < 3)
        kernelType = 0;
    end
    if (kernelType <= 4)
        svmStruct = svmtrain(Y(P.training), X(P.training, :), [ '-t ', num2str(kernelType) ]);
        [ C, ~, ~ ] = svmpredict(Y(P.test), X(P.test,:), svmStruct);
    else
        svmStruct = svmtrain(Y(P.training), [ (1:P.TrainSize)', kernel(X(P.training, :), X(P.training, :), kernelType) ], [ '-t ', num2str(4) ]);
        [ C, ~, ~ ] = svmpredict(Y(P.test), [ (1:P.TestSize)', kernel(X(P.test,:), X(P.training, :), kernelType) ], svmStruct);
    end

    errRate = sum(Y(P.test) ~= C) / P.TestSize;
    conMat = confusionmat(Y(P.test), C);

    display(errRate);
    display(conMat);
end
