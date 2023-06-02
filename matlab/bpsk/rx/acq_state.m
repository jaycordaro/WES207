function [new_state, new_idx] = acq_state(y, old_idx, symbol_len, power)
    % check if there is enough power detect and the SNR exceeds the
    % threshold
    if (power > 10) && (abs(y(old_idx)) / power > 0.4)
        % start searching for SFD
        new_state = Rx_State.SFD_Search;
        
        % advance to next bit
        new_idx = old_idx + symbol_len;
    else
        % keep searching every sample
        new_state = Rx_State.Acquisition;
        new_idx = old_idx + 1;
    end
end