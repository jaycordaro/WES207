function [decimated_output, output_Fs] = sd_decimation(in_vec, input_rate, output_rate, atten_db, hpf, fixed_pt)
arguments
    in_vec          % a sigma-delta modulated input file
    input_rate      % the sampling rate of the sigma delta modulated data (in Hz)
    output_rate     % the desired output rate.  Must be integer quotient with no remainder.  16000, 48000
    atten_db = 96   % the attenuation in dB of the out-of-band spectral energy which must be suppressed
    hpf = 0         % whether hpf is enabled or not
    fixed_pt = 0    % to be DONE
end
% 3 stage Sigma Delta Low-pass decimator
% [decimated_output, output_Fs] = sd_decimation(in_vec,input_rate, output_rate, atten_db, hpf, fixed_pt)
% in_vec -- sigma-delta modulated input vector
% input_rate -- sampling rate of input in Hz
% output_rate -- desired output rate in Hz.  must have integer divider
% ratio input_rate/output_rate
% atten_db -- attenuation of out-of-band spectral energy which must be
% suppressed, specified in dB referenced to full scale
% hpf -- 1 == enable hpf
%        0 == disable hpf
% fixed_pt -- 0 == floating point (default)
%          -- 1 == fixed point
%
% Jay Cordaro jcordaro@ucsd.edu
 

if rem(input_rate,output_rate)
    disp ("Error, need integer divisor")
    return
end

if (fixed_pt~=0)
    disp ("Sorry, fixed point not implemented yet")
    return
end

%% calculate the decimation rate, and the passband and stopband corners
fs=input_rate;
fs_3=output_rate*2;
fs_2=output_rate*4;
f2=fs_2;
f1=output_rate/2;

fs_filter2=f2;
decimation_rate = input_rate/f2;

decimation_rate2 = fs_filter2/fs_3;
%%%
figure
clf

if (min(in_vec) == 0)  % if input is digital (0,1) make antipodal
    in_vec=2*in_vec-1;
end

if (iscolumn(in_vec))  % if input vector is a column vector, make it a row vector...
    in_vec=in_vec';
end

x=in_vec;

subplot(2,1,1)
if ~isempty(x)
    if length(x) > 200
        stairs(x(1:200))
    else
        stairs(x)
    end
end

ylim([-1.1 1.1])
xlabel('Samples')
ylabel('Amplitude')
title('Time Domain Sigma Delta Input')

subplot(2,1,2)

x2048=x;

w = kaiser(length(x2048), 10);
w=w./sum(w);

L=4*length(x2048);

xdft=fft(x2048.*w',L);  % windowed FFT
X=fftshift(xdft);
fshift = (-L/2:L/2-1)*(input_rate/L);
plot(fshift/1000, 20*log10(abs(X)));
ylim([-atten_db 1])
xlim([min(-fshift)/1000 max(fshift)/1000])
ylabel('Magnitude (dB)');
xlabel('Frequency (kHz)');
grid on
title('Windowed FFT of Sigma Delta Modulated Input Vector');

%%% estimate number of filter taps required for 1st stage %%%
% note that one approach would be to use a CIC filter because no multiplies
% however, because input to filter is +/- 1, *any* nonrecursive (FIR) filter is a multiplierless
% filter

N=ceil(fs/(f2-f1) * (atten_db)/22);

pad=mod(N,decimation_rate);
N=N+(decimation_rate-pad);  % make sure each leg of polyphase is same length

fprintf('Number of filter taps, 1st stage of decimation: %d.  Input sample rate: %d, output sample rate: %d\n',  ...
    int32(N), int32(input_rate), int32(fs_2))

%% traditional FIR filter
hh=firpm(N-1,[0 f1 f2 fs/2]/(fs/2), {'myfrf',[1 1 0 0]}, [1 10]);
[fr_hh, f]=freqz(hh,1, -pi:1/200:pi-1/200);

%% note to self, add in fixed point...not done here...
if (fixed_pt)
    fix_bit_width=[];
    fix_bit_width=ceil(atten_db/5);
end

figure
clf

plot(f*(fs/(2*pi)./1000), 20*log10(abs(fr_hh)),'linewidth',1);
grid on; hold on;
ylim([-140 3])
xlim([-384 384])
xlabel('Frequency (kHz)')
yline(atten_db,'--','color','red')
title(['First Decimation Filter and Filter Output.  Fs=' num2str(f2)])
ylabel('Magnitude (dBFS)')
xlabel('Frequency (kHZ)')

out_f1=filter(hh,1,in_vec);

if (length(out_f1) > 2048)
    y1_2048=out_f1(1:2048);
else
    y_2048=[out_f1 zeros(1,(2048-length(out_f1)))];
end

L=10*length(y1_2048);
 
w = kaiser(length(y1_2048),8);
w=w./sum(w);

ydft=fft(y1_2048.*w',L);  % windowed FFT

Y1=fftshift(ydft);
fshift = (-L/2:L/2-1)*(fs/L);
plot(fshift/1000, 20*log10(abs(Y1)));
hold on

%% now for polyphase implementation

for nn=1:decimation_rate
    poly_hh(:,nn)=hh(nn:decimation_rate:end);
end

poly_hh
% select the polyphase subvectors of the input vector

input_vec_pad=mod(length(in_vec),decimation_rate);  % pad input vector so it plays nicely with Matlab

in_vec=[in_vec zeros(1,decimation_rate-input_vec_pad)];  % note! this will introduce a DC offset.  better to pad [1 0 1 0...] but for now this ok

x_poly=zeros(12,length(in_vec)/decimation_rate);
x_poly(1,:)=in_vec(1:decimation_rate:length(in_vec));
for jj=2:decimation_rate
    x_poly(jj,:)=[0 x(decimation_rate-jj+2:decimation_rate:end)];
end

% filter each polyphase component and add together
y_poly_dec_leg=[];

for ll=1:decimation_rate
    y_poly_dec_leg(ll,:)=filter(poly_hh(:,ll),1,x_poly(ll,:));
end

y_poly_dec=sum( y_poly_dec_leg([1:size(y_poly_dec_leg,1)],:));

std_dec=out_f1(1:decimation_rate:length(out_f1));

figure

pwelch(y_poly_dec,[],[],[],fs_2)
hold on
pwelch(std_dec,[],[],[],fs_2)
legend('Polphase','Filter then Decimate')

in_f2=y_poly_dec;

%% design 1st halfband filter
% this halfband filter can have a gentle transition through -6dB point, but
% needs high out of band attenuation

fs_2=output_rate*4;
f1_2=output_rate*.8125;
f2_2=output_rate*1.18175;
sb_atten_2=.8*atten_db;

N2=ceil(fs_2/(f2_2-f1_2) * (sb_atten_2)/22);
if rem(N2,2)==0
    N2=N2+1;
end

h_hband=firpm(N2-1,[0 f1_2 f2_2 fs_2/2]/(fs_2/2), [1 1 0 0], [1 1]);
fprintf('Number of filter taps, 2nd stage of decimation: %d.  Input sample rate: %d  Output sample rate: %d\n',...
    int32(N2), int32(fs_2), int32(fs_3));

figure
clf

[fr_hb, f]=freqz(h_hband,1, -pi:1/200:pi-1/200);

plot(f*(fs_2/(2*pi)./1000), 20*log10(abs(fr_hb)),'linewidth',1);
grid on; hold on;
title(['2nd Decimation Filter: Halfband Filter 1  Fs=' num2str(4*output_rate) ])
xlabel('Frequency (kHz)')
ylabel('Magnitude (dBFS)')

out_f2=filter(h_hband,1,in_f2);

if (length(out_f2) > 2048)
    y2_2048=out_f2(1:2048);
else
    y2_2048=[out_f2 zeros(1,(2048-length(out_f2)))];
end

L=10*length(y2_2048);

w = kaiser(length(y2_2048),10);
w=w./sum(w);

ydft=fft(y2_2048.*w',L);  % windowed FFT

Y1=fftshift(ydft);
fshift = (-L/2:L/2-1)*(fs_filter2/L);
plot(fshift/1000, 20*log10(abs(Y1)));
hold on
ylim([-atten_db-10 5])
xlim([-fs_3/1000 fs_3/1000])
%% design 2nd halfband filter
%

figure
clf

in_f3=out_f2(1:decimation_rate2:length(out_f2));

%f1_3=.875*output_rate/2;
%f2_3=1.125*output_rate/2;
f1_3=0.875*output_rate/2;
f2_3=1.125*output_rate/2;
sb_atten_3=.6*atten_db;

N3=ceil(fs_3/(f2_3-f1_3) * (sb_atten_3)/22);
if rem(N3,2)==0
    N3=N3+1;
end

fprintf('Number of filter taps, 3rd stage of decimation: %d.  Input sample rate: %d, Output sample rate %d\n',...
    int32(N3), int32(fs_3), int32(output_rate))
h_hband3=firpm(N3-1,[0 f1_3 f2_3 fs_3/2]/(fs_3/2), [1 1 0 0], [1 1]);

[fr_hb3, f]=freqz(h_hband3,1, -pi:1/200:pi-1/200);

plot(f*(fs_3/(2*pi)./1000), 20*log10(abs(fr_hb3)),'linewidth',1);
grid on; hold on;
title(['Final Filter.  3rd Decimation Filter, Halfband Filter 2, output Fs=' num2str(output_rate)])
xlabel('Frequency (kHz)')
ylabel('Magnitude (dBFS)')

filter_output_3rdfilter=filter(h_hband3,1,in_f3);

if (length(filter_output_3rdfilter) > 2048)
    y3_2048=filter_output_3rdfilter(1:2:4096);
else
    y3_2048=[filter_output_3rdfilter(1:2:length(filter_output_3rdfilter)) zeros(1,(2048-length(filter_output_3rdfilter)/2))];
end

L=10*length(y3_2048);

w = kaiser(length(y3_2048),10);
w=w./sum(w);

ydft=fft(y3_2048.*w',L);  % windowed FFT

Y1=fftshift(ydft);
fshift = (-L/2:L/2-1)*(fs_3/L);
plot(fshift/1000, 20*log10(abs(1*Y1)));
hold on
xlim([-output_rate/1000 output_rate/1000])
ylim([-atten_db-10 5])


%% single pole highpass filter, to remove DC offset
alpha=1-2^-5;

B=alpha*[1 -1];
A=[1 -alpha];

output_Fs=output_rate;

if (hpf==1)
    decimated_output = filter(B,A,filter_output_3rdfilter(1:2:length(filter_output_3rdfilter)));
    L=10*length(decimated_output);

    w = kaiser(length(decimated_output),10);
    w=w./sum(w);

    ydft=fft(decimated_output.*w',L);  % windowed FFT

    Y1=fftshift(ydft);
    fshift = (-L/2:L/2-1)*(fs_3/L);
    plot(fshift/1000, 20*log10(abs(1*Y1)));
    hold on
    xlim([-output_rate/1000 output_rate/1000])
    ylim([-atten_db-10 5])
    legend('Filter Response', 'Without HPF', 'With HPF')
    figure
    hold on
    pwelch(decimated_output,[],[],[],output_Fs)
         
    pwelch(filter_output_3rdfilter(1:2:length(filter_output_3rdfilter)),[],[],[],output_Fs)
    set(gca, 'XScale', 'log')
    legend('With 1st order HPF', 'Without HPF')
else
    decimated_output = filter_output_3rdfilter(1:2:length(filter_output_3rdfilter));
    figure
    pwelch(decimated_output,[],[],[],output_Fs)
    set(gca, 'XScale', 'log')
    legend('Without HPF')
end

end