function [] = func_plot_after_accu(high_extrema, scaled_high_extrema, keypoints_this_level, high_sspace_transformed, I_original)
    % NOT PART OF SIFT
    % plot it on higher scale image.
    figure('Position', [0 0 1400 700]);
    colormap("gray");
    subplot(1, 2, 1);
    imshow(high_sspace_transformed, []);
    title("Corrected keypoints (on high scale image)");
    axis equal;
    hold on;
    plot(high_extrema(2, :), high_extrema(1, :), 'sg');
    hold on;
    plot(keypoints_this_level(2, :), keypoints_this_level(1, :), '+r');

    % plot more accurate position in original image
    subplot(1, 2, 2);
    imshow(I_original, []);
    title("Corrected keypoints (on original image)");
    axis equal;
    hold on;
    plot(scaled_high_extrema(2, :), scaled_high_extrema(1, :), 'sg');
    hold on;
    plot(keypoints_this_level(7, :), keypoints_this_level(6, :), '+r');
end

