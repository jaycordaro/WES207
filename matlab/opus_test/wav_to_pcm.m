[aud,Fs] = audioread('speech/speech_orig.wav');
aud = sd_decimation_many_stages(aud, Fs, fs_out);
aud = (aud / max(aud));
p=audioplayer(aud, fs_out);
play(p);

fileID = fopen('input.bin','w');
fwrite(fileID, aud*2^15, 'int16', 'l');
fclose(fileID);