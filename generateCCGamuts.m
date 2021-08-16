function generateCCGamuts(filename)
    original = imread(filename);
    greyworld = imread(strcat("gw-", filename));
    maxrgb = imread(strcat("mrgb-", filename));
    shadesofgrey = imread(strcat("sog-", filename));
    greyedge = imread(strcat("ge-", filename));
    
    saveas(gamut_volume(original), 'OriginalGamut.png');
    saveas(gamut_volume(greyworld), 'GreyworldGamut.png');
    saveas(gamut_volume(maxrgb), 'MaxRGBGamut.png');
    saveas(gamut_volume(shadesofgrey), 'ShadesofGreyGamut.png');
    saveas(gamut_volume(greyedge), 'GreyworldEdge.png');
end