% Good filter size: 10-12
% Good threshold size: 20

function out = removeHair(input_img, filter_size)
    greyscale = rgb2gray(input_img);
    disp("Greyscaled")
    kernel = strel('diamond', filter_size);
    blackhat = imbothat(greyscale, kernel);
    disp("Morphological Filter Applied");
    threshold = roicolor(blackhat, 30, 255);
    disp("Threshold Generated. Inpainting...");
    out = inpaintExemplar(input_img, threshold);
    disp("HR Algorithm Finished");
end