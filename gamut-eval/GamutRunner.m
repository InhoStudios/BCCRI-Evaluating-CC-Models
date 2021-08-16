file = 'res/neutral.png';

img = imread(file);
% gamut_volume(img);
colorcloud(img);
view([-1, -1, -1])
camproj('perspective');
view([-1, -1, -1])
grid off
box on
pbaspect([1 1 1])
set(gcf, 'Position', [100, 100, 512, 512])

% generateCCGamuts(file);