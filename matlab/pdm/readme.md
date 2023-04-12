Decimator for Pulse Density Modulation (PDM) microphones 

3 stage decimation: polyphase FIR followed by two halfband filters to decimate from the sigma-delta modulated audio down to PCM.  Followed by an optional 1st order high-pass filter.  

Usage: 

load ('samp1.mat')
[aud1,Fs]=sd_decimation(samp1,768e3, 16e3, 96,1,0);
p=audioplayer(aud1, Fs)
play(p)

