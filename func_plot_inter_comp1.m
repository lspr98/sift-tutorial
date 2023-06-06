function [] = func_plot_inter_comp1(scaled_extrema, harris_extrema, I_original)
    %NOT PART OF SIFT
    figure('position', [0, 0, 1200, 500]);
    colormap("gray");
    subplot(1, 2, 1);
    image(0, 0, I_original);
    title("intermediate SIFT");
    axis equal;
    hold on;
    plot(scaled_extrema(2, :), scaled_extrema(1, :), '+g');
    hold on;

    subplot(1, 2, 2);
    image(0, 0, I_original);
    title("Harris");
    axis equal;
    hold on;
    plot(harris_extrema);
end

