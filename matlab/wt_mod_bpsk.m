%% 802.15.4 BPSK modulator
% Jay Cordaro
% 30 March 2023

clear all;close all;clc

band_902=1;
if (band_902==1)
    % 902 MHz band, 40kbps
    data_rate=40;
else
    % 868 MHz band, 20kbps
    data_rate=20;
end

packetlen=127;

% clause 13.1 & 12.1.2.2 Preamble field
% preamble is 32 symbols (4 octets) of zeros
PREAMBLE=zeros(1,32);
SFD=[1 1 1 0 0 1 0 1];
SHR=[PREAMBLE SFD];

%PHY Header
% 127 bytes
PHR=[de2bi(packetlen) zeros(1,(7-length(de2bi(packetlen)))) 0];

%PDSU
payload=[randi([0 1],1,(8*packetlen-16))];

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
    if (R(jj)>0)
         % 1
        junk=[1 1 1 1 0 1 0 1 1 0 0 1 0 0 0];
    else
        % 0
        junk=[0 0 0 0 1 0 1 0 0 1 1 0 1 1 1];
    end
spread_pkt=[spread_pkt junk];
end

% raised cosine pulse shape (roll-off factor = 1)
