function [new_state, new_idx] = acq_state(y, old_idx, symbol_len)
    if abs(y(old_idx)) > 14
        new_state = Rx_State.SFD_Search;
        new_idx = old_idx + symbol_len;
    else
        new_state = Rx_State.Acquisition;
        new_idx = old_idx + 1;
    end
end