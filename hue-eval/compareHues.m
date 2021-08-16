function compareHues(index, inputfile, outputfile, skintone_hue, dev)
    vals = zeros(0,1);

    input_table = readmatrix(inputfile);
    hues = input_table(:, index);
    
    hues = sort(hues);
    hues = hues * 2 * pi;
    
    polarhistogram(hues, 15);
    hold on
    st_theta = skintone_hue * 2 * pi;
    topdev = st_theta + (dev * 2 * pi);
    bottomdev = st_theta - (dev * 2 * pi);
    polarplot([st_theta-dev st_theta st_theta+dev; st_theta-dev st_theta st_theta+dev], [0 0 0; 1 1 1]*112)
    hold off
    rlim([0, 112])
%     thetaline(skintone_hue, '--', 'Skin Tone', 'LineWidth', 2);
%     thetaline(skintone_hue + dev, '--');
%     thetaline(skintone_hue - dev, '--');
    
%     saveas(b, outputfile);
    
%     hue_diff = hues - skintone_hue;
%     vals(1) = min(hue_diff);
%     vals(2) = max(hue_diff);
%     vals(3) = mean(hue_diff);
%     vals(4) = std(hue_diff);
    
%     writematrix(vals, outputfile);
end