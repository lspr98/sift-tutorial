function [] = func_plot_car_angles(matches, ph1, ph2, img1, img2, titlename)
    %NOT PART OF SIFT
    [h_1, w_1] = size(img1);
    [h_2, w_2] = size(img2);
    
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
    
    % plot
    multi = [img1 img1; img2 img2];
    figure('position', [0, 0, 1200, 500]);
    colormap("gray");
    imshow(multi, []);
    hold on;
    [~, n_matches] = size(matches);
    % plot SIFT features
    for i = 1:n_matches
        plot([matches(4, i) matches(9, i)], [(matches(3, i)) (matches(8, i)+h_1)], 'r');
        hold on;
    end
    hold on;
    % plot Harris features
    [~, n_matches] = size(harrisMatches);
    for i = 1:n_matches
        plot([(harrisMatches(4, i)+w_1) (harrisMatches(9, i)+w_1)], [(harrisMatches(3, i)) (harrisMatches(8, i)+h_1)], 'r');
        hold on;
    end
    title(titlename);
    
end

