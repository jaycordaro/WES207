function decimated_output = sd_decimation_many_stages(in_vec, input_rate, output_rate)
    if (min(in_vec) == 0)  % if input is digital (0,1) make antipodal
        in_vec=2*in_vec-1;
    end

    if (iscolumn(in_vec))  % if input vector is a column vector, make it a row vector...
        in_vec=in_vec';
    end
    
    x = in_vec;
    fs = input_rate;
    
    % get input/output ratio
    [I, D] = rat(output_rate/input_rate);
    
    % not doing interpolation for now, but it could be done
    assert(I == 1);
    
    % determine how many filtering stages we need and how much they
    % will decimate by
    stages = factor(D);
    n_stages = length(stages);
    
    filter_lengths = 4;
    
    for idx = 1:n_stages
        % generate filter
        decimation = stages(idx);
        f_pass = (fs/2)/decimation;
        f_stop = f_pass*1.5;
        h = firpm(filter_lengths-1, [0 f_pass f_stop fs/2]/(fs/2), {'myfrf',[1 1 0 0]}, [1 10]);
        
        % apply filter
        x = conv(x, h);
        x = downsample(x, decimation);
        fs = fs/decimation;
    end
    
    decimated_output = x;
    
end