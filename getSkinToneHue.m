%
% Source: 0 = using skin colour CSV
%         1 = using standardized images
%
function [skintone_hue, dev] = getSkinToneHue(source)

%%% Using "skin colour" RGB values
    if source == 0

        skintone_rgb = readmatrix('SkinToneRGB.csv');
        skintone_rgb = skintone_rgb/256;
        skintone_hsv = rgb2hsv(skintone_rgb);
        hue = skintone_hsv(:,1);
        skintone_hue = mean(hue);
        dev = std(hue);
    
%%% Using standardized images
    elseif source == 1

        values = readmatrix('ABH Values All.csv');

        folder = 'standardized_images';
        images = dir(fullfile(folder, '\*.jpg'));

        rows = numel(images);

        hues = zeros(5, 1);

        for i = 1:rows
            filename = fullfile(folder, images(i).name);
            input_im = imread(filename);

            im_hsv = rgb2hsv(input_im);
            hue = im_hsv(:, :, 1);
            nonzero_hue = nonzeros(hue(:)');
            mean_hue = mean(nonzero_hue);
            hues(i, 1) = mean_hue;
        end

        skintone_hue = mean(hues);
        dev = std(hues);
    else
        disp("Please choose 0 or 1");
        skintone_hue = 0;
        dev = 0;
    end
end