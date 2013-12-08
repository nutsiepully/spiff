function [ imgs ] = loadAllPictures( artistName )
    imageFiles = rdir(['../datasets/www.ibiblio.org/wm/paint/auth/', artistName, '/**/*.jpg']);
    
    imgs = {};
    for i = 1:length(imageFiles)
        val = regexp(imageFiles(i).name, 'small.jpg', 'match');
        if ~isempty(val)
            continue;
        end
        imgs{end+1} = im2double(rgb2gray(imread(imageFiles(i).name)));
    end
    imgs = imgs';
end
