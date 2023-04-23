function [new_state, new_idx] = acq_state(y, old_idx, symbol_len, power)
    if (power > 10) && (abs(y(old_idx)) / power > 0.4)
        new_state = Rx_State.SFD_Search;
        new_idx = old_idx + symbol_len;
    else
        new_state = Rx_State.Acquisition;
        new_idx = old_idx + 1;
    end
end