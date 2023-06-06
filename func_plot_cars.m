function [] = func_plot_cars(matches, img1, img2, titlename)
    %NOT PART OF SIFT
    [h_1, w_1] = size(img1);
    [h_2, w_2] = size(img2);

    multi = [img1; img2];
    figure('position', [0, 0, 1200, 500]);
    colormap("gray");
    imshow(multi, []);
    hold on;
    [~, n_matches] = size(matches);
    for i = 1:n_matches
        plot([matches(4, i) matches(9, i)], [(matches(3, i)) (matches(8, i)+h_1)], 'r');
        hold on;
    end
    hold on;
    title(titlename);
end

