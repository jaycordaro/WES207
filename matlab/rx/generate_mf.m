function mf = generate_mf(rolloff, span, sps)
    rcos = rcosdesign(rolloff, span, sps);
    mf = conv([zeros(1, floor(sps/2)) 1 zeros(1, floor(sps/2))], conj(rcos), 'same');
end