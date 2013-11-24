function [ c ] = getClassIndFromClass(mapping, class)
    for i = 1:length(mapping),
        if strcmp(mapping{i}, class),
            c = i;
        end
    end
end
