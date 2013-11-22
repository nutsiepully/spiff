
function [ h ] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)

    layerMap = cell(layerNum, 1);
    for l = 1:layerNum,
        cellsOneSide = numCellsOnSide(l - 1);
        layerMap{l} = cell(cellsOneSide, cellsOneSide);
    end
    
    cellCoords = computeIndsForLayer(size(wordMap, 1), size(wordMap, 2), layerNum - 1);

    for i = 1:size(cellCoords, 1),
        for j = 1:size(cellCoords, 2),
            layerMap{layerNum}{i}{j} = computeHist(wordMap, cellCoords(i, j, :), dictionarySize);
        end
    end

    for l = (layerNum - 1):-1:1,
        m = 1;
        for i = 1:2:numCellsOnSide(l),
            n = 1;
            for j = 1:2:numCellsOnSide(l),
                layerMap{l}{m}{n} = mergeHist([layerMap{l + 1}{i}{j}; layerMap{l + 1}{i + 1}{j}; layerMap{l + 1}{i}{j + 1}; layerMap{l + 1}{i + 1}{j + 1}]);
                n = n + 1;
            end
            m = m + 1;
        end
    end
    
    totalDimensions = getNumDimensions(dictionarySize, layerNum);
    h = zeros(totalDimensions, 1);
    k = 1;
    for l = 1:layerNum,
        w = getWeightForLayer(l, layerNum);
        for i = 1:size(layerMap{l}, 1),
            for j = 1:size(layerMap{l}, 2),
                h(k:k + dictionarySize - 1) = w * layerMap{l}{i}{j};
                k = k + dictionarySize;
            end
        end
    end
end

function [ weight ] = getWeightForLayer(layer, layerNum)
    l = layer - 1;
    if l <= 1,
        weight = 2 ^ (-l);
    else
        weight = 2 ^ (l - (layerNum - 1) - 1);
    end
end

function [ cellCount ] = numCellsOnSide(layer)
    cellCount = 2 ^ layer;
end

function [ h ] = mergeHist(hists)
    h = sum(hists) / size(hists, 1);
end

function [ h_cell ] = computeHist(wordMap, cellSide, dictionarySize)
    wordMapForCell = wordMap(cellSide(1):cellSide(2), cellSide(3):cellSide(4));
    h_cell = hist(reshape(wordMapForCell, [numel(wordMapForCell) 1]), dictionarySize) / numel(wordMapForCell);
end

function [ cellCoords ] = computeIndsForLayer(xMax, yMax, layer)
    cellsOneSide = numCellsOnSide(layer);

    cellCoords = zeros(cellsOneSide, cellsOneSide, 4);

    pixelCountX = xMax / cellsOneSide;
    pixelCountY = yMax / cellsOneSide;

    % Fix overlap in case not perfectly divisible
    
    for i = 1:cellsOneSide,
        startY = floor(pixelCountY * (i - 1)) + 1;
        for j = 1:cellsOneSide,
            startX = floor(pixelCountX * (j - 1)) + 1;
            cellCoords(i, j, :) = [ startX, floor(startX + pixelCountX - 1), startY, floor(startY + pixelCountY - 1) ];
        end
    end    
end
