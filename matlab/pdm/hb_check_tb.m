function hb_check_tb

% copyright Jay Cordaro
% jcordaro@protonmail.com

clear hb_check;
close all;

Fs      = 32e3; % Sampling frequency
F0      = 100; % Chirp Initial frequency
T       = 1;  % Time in seconds to simulate

% Stimulus
t          = 0:1/Fs:T;
signal     = chirp(t,F0,T,Fs/2);  % Start @ F0, cross Fs/2 at t=T
NumSamples = length(signal);
rng('default');
noise      = (rand(1,NumSamples)-0.5)/2;
input      = noise + signal;
results    = zeros(1, NumSamples);


%Testbench
for i = 1:NumSamples
  % Design function
  results(i) = hb_check(input(i));
end

figure('Name', [mfilename, '_inout']);
subplot(2,1,1); plot(signal,'b');
title('Stimulus');
hold on;
subplot(2,1,1); plot(noise,'r');
legend('Input','Noise');
% Plot input and output of filter
subplot(2,2,3); plot(input);
title('Combined Input');
subplot(2,2,4); plot(results);
title('Filtered Output');
hold off;
 
% Plot PSD of input and output
figure('Name', [mfilename, '_psd']);
subplot(2,1,1), pwelch(input,256,[],[],Fs);   % Input PSD
title('Input Power Spectral Density');
subplot(2,1,2), pwelch(results,256,[],[],Fs); % Output PSD
grid on
title('Output Power Spectral Density');