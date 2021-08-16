file = 'neutral.png';

img = imread(file);

colorcloud(img, 'hsv');
view([0, 0, 1])