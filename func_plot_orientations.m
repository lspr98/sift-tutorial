function [] = func_plot_orientations(I_original, features, theta_refs)
    %NOT PART OF SIFT
    figure("Position", [0, 0, 1000, 1000]);
    colormap("gray");
    image(0, 0, I_original);
    title("Gradient orientations");
    axis equal;
    hold on;
    % plot gradient directions
    [~, n_features] = size(features);
    g_length = 10;
    for i = 1:n_features
        f = features(:, i);
        xa = f(3);
        ya = f(4);
        plot(ya, xa, '+g');
        hold on;
        theta = nonzeros(theta_refs(:, i));
        [n_thetas, ~] = size(theta);
        for j = 1:n_thetas
            angle = theta(j);
            xg = round(g_length*sin(angle)) + xa;
            yg = round(g_length*cos(angle)) + ya;
            plot([ya yg], [xa xg], 'g');
            hold on;
        end
    end
end

