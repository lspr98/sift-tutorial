function [] = func_plot_problem(high_extrema, scaled_high_extrema, high_sspace_transformed, high_dog, I_original, first_dog, highest_octave, n_extrema)
    %NOT PART OF SIFT
    % plotting
    figure('Position', [0 0 1500 1500]);
    colormap("gray");
    subplot(2, 2, 1);
    imshow(high_sspace_transformed, []);
    title("High scale-space extrema");
    axis equal;
    hold on;
    plot(high_extrema(2, :), high_extrema(1, :), 'sg');
    hold on;

    subplot(2, 2, 2);
    imshow(high_dog, []);
    title("High scale-space extrema (on DoG)");
    axis equal;
    hold on;
    plot(high_extrema(2, :), high_extrema(1, :), 'sg');
    hold on;

    subplot(2, 2, 3);
    imshow(I_original, []);
    title("High scale-space extrema (on original image)");
    axis equal;
    hold on;
    plot(scaled_high_extrema(2, :), scaled_high_extrema(1, :), 'sg');
    hold on;

    subplot(2, 2, 4);
    imshow(first_dog, []);
    title("High scale-space extrema (on lowest DoG)");
    axis equal;
    hold on;
    plot(2*scaled_high_extrema(2, :), 2*scaled_high_extrema(1, :), 'sg');
    hold on;
    disp("Highest octave that has an extrema: " + highest_octave + ", found " + n_extrema + " extrema in that level");
end

