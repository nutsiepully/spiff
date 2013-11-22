function [ numDimensions ] = getNumDimensions(k, l)
    numDimensions = k * ( 4 ^ l - 1 ) / 3;
end
