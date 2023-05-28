packetlen = 5;

PREAMBLE=zeros(1,32);
SFD=[1 1 1 0 0 1 0 1];
SHR=[PREAMBLE SFD];

PHR=[de2bi(packetlen, 7) 0];

payload = [de2bi(1, 8) de2bi(2, 8) de2bi(3, 8)];

FCS = crc16_802_15_4(payload);
PDSU = [payload FCS];

bits = [SHR PHR PDSU];

chipseq = [0 0 1 1 1 1 1 0 0 0 1 0 0 1 0 1;
           0 1 0 0 1 1 1 1 1 0 0 0 1 0 0 1;
           0 1 0 1 0 0 1 1 1 1 1 0 0 0 1 0;
           1 0 0 1 0 1 0 0 1 1 1 1 1 0 0 0;
           0 0 1 0 0 1 0 1 0 0 1 1 1 1 1 0;
           1 0 0 0 1 0 0 1 0 1 0 0 1 1 1 1;
           1 1 1 0 0 0 1 0 0 1 0 1 0 0 1 1;
           1 1 1 1 1 0 0 0 1 0 0 1 0 1 0 0;
           0 1 1 0 1 0 1 1 0 1 1 1 0 0 0 0;
           0 0 0 1 1 0 1 0 1 1 0 1 1 1 0 0;
           0 0 0 0 0 1 1 0 1 0 1 1 0 1 1 1;
           1 1 0 0 0 0 0 1 1 0 1 0 1 1 0 1;
           0 1 1 1 0 0 0 0 0 1 1 0 1 0 1 1;
           1 1 0 1 1 1 0 0 0 0 0 1 1 0 1 0;
           1 0 1 1 0 1 1 1 0 0 0 0 0 1 1 0;
           1 0 1 0 1 1 0 1 1 1 0 0 0 0 0 1 ];

chip_rate = 1000*1000; % 1000 kchips/s
Tc = 1/chip_rate;

% bit to symbol mapping
syms = [];
octets = reshape(bits, 8, []).';
for idx = (1:(length(bits)/8))
    octet = octets(idx, :);
    syms = [syms bi2de(octet(1:4))];
    syms = [syms bi2de(octet(5:8))];
end

% symbol to chip mapping
chips = [];
for idx = (1:length(syms))
    sym = syms(idx);
    chips = [chips chipseq(sym + 1, :)];
end

% O-QPSK modulator
fs = 4e6;
samps_per_transition = 2*Tc*fs;
I_chips = chips(1:2:end);
Q_chips = chips(2:2:end);
t = [0:(samps_per_transition-1)];
rcos = sin(pi*t/samps_per_transition);

% I channel
I = [];
for idx = (1:length(I_chips))
    chip = I_chips(idx);
    if chip == 1
        I = [I rcos];
    else
        I = [I -rcos];
    end
end
I = [I zeros(1, samps_per_transition/2)];

% Q channel
Q = zeros(1, samps_per_transition/2);
for idx = (1:length(Q_chips))
    chip = Q_chips(idx);
    if chip == 1
        Q = [Q rcos];
    else
        Q = [Q -rcos];
    end
end

signal = I + i*Q;
figure(1);
subplot(2, 1, 1);
plot(real(signal));
title('I');
subplot(2, 1, 2);
plot(imag(signal));
title('Q');

% compare the OQPSK against the Zigbee Toolbox Libaray:
% https://www.mathworks.com/matlabcentral/fileexchange/62845-communications-toolbox-library-for-zigbee-and-uwb
cfgOQPSK915 = lrwpanOQPSKConfig(Band=915, SamplesPerChip=8, PSDULength=5);
waveform = lrwpanWaveformGenerator(PDSU.', cfgOQPSK915);
figure(2);
subplot(2,1,1);
plot(real(waveform));
hold on;
plot(real(signal));
hold off;
title('I');
subplot(2,1,2);
plot(imag(waveform));
hold on;
plot(imag(signal));
hold off;
title('Q');