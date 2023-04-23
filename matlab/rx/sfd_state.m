function [new_state, new_idx, new_SFD_buff, corr, polarity] = sfd_state(y, old_idx, symbol_len, SFD_polar, SFD_buff, power)
    new_SFD_buff = [SFD_buff(2:end) y(old_idx)];
    
    corr = 0;
    for idx = 1:length(SFD_polar)
        corr = corr + SFD_polar(idx)*new_SFD_buff(idx);
    end
    
    SFD_thresh = 0.4*length(SFD_polar);
    if abs(corr)/power > SFD_thresh
        new_state = Rx_State.Demod;
        if real(corr) > 0
            polarity = 1;
        else
            polarity = -1;
        end
    else
        new_state = Rx_State.SFD_Search;
        polarity = 1;
    end
    
    new_idx = old_idx + symbol_len;
    
    
end