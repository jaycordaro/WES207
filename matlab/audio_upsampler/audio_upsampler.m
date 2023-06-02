fs_out = 16e3;
fs_up = 44.1e3;

filename = 'output_6000bps';
fileID = fopen([filename '.bin'],'r');
aud2 = fread(fileID, 'int16', 'l');
fclose(fileID);

aud2 = aud2 / 2^15;

figure(1);
fftlen = length(aud2);
plot([-0.5:1/fftlen:(0.5-1/fftlen)]*fs_out, mag2db(abs(fftshift(fft(aud2)))));
title('Original audio spectrum');
ylabel('Magnitude (dB)');
xlabel('Frequency (Hz)');
xlim([-fs_out/2 fs_out/2]);

% upsample audio from 16k to 44.1k by dithering the number of inserted zeros
rem = 0;
upsampled = zeros(1,length(aud2)*3);
out_idx = 1;
for idx = 1:length(aud2)
    upsampled(out_idx) = aud2(idx);
    out_idx = out_idx + 2;
    rem = rem + 121;
    if rem > 160
        rem = rem - 160;
        out_idx = out_idx + 1;
    end
end

upsampled = upsampled(1:out_idx);

figure(2);
fftlen = length(upsampled);
plot([-0.5:1/fftlen:(0.5-1/fftlen)]*fs_up, mag2db(abs(fftshift(fft(upsampled)))));
title('Upsampled audio spectrum');
ylabel('Magnitude (dB)');
xlabel('Frequency (Hz)');
xlim([-fs_up/2 fs_up/2]);

% low pass filter
gain = 32767;
h_float = [0.000248645279535223	0.000510698377111029	0.000942233635656321	0.00149639405213066	0.00210686808229991	0.00265195185463915	0.00295701078729312	0.00281052777904033	0.00199520381399313	0.000331280552679964	-0.00227215992394421	-0.00576643188750175	-0.00992364588237427	-0.0143183720990935	-0.0183384069566272	-0.0212308709363227	-0.0221806942172502	-0.0204161490309882	-0.0153276929207480	-0.00658232290650222	0.00578402655719873	0.0213153509093065	0.0391365083110651	0.0580135141864320	0.0764676910682172	0.0929329647825355	0.105934318202291	0.114264648930167	0.117133129299842	0.114264648930167	0.105934318202291	0.0929329647825355	0.0764676910682172	0.0580135141864320	0.0391365083110651	0.0213153509093065	0.00578402655719873	-0.00658232290650222	-0.0153276929207480	-0.0204161490309882	-0.0221806942172502	-0.0212308709363227	-0.0183384069566272	-0.0143183720990935	-0.00992364588237427	-0.00576643188750175	-0.00227215992394421	0.000331280552679964	0.00199520381399313	0.00281052777904033	0.00295701078729312	0.00265195185463915	0.00210686808229991	0.00149639405213066	0.000942233635656321	0.000510698377111029	0.000248645279535223];
h = round(h_float*gain);

filtered = conv(upsampled, h)/gain;
figure(3);
fftlen = length(filtered);
plot([-0.5:1/fftlen:(0.5-1/fftlen)]*fs_up, mag2db(abs(fftshift(fft(filtered)))));
title('Filtered audio spectrum');
ylabel('Magnitude (dB)');
xlabel('Frequency (Hz)');
xlim([-fs_up/2 fs_up/2]);

% play upsampled audio
p=audioplayer(filtered, fs_up);
play(p);

audiowrite([filename '.wav'], filtered, fs_up);