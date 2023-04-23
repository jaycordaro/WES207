% run this script after running wt_mod_bpsk.m to generate the modulated samples
% that this script uses as its input

chirps_sym0 = [0 0 0 0 1 0 1 0 0 1 1 0 1 1 1];
chirps_polar = to_polar(chirps_sym0);

bit_rate = 40000;
sps = 5;            % Samples per symbol
fs = (bit_rate*length(chirps_polar)*sps);

mf = generate_mf(1, 6, sps);

fn = 10;
zeta = 2;
Kt = 4*pi*zeta*fn;
pll = PLL_Class(true, fn, zeta, Kt, 1/bit_rate);

symbol_len = length(chirps_polar)*sps;

tx = awgn(tx_out, 0, pow2db(mean(abs(tx_out).^2)));

angle_off = 3*pi/4;
tx = tx*exp(i*angle_off);

freq_off = -1000;
n = 0:(length(tx_out)-1);
tx = tx.*exp(i*2*pi*freq_off/fs*n);

buffer = zeros(1, length(chirps_polar)*sps);
y = zeros(1, length(tx));
power = zeros(1, length(tx));
y_scaled = zeros(1, length(tx));

SFD = [1 1 1 0 0 1 0 1];
SFD_polar = to_polar(SFD);
SFD_buff = zeros(1, length(SFD_polar));

bits = [];

% initialize finite state machine
rx_state = Rx_State.Acquisition;
idx = 1;
run_state_idx = 1;

bit_mfos = [];

SFD_debug_y = [];
SFD_debug_corr = [];
while idx <= length(tx)
    
    % perform matched filter
    buffer = [buffer(2:end) tx(idx)];

    % phase correction
    buffer_corr = buffer*exp(i*pll.curr_phase);
    
    % frequency correction
    buffer_corr = buffer_corr.*exp(-i*pll.curr_frequency/fs*[0:(length(buffer) - 1)]);
    
    [y(idx)] = matched_filter(buffer_corr, mf, chirps_polar);
    power(idx) = sum(abs(buffer_corr).^2);
    y_scaled(idx) = abs(y(idx))/power(idx);
    if(power(idx) < 10)
        y_scaled(idx) = 0;
    end
    
    
    % feed matched filter output into the current state if the current
    % index is the index that the state requested to be woken up on
    if idx == run_state_idx
        switch rx_state
            case Rx_State.Acquisition
                [rx_state, run_state_idx] = acq_state(y, idx, symbol_len, power(idx));
            case Rx_State.SFD_Search
                [rx_state, run_state_idx, SFD_buff, corr, polarity] = sfd_state(y, idx, symbol_len, SFD_polar, SFD_buff, power(idx));
            case Rx_State.Demod
                [rx_state, run_state_idx, output_bit] = demod_state(y, idx, symbol_len, polarity);
                bits = [bits output_bit];
            otherwise
                break;
        end
        
        if (rx_state == Rx_State.SFD_Search) || (rx_state == Rx_State.Demod)
            bit_mfos = [bit_mfos y(idx)];
            pll = runPLL(pll, y(idx));
        end
    end
    
    idx = idx + 1;
end

figure(1);
plot(y_scaled);
title('Matched Filter Output');

figure(2);
plot(real(bit_mfos));
title('Real portion of matched filter output');

% TODO: this looks really bad, why?
figure(3);
plot(pll.frequency_output);
title('PLL frequency output');

data = [PHR PDSU];
% stem(data);
% hold on;
% stem(bits);
% hold off;
% title('Txed vs Demodulated Bits');
% legend('Txed bits', 'Demodulated bits');
% 
if length(data) == length(bits)
    bit_errors = sum(xor(data, bits))
end

function [corr] = matched_filter(in_samps, mf, chirps_polar)
    % performs a matched filter on each chirp, correlates each matched
    % filter output against the chirp sequence
    
    mf_len = length(mf);
    dsss_idx = 1;
    corr = 0;
    for idx = 1:mf_len:length(in_samps)
        cur_samps = in_samps(idx:(idx+mf_len-1));
        mfo = sum(cur_samps.*mf)*chirps_polar(dsss_idx);
        corr = corr + mfo;
        dsss_idx = dsss_idx + 1;
    end
end