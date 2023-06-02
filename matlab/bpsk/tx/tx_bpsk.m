%% 802.15.4 Clause 13 BPSK modulator
% WES207 Project
% Sam Weismuller, Eric Pae, Jay Cordaro
% Revision 1.1 -- add pulse shaping

clear all;close all;clc

band_902=1;
if (band_902==1)
    % 902 MHz band, 13.2.2 40kbps
    data_rate=40;  

else
    % 868 MHz band, 20kbps
    date_rate=20;
end

chip_rate=data_rate*16;


packetlen=127;

% clause 13.1 & 12.1.2.2 Preamble field
% 13.2.2 preamble is 32 symbols (4 octets) of zeros
PREAMBLE=zeros(1,32);
SFD=[1 1 1 0 0 1 0 1];
SHR=[PREAMBLE SFD];

%PHY Header
% PHR is PHY Header
% replace with more accurate header shortly
PHR=[de2bi(packetlen) zeros(1,(7-length(de2bi(packetlen)))) 0];

%PDSU
payload=[randi([0 1],1,(8*packetlen-16))];


% compute CRC.  Insert after Payload
FCS=crc16_802_15_4(payload);
PDSU=[payload FCS];

R=[SHR PHR PDSU];
% differential encoder per 13.2.4
for ii=1:length(R)
    if (ii==1)
        En(ii)=xor(R(ii),0);
    else
        En(ii)=xor(R(ii),En(ii-1));
    end
end

% 13.2.5 Bit-to-chip mapping
% 0 
spread_pkt=[];
for jj=1:length(R)
    if (R(jj)==0)
         % 0
        dsss_sym=[1 1 1 1 0 1 0 1 1 0 0 1 0 0 0];
    else
        % 1
        dsss_sym=[0 0 0 0 1 0 1 0 0 1 1 0 1 1 1];
    end
spread_pkt=[spread_pkt dsss_sym];
end

% raised cosine pulse shape
rolloff = 1;     % Rolloff factor
span = 6;           % Filter span in symbols
sps = 5;            % Samples per symbol
b = rcosdesign(rolloff, span, sps);



tx_out = upfirdn(2*spread_pkt-1, b, sps);

figure(2)


fs_up=4*chip_rate;

L=4*length(tx_out);

w = kaiser(length(tx_out),8);
w=w./sum(w);


tx_outdft=fft(tx_out.*w',L);  % windowed FFT 
TX_OUT=fftshift(tx_outdft);
fshift = (-L/2:L/2-1)*(fs_up/L);
plot(fshift, 20*log10(abs(TX_OUT)) );  % y_dBm=20*log10(y_linear)+30

 grid on
 ylim([-100 -30])
 xlim([-chip_rate*4/2 chip_rate*4/2])
 title('Pulseshaped Baseband 802.15.4 Clause 13 BPSK')
 xlabel('Frequency (kHz)')
 ylabel('Magnitude (dB)')

 %% transmit eye diagram

eyediagram(tx_out(100:length(tx_out)-100),4*sps)
