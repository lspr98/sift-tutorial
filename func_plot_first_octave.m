function [fig] = func_plot_first_octave(base_sigma, n_scales, s, octave, dogs)
    %NOT PART OF SIFT

    fig = figure('position', [0, 0, 1000, 1000]);
    hold on;
    colormap("gray");
    subplot(1, 2, 1);
    for i = 1:n_scales
        % get the i-th scale in the octave
        curr_img = octave{1, i};

        % normalize it for plotting (not part of SIFT)
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
            scale_lables = [('\sigma_{base} = ' + string(base_sigma))];
        else
            effective_scale = base_sigma*2^((i-1)/s);
            scale_lables = [scale_lables (string(effective_scale))];
        end
    end
    zticklabels(scale_lables);
    zlabel("\sigma");
    title("First octave");
    view(45, 20);

    H = [];
    %plot the difference of gaussians
    subplot(1, 2, 2);
    for i = 1:(n_scales-1)
        % get the i-th DoG
        curr_img = dogs{1, i};

        % normalize it for plotting (not part of SIFT)
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
    for i = 1:(n_scales-1)
        if i==1
            scale_lables = [('\sigma_{base} = ' + string(base_sigma))];
        else
            effective_scale = base_sigma*2^((i-1)/s);
            scale_lables = [scale_lables (string(effective_scale))];
        end
    end
    zticklabels(scale_lables);
    zlabel("\sigma");
    title("Corresponding DoG");
    view(45, 20);


end

