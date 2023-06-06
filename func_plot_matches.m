function [] = func_plot_matches(matches, img1, img2, titlename)
    %NOT PART OF SIFT
    [h_1, w_1] = size(img1);
    [h_2, w_2] = size(img2);

    h_diff = h_1 - h_2;

    if h_diff > 0
        top_pad = floor(h_diff/2);

        padded_img2 = zeros(h_1, w_2);
        padded_img2((top_pad+1):(top_pad+h_2), :) = img2;

        multi = [img1 padded_img2];

    elseif h_diff < 0
        top_pad = floor(-h_diff/2);

        padded_img1 = zeros(h_2, w_1);
        padded_img1((top_pad+1):(top_pad+h_1), :) = img1;

        multi = [padded_img1 img2];

    else
        top_pad = 0;
        multi = [img1 img2];
    end
    figure('position', [0, 0, 1200, 500]);
    colormap("gray");
    imshow(multi, []);
    hold on;
    [~, n_matches] = size(matches);
    for i = 1:n_matches
        if h_diff > 0
            plot([matches(4, i) (matches(9, i)+w_1)], [(matches(3, i)) (matches(8, i)+top_pad)], 'r');
            hold on;
        elseif h_diff < 0
            plot([(matches(4, i)) (matches(9, i)+w_1)], [(matches(3, i)+top_pad) matches(8, i)], 'r');
            hold on;
        else
            plot([(matches(4, i)) (matches(9, i)+w_1)], [matches(3, i) matches(8, i)], 'r');
            hold on;
        end
    end
    hold on;
    title(titlename);
    


end

