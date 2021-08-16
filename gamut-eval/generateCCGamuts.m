function generateCCGamuts(filename)
    original = imread(filename);
    greyworld = imread(strcat("greyworld-", filename));
    maxrgb = imread(strcat("maxrgb-", filename));
    shadesofgrey = imread(strcat("shadesofgrey-", filename));
    greyedge = imread(strcat("greyedge-", filename));
    
    saveas(gamut_volume(original), 'plots/OriginalGamut.png');
    saveas(gamut_volume(greyworld), 'plots/GreyworldGamut.png');
    saveas(gamut_volume(maxrgb), 'plots/MaxRGBGamut.png');
    saveas(gamut_volume(shadesofgrey), 'plots/ShadesofGreyGamut.png');
    saveas(gamut_volume(greyedge), 'plots/GreyworldEdge.png');
end