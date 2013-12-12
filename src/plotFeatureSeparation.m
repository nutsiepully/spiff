function plotFeatureSeparation( imgFeats, type)
    colors = { 'r', 'g', 'b', 'k', 'y', 'c' };
    if nargin < 2
        type = [ 1 0 ];
    end
    
    hold on;
    xlabel('Mean of Features');
    ylabel('Value');
    for i = 1:length(imgFeats)
        if type(1) == 1
            if type(2) == 0
                plot(mean(imgFeats{i}), colors{i});
            else
                plot(smooth(mean(imgFeats{i}), 8), colors{i});
            end
        elseif type(1) == 2
            for j = 1:size(imgFeats{i}, 1)
                plot(imgFeats{i}(j, :), colors{i});
            end
        end
    end
    legend('Rembrandt', 'Van Gogh', 'Monet');
end
