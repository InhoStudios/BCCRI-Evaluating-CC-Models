abh = 'ABH Values All.csv';

[skintone_hue, dev] = getSkinToneHue(1)

compareHues(3, abh, 'tables\hue_diff_og_0.png', skintone_hue, dev)
% compareHues(6, abh, 'tables\hue_diff_gw_0.png', skintone_hue)
% compareHues(9, abh, 'tables\hue_diff_mrgb_0.png', skintone_hue)
% compareHues(12, abh, 'tables\hue_diff_sog_0.png', skintone_hue)
% compareHues(15, abh, 'tables\hue_diff_ge_0.png', skintone_hue)
% 
% skintone_hue = getSkinToneHue(1)
% 
% compareHues(3, abh, 'tables\hue_diff_og_1.png', skintone_hue)
% compareHues(6, abh, 'tables\hue_diff_gw_1.png', skintone_hue)
% compareHues(9, abh, 'tables\hue_diff_mrgb_1.png', skintone_hue)
% compareHues(12, abh, 'tables\hue_diff_sog_1.png', skintone_hue)
% compareHues(15, abh, 'tables\hue_diff_ge_1.png', skintone_hue)
