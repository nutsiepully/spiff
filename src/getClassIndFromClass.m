function [ c ] = getClassIndFromClass(mapping, class)
    for i = 1:size(mapping, 2),
        if strcmp(mapping{i}, class),
            c = i;
        end
    end
end
