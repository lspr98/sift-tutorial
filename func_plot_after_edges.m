function [] = func_plot_after_edges(final_keypoints, keypoints_this_level, high_sspace_transformed, I_original)
    %NOT PART OF SIFT
    %plotting
    % plot it on higher scale image.
    figure('Position', [0 0 1400 700]);
    colormap("gray");
    subplot(1, 2, 1);
    imshow(high_sspace_transformed, []);
    title("Removed edge responses");
    axis equal;
    hold on;
    plot(keypoints_this_level(2, :), keypoints_this_level(1, :), 'sg');
    hold on;
    plot(final_keypoints(2, :), final_keypoints(1, :), '+r');

    % plot more accurate position in original image
    subplot(1, 2, 2);
    imshow(I_original, []);
    title("Removed edge responses (on original image)");
    axis equal;
    hold on;
    plot(keypoints_this_level(7, :), keypoints_this_level(6, :), 'sg');
    hold on;
    plot(final_keypoints(7, :), final_keypoints(6, :), '+r');
end

