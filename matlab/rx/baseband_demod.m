% run this script after running wt_mod_bpsk.m to generate the modulated samples
% that this script uses as its input

chirps_sym0 = [0 0 0 0 1 0 1 0 0 1 1 0 1 1 1];
chirps_polar = to_polar(chirps_sym0);

sps = 5;            % Samples per symbol
mf = generate_mf(1, 6, sps);

symbol_len = length(chirps_polar)*sps;

buffer = zeros(1, length(chirps_polar)*sps);
y = zeros(1, length(tx_out));

SFD = [1 1 1 0 0 1 0 1];
SFD_polar = to_polar(SFD);
SFD_buff = zeros(1, length(SFD_polar));

bits = [];

% initialize finite state machine
rx_state = Rx_State.Acquisition;
idx = 1;
run_state_idx = 1;

SFD_debug_y = [];
SFD_debug_corr = [];
while idx <= length(tx_out)
    
    % perform matched filter
    buffer = [buffer(2:end) tx_out(idx)];
    y(idx) = matched_filter(buffer, mf, chirps_polar);
    
    % feed matched filter output into the current state if the current
    % index is the index that the state requested to be woken up on
    if idx == run_state_idx
        switch rx_state
            case Rx_State.Acquisition
                [rx_state, run_state_idx] = acq_state(y, idx, symbol_len);
            case Rx_State.SFD_Search
                [rx_state, run_state_idx, SFD_buff, corr] = sfd_state(y, idx, symbol_len, SFD_polar, SFD_buff);
            case Rx_State.Demod
                [rx_state, run_state_idx, output_bit] = demod_state(y, idx, symbol_len);
                bits = [bits output_bit];
            otherwise
                break;
        end
    end
    
    idx = idx + 1;
end

figure(1);
plot(y);
title('Matched Filter Output');

figure(2);
data = [PHR PDSU];
stem(data);
hold on;
stem(bits);
hold off;
title('Txed vs Demodulated Bits');
legend('Txed bits', 'Demodulated bits');

bit_errors = sum(xor(data, bits))

function corr = matched_filter(in_samps, mf, chirps_polar)
    % performs a matched filter on each chirp, correlates each matched
    % filter output against the chirp sequence
    
    mf_len = length(mf);
    dsss_idx = 1;
    corr = 0;
    for idx = 1:mf_len:length(in_samps)
        cur_samps = in_samps(idx:(idx+mf_len-1));
        corr = corr + (sum(cur_samps.*mf)*chirps_polar(dsss_idx));
        dsss_idx = dsss_idx + 1;
    end
end