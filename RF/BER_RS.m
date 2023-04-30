EbNo = (0:0.1:10)';
M = 4; % Modulation order
n = 15; % Block size
k = 11; % Number of information bits
R = k/n; % Code rate
rsEncoder = comm.RSEncoder(n,k); % Encoder
rsDecoder = comm.RSDecoder(n,k); % Decoder

% Theoretical BER for BPSK
berQ = berawgn(EbNo,'psk',M,'nondiff');

% Theoretical BER for BPSK with Reed-Solomon (15,11) error correction
EsN0 = EbNo + 10*log10(R);
berBPSK_RS = berawgn(EsN0,'psk',2,'nondiff');

% Theoretical BER for DPSK
berD = berawgn(EbNo,'dpsk',M);

% Theoretical BER for FSK
berF = berawgn(EbNo,'fsk',M,'coherent');

semilogy(EbNo,[berQ berD berF berBPSK_RS])
xlabel('Eb/No (dB)')
ylabel('BER')
legend('QPSK','DPSK','FSK','BPSK with RS(15,11)')
title("Theoretical Bit Error Rate")
grid

