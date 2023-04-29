% run this script after running wt_mod_bpsk.m to generate the modulated samples
% that this script uses as its input

% chirp sequence in polar form
chirps_sym0 = [0 0 0 0 1 0 1 0 0 1 1 0 1 1 1];
chirps_polar = to_polar(chirps_sym0);

% SFD indicating the end of the preamble
SFD = [1 1 1 0 0 1 0 1];
SFD_polar = to_polar(SFD);
SFD_buff = zeros(1, length(SFD_polar));

% modulation parameters
bit_rate = 40000;
samples_per_symbol = 5;
fs = (bit_rate*length(chirps_polar)*samples_per_symbol);
symbol_len = length(chirps_polar)*samples_per_symbol;

% matched filter
mf = generate_mf(1, 6, samples_per_symbol);

% initialize PLLs
fn = 10;
zeta = 2;
Kt = 4*pi*zeta*fn;
pll = PLL_Class(true, fn, zeta, Kt, 1/bit_rate);

% apply channel distortions

% Add noise
SNR_dB = 10;
tx = awgn(tx_out, SNR_dB, pow2db(mean(abs(tx_out).^2)));

% Phase offset
phase_off = 3*pi/4;
tx = tx*exp(i*phase_off);

% frequency offset
freq_off = 200; % Hz
n = 0:(length(tx_out)-1);
tx = tx.*exp(i*2*pi*freq_off/fs*n);

% buffers used by demodulator
buffer = zeros(1, length(chirps_polar)*samples_per_symbol); % samples to run matched filter on
mfos = zeros(1, length(tx)); % matched filter outputs
power = zeros(1, length(tx)); % power of matched filter window
mfos_scaled = zeros(1, length(tx)); % matched filter outputs scaled by power
bits = []; % demodulated data bits
bit_mfos = []; % matched filter outputs for each chirp sequence representing a bit


% initialize finite state machine
rx_state = Rx_State.Acquisition;
idx = 1;
run_state_idx = 1;

while idx <= length(tx)
    
    % perform matched filter
    buffer = [buffer(2:end) tx(idx)];

    % phase correction
    buffer_corr = buffer*exp(i*pll.curr_phase);
    
    % frequency correction
    buffer_corr = buffer_corr.*exp(-i*pll.curr_frequency/fs*[0:(length(buffer) - 1)]);
    
    % perform matched filter
    mfos(idx) = matched_filter(buffer_corr, mf, chirps_polar);
    
    % calculated power
    power(idx) = sum(abs(buffer_corr).^2);
    
    % generate scaled matched filter output
    mfos_scaled(idx) = abs(mfos(idx))/power(idx);
    if(power(idx) < 10)
        mfos_scaled(idx) = 0;
    end
    
    % feed matched filter output into the current state if the current
    % index is the index that the state requested to be woken up on
    if idx == run_state_idx
        switch rx_state
            case Rx_State.Acquisition
                % search for 0 bit chirp sequence
                [rx_state, run_state_idx] = acq_state(mfos, idx, symbol_len, power(idx));
            case Rx_State.SFD_Search
                % search for SFD at end of preamble
                [rx_state, run_state_idx, SFD_buff, corr, polarity] = sfd_state(mfos, idx, symbol_len, SFD_polar, SFD_buff, power(idx));
            case Rx_State.Demod
                % generate data bits
                [rx_state, run_state_idx, output_bit] = demod_state(mfos, idx, symbol_len, polarity);
                bits = [bits output_bit];
            otherwise
                break;
        end
        
        if (rx_state == Rx_State.SFD_Search) || (rx_state == Rx_State.Demod)
            % store the matched filter output associated with this bit
            bit_mfos = [bit_mfos mfos(idx)];
            
            % run PLL
            pll = runPLL(pll, mfos(idx));
        end
    end
    
    idx = idx + 1;
end

figure(1);
plot(real(mfos));
title('Real Matched Filter Outputs');

figure(2);
plot(mfos_scaled);
title('Sacled Matched Filter Magnitudes');

figure(3);
plot(real(bit_mfos));
title('Real Matched Filter Outputs Per Bit');

% TODO: this looks really bad, why?
figure(4);
plot(pll.frequency_output);
title('PLL frequency output');

data = [PHR PDSU];

if length(data) == length(bits)
    bit_errors = sum(xor(data, bits))
end

function corr = matched_filter(in_samps, mf, chirps_polar)
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