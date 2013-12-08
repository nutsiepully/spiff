
rem_imgs = loadAllPictures('rembrandt');
van_imgs = loadAllPictures('gogh');
mon_imgs = loadAllPictures('monet');

rem_meanStd = meanStdImgs(rem_imgs);
van_meanStd = meanStdImgs(van_imgs);
mon_meanStd = meanStdImgs(mon_imgs);

hold on;
plot(rem_meanStd(:, 1), rem_meanStd(:, 2), 'bo')
plot(van_meanStd(:, 1), van_meanStd(:, 2), 'rx')
plot(mon_meanStd(:, 1), mon_meanStd(:, 2), 'g+')

rem_edgeFeats = edgeFeatures(rem_imgs);
van_edgeFeats = edgeFeatures(van_imgs);
mon_edgeFeats = edgeFeatures(mon_imgs);

hold on;
plot(rem_edgeFeats(:, 1), rem_edgeFeats(:, 2), 'bo')
plot(van_edgeFeats(:, 1), van_edgeFeats(:, 2), 'rx')
plot(mon_edgeFeats(:, 1), mon_edgeFeats(:, 2), 'g+')

rem_dwtFeats = dwtFeatures(rem_imgs);
van_dwtFeats = dwtFeatures(van_imgs);
mon_dwtFeats = dwtFeatures(mon_imgs);

hold on;
plot(rem_dwtFeats, 'bo')
plot(van_dwtFeats, 'rx')
plot(mon_dwtFeats, 'g+')

rem_blurFeats = cellfun(@blur_spy_clean, rem_imgs);
van_blurFeats = cellfun(@blur_spy_clean, van_imgs);
mon_blurFeats = cellfun(@blur_spy_clean, mon_imgs);

hold on;
plot(rem_blurFeats, 'bo')
plot(van_blurFeats, 'rx')
plot(mon_blurFeats, 'g+')

rem_gist = getGistFeatures(rem_imgs);
van_gist = getGistFeatures(van_imgs);
mon_gist = getGistFeatures(mon_imgs);
