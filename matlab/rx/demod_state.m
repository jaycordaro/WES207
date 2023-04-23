function [new_state, new_idx, output_bit] = sfd_state(y, old_idx, symbol_len)
    output_bit = to_digital(y(old_idx));
    
    new_state = Rx_State.Demod;
    new_idx = old_idx + symbol_len;
end