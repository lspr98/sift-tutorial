function [] = func_plot_harris_matches(ph1, ph2, img1, img2, titlename)
    %NOT PART OF SIFT
    % extract harris features
    [fh1, vp1] = extractFeatures(img1, ph1);
    [fh2, vp2] = extractFeatures(img2, ph2);
    indexPairs = matchFeatures(fh1, fh2);
    matchedPoints1 = vp1(indexPairs(:, 1),:);
    matchedPoints2 = vp2(indexPairs(:, 2),:);
    harrisMatches = zeros(10, 1);
    [n_matches, ~] = size(indexPairs);
    if n_matches == 0
        % no matches found
        disp("WARNING: Harris couldn't find any matches!");
        harrisMatches(:, 1) = [];
    else
        % transform features
        for i = 1:n_matches
            p1 = matchedPoints1(i).Location;
            p2 = matchedPoints2(i).Location;
            p1 = round(p1);
            p2 = round(p2);

            new_match = zeros(10, 1);
            new_match(3) = p1(2);
            new_match(4) = p1(1);
            new_match(8) = p2(2);
            new_match(9) = p2(1);
            harrisMatches = [harrisMatches new_match];
        end
        harrisMatches(:, 1) = [];
    end
    
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
    [~, n_matches] = size(harrisMatches);
    for i = 1:n_matches
        if h_diff > 0
            plot([harrisMatches(4, i) (harrisMatches(9, i)+w_1)], [(harrisMatches(3, i)) (harrisMatches(8, i)+top_pad)], 'r');
            hold on;
        elseif h_diff < 0
            plot([(harrisMatches(4, i)) (harrisMatches(9, i)+w_1)], [(harrisMatches(3, i)+top_pad) harrisMatches(8, i)], 'r');
            hold on;
        else
            plot([(harrisMatches(4, i)) (harrisMatches(9, i)+w_1)], [harrisMatches(3, i) harrisMatches(8, i)], 'r');
            hold on;
        end
    end
    hold on;
    title(titlename);
    
end

