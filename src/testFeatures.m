function testFeatures( imgs, imgFeatures )
    X = []; Y = [];
    for i = 1:length(imgs)
        X = [ X; imgFeatures{i} ];
        Y = [ Y; i * ones(size(imgs{i}, 1), 1) ];
    end

    Y = double(Y); X = double(X);
    
    P = cvpartition(Y,'Holdout',0.30);

%     svmStruct = svmtrain(X(P.training,:),Y(P.training),'showplot',true);
    svmStruct = svmtrain(Y(P.training), X(P.training, :), '-q -t 0');

%     C = svmclassify(svmStruct, X(P.test,:), 'showplot', true);
    [ C, ~, ~ ] = svmpredict(Y(P.test), X(P.test,:), svmStruct);

    errRate = sum(Y(P.test) ~= C) / P.TestSize;
    conMat = confusionmat(Y(P.test), C);

    display(errRate);
    display(conMat);
end
