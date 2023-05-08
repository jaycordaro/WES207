fs_out = 16e3;

filename = 'speech/output_6000bps';
fileID = fopen([filename '.bin'],'r');
aud2 = fread(fileID, 'int16', 'l');
fclose(fileID);

aud2 = aud2 / 2^15;
p=audioplayer(aud2, fs_out);
play(p);

audiowrite([filename '.wav'],aud2,fs_out);