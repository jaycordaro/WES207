load('samp1.mat');
fs_in = 768e3;
fs_out = 16e3;
aud = sd_decimation_many_stages(samp1, fs_in, fs_out);
p=audioplayer(aud, fs_out);
play(p);