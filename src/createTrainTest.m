

imPaths = { 'da_vinci/images_1.jpeg', 'da_vinci/images_10.jpeg', 'da_vinci/images_11.jpeg', 'da_vinci/images_12.jpeg', 'da_vinci/images_13.jpeg', 'da_vinci/images_2.jpeg', 'da_vinci/images_3.jpeg', 'da_vinci/images_4.jpeg', 'da_vinci/images_5.jpeg', 'da_vinci/images_6.jpeg', 'da_vinci/images_7.jpeg', 'da_vinci/images_8.jpeg', 'da_vinci/images_9.jpeg', 'da_vinci/images.jpeg', 'dali/images_1.jpeg', 'dali/images_10.jpeg', 'dali/images_11.jpeg', 'dali/images_12.jpeg', 'dali/images_2.jpeg', 'dali/images_3.jpeg', 'dali/images_4.jpeg', 'dali/images_5.jpeg', 'dali/images_6.jpeg', 'dali/images_7.jpeg', 'dali/images_8.jpeg', 'dali/images_9.jpeg', 'dali/images.jpeg', 'monet/images_1.jpeg', 'monet/images_10.jpeg', 'monet/images_11.jpeg', 'monet/images_2.jpeg', 'monet/images_3.jpeg', 'monet/images_4.jpeg', 'monet/images_5.jpeg', 'monet/images_6.jpeg', 'monet/images_7.jpeg', 'monet/images_8.jpeg', 'monet/images_9.jpeg', 'monet/images.jpeg', 'picasso/images_1.jpeg', 'picasso/images_10.jpeg', 'picasso/images_2.jpeg', 'picasso/images_3.jpeg', 'picasso/images_4.jpeg', 'picasso/images_5.jpeg', 'picasso/images_6.jpeg', 'picasso/images_7.jpeg', 'picasso/images_8.jpeg', 'picasso/images_9.jpeg', 'picasso/images.jpeg' };

imClasses = zeros(size(imPaths, 1), 1);
imClasses(1:14) = 1;
imClasses(15:27) = 2;
imClasses(28:39) = 3;
imClasses(40:50) = 4;

mapping = { 'da_vinci', 'dali', 'monet', 'picasso' };

inds = 1:10;
inds = [ inds 15:23 ];
inds = [ inds 28:35 ];
inds = [ inds 28:35 ];
inds = [ inds 40:46 ];

tstInds = setdiff(1:size(imPaths, 2), inds);

imTrs = imPaths(inds);
imTss = imPaths(tstInds);

csTrs = imClasses(inds);
csTss = imClasses(tstInds);

save('traintest.mat', 'imPaths', 'imTrs', 'imTss', 'csTrs', 'csTss', 'mapping');
