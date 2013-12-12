function plotFeatureSeparation( imgFeats )
    colors = { 'b', 'r', 'k', 'g', 'y', 'c' };
    hold on;
    for i = 1:length(imgFeats)
        plot(mean(imgFeats{i}), colors{i});
%         for j = 1:size(imgFeats{i}, 1)
%             plot(imgFeats{i}(j, :), colors{i});
%         end
    end
end
