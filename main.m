folder = 'images\**';
export_folder = 'exports\';
images = dir(fullfile(folder, '\*.jpg'));

rows = numel(images);
filter_rad = 9;

values = zeros(rows, 15);

% combine all values into one table
% | og a | og b | og h | gw a | gw b | gw h | mrgb a | mrgb b | mrgb h
% | sog a | sog b | sog h | ge a | ge b | ge h |

for i = 1:rows
    imgname = images(i).name;
    foldername = image(i).folder;
    filename = fullfile(foldername, imgname);
    input_im = uint8(imread(filename));
    
    fprintf('Processing %d of %d: %s...\n', i, rows, filename);
    
    disp("Image read");
    
%     nh_im = removeHair(input_im, filter_rad);
    
    [aAvg, aDev, bAvg, bDev, hAvg] = calculateColour(input_im);
    
    values(i, 1) = aAvg;
    values(i, 2) = bAvg;
    values(i, 3) = hAvg;
    
%%%%%%%%%%%%%
    
    input_im = double(imread(filename));
    
    [wR,wG,wB,out1]=shades_of_grey(input_im,1);
    greyWorld = uint8(out1);
    imwrite(greyWorld,strcat("gw-", filename));
%     greyWorld = uint8(imread(strcat("greyworld-", filename)));

%     greyWorld = removeHair(greyWorld, filter_rad);
    
    [aAvg, aDev, bAvg, bDev, hAvg] = calculateColour(greyWorld);
    
    values(i, 4) = aAvg;
    values(i, 5) = bAvg;
    values(i, 6) = hAvg;
    
%%%%%%%%%%%%%
    
    [wR,wG,wB,out2]=shades_of_grey(input_im,-1);
    maxRGB = uint8(out2);
    imwrite(maxRGB,strcat("mrgb-", filename));
%     maxRGB = uint8(imread(strcat("maxrgb-", filename)));

%     maxRGB = removeHair(maxRGB, filter_rad);

    [aAvg, aDev, bAvg, bDev, hAvg] = calculateColour(maxRGB);
    
    values(i, 7) = aAvg;
    values(i, 8) = bAvg;
    values(i, 9) = hAvg;
    
%%%%%%%%%%%%%
    
    p=5;    % any number between 1 and infinity
    [wR,wG,wB,out3]=shades_of_grey(input_im,p);
    shadesOfGrey = uint8(out3);
    imwrite(shadesOfGrey,strcat("shadesofgrey-", filename));
%     shadesOfGrey = uint8(imread(strcat("sog-", filename)));

%     shadesOfGrey = removeHair(shadesOfGrey, filter_rad);

    [aAvg, aDev, bAvg, bDev, hAvg] = calculateColour(shadesOfGrey);
    
    values(i, 10) = aAvg;
    values(i, 11) = bAvg;
    values(i, 12) = hAvg;
    
%%%%%%%%%%%%%
    
    sigma=2;        % sigma 
    diff_order=1;   % differentiation order (1 or 2)
    [wR,wG,wB,out4]=general_cc(input_im,diff_order,p,sigma);
    greyEdge = uint8(out4);
    imwrite(greyEdge,strcat("greyedge-", filename));
%     greyEdge = uint8(imread(strcat("ge-", filename)));

%     greyEdge = removeHair(greyEdge, filter_rad);

    [aAvg, aDev, bAvg, bDev, hAvg] = calculateColour(greyEdge);

    values(i, 13) = aAvg;
    values(i, 14) = bAvg;
    values(i, 15) = hAvg;
    
    disp(string(i));
end

writematrix(values, "ABH Values All.csv")

cc_deviations = zeros(5, 3);

for modelcursor = 1 : 5
    for statcursor = 1 : 3
        index = ((modelcursor - 1) * 3) + statcursor;
        value = values(:, index);
        deviation = std(value(:));
        disp(strcat("Writing Model: ", string(modelcursor), ", Stat: ", string(statcursor), " to matrix"));
        cc_deviations(modelcursor, statcursor) = deviation;
    end
end

writematrix(cc_deviations, "CC ABH Hair Removal.csv");

%%%%%%

function [aAvg, aDev, bAvg, bDev, hAvg] = calculateColour(image)

    img_lab = rgb2lab(image);
    disp("Image converted to LAB space");
    
    img_a = img_lab(:, :, 2);
    img_b = img_lab(:, :, 3);
    
    aAvg = mean(img_a(:));
    bAvg = mean(img_b(:));
    
    aDev = std(img_a(:));
    bDev = std(img_b(:));
    
    disp("Values averaged, deviations calculated");

    img_hsv = rgb2hsv(image);
    disp("Image converted to HSV space");

    img_h = img_hsv(:, :, 1);
    hAvg = mean(img_h(:));
    
    disp("Values averaged, deviations calculated");
end