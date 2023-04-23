function [new_state, new_idx, new_SFD_buff, corr] = sfd_state(y, old_idx, symbol_len, SFD_polar, SFD_buff)
    new_SFD_buff = [SFD_buff(2:end) y(old_idx)];
    
    corr = 0;
    for idx = 1:length(SFD_polar)
        corr = corr + SFD_polar(idx)*new_SFD_buff(idx);
    end
    
    SFD_thresh = 10*length(SFD_polar);
    if corr > SFD_thresh
        new_state = Rx_State.Demod;
    else
        new_state = Rx_State.SFD_Search;
    end
    
    new_idx = old_idx + symbol_len;
end