
function projection=gamut_volume(img)
    img = double(img);

    r = img(:, :, 1);
    g = img(:, :, 2);
    b = img(:, :, 3);
    rgb = [r(:), g(:), b(:)];
    r = rgb(:,1);
    g = rgb(:,2);
    b = rgb(:,3);
    k = boundary(rgb);
    projection = trisurf(k, r, g, b, 'EdgeColor', 'black');

    %%% modify projection
    shading flat
    colormap(gray)
    % contour(rgb);
    xlabel('r')
    ylabel('g')
    zlabel('b')
    xlim([0, 255])
    ylim([0, 255])
    zlim([0, 255])
    view([1, 1, 1])
    grid off
    box on
    pbaspect([1 1 1])
    set(gcf, 'Position', [100, 100, 512, 512])
end