function plotAllFeatures( imgFeats )
    colors = { 'b', 'r', 'k', 'g', 'y', 'c' };
    numFeats = size(imgFeats{1}, 2);
    for i = 1:numFeats
        subplot(3, floor(numFeats / 3), i);
        xlabel(num2str(i));
        hold on
        for j = 1:length(imgFeats)
            feats = imgFeats{j};
            plot(feats(:, i), colors{j});
        end
    end
end
