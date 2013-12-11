
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
testFeatures( { rem_imgs; van_imgs; mon_imgs }, { rem_gist; van_gist; mon_gist } );

rem_hog = getHogFeatures(rem_imgs);
van_hog = getHogFeatures(van_imgs);
mon_hog = getHogFeatures(mon_imgs);
testFeatures( { rem_imgs; van_imgs; mon_imgs }, { rem_hog; van_hog; mon_hog } );

rem_smap = getSimpSalFeatures(rem_imgs);
van_smap = getSimpSalFeatures(van_imgs);
mon_smap = getSimpSalFeatures(mon_imgs);
testFeatures( { rem_imgs; van_imgs; mon_imgs }, { rem_smap; van_smap; mon_smap } );

rem_haralick = getHaralickFeatures(rem_imgs);
van_haralick = getHaralickFeatures(van_imgs);
mon_haralick = getHaralickFeatures(mon_imgs);
testFeatures( { rem_imgs; van_imgs; mon_imgs }, { rem_haralick; van_haralick; mon_haralick } );

rem_feats = [ rem_gist rem_hog rem_smap rem_haralick ];
van_feats = [ van_gist van_hog van_smap van_haralick ];
mon_feats = [ mon_gist mon_hog mon_smap mon_haralick ];
testFeatures( { rem_imgs; van_imgs; mon_imgs }, { rem_feats; van_feats; mon_feats } );

rem_Color = getColorFeatures(rem_imgs);
van_Color = getColorFeatures(van_imgs);
mon_Color = getColorFeatures(mon_imgs);
testFeatures( { rem_imgs; van_imgs; mon_imgs }, { rem_Color; van_Color; mon_Color } );









