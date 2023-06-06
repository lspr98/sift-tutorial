function [fig] = func_plot_octaves(base_sigma, s, octaves)
    %NOT PART OF SIFT
    fig = figure('position', [0, 0, 1700, 1000]);
    hold on;
    colormap("gray");

    [n_octaves, n_scales] = size(octaves);

    for j = 1:n_octaves
       subplot(1, n_octaves, j);
        H = [];
        for i = 1:n_scales
            % normalize image value range (this is only required for plotting)
            curr_img = octaves{j, i};
            curr_img = curr_img - min(curr_img, [], "all");
            curr_img = curr_img / max(curr_img, [], "all");

            cmax = max(curr_img, [], "all");
            cmin = min(curr_img, [], "all");
            H(i) = slice(repmat(curr_img, [1 1 (i+1)*5]),[],[], i*5);
            set(H(i), 'EdgeColor', 'none');
            hold on;
        end
        hold off;
        axis ij
        zticks(linspace(5, n_scales*5, n_scales));
        scale_lables = [];
        for i = 1:n_scales
            if i==1
                curr_octave_scale = 2^(j-1);
                scale_lables = [(string(curr_octave_scale) + '\sigma_{base} = ' + string(base_sigma*curr_octave_scale))];
            else
                effective_scale = round((curr_octave_scale)*base_sigma*2^((i-1)/s), 2);
                scale_lables = [scale_lables (string(effective_scale))];
            end
        end
        zticklabels(scale_lables);
        zlabel("\sigma");
        xlabel("x");
        ylabel("y");
        title("Octave " + j);
        view(45, 20); 
    end
end

