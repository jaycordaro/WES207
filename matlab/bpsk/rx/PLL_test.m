% Matlab question 2
close all;

fs = 2000;
Ts = 1/fs;
deltaF = 20;
fn = 10;
zeta = 2;
n0 = 200;
n1 = 1999;
Kt = 4*pi*zeta*fn;

pll = PLL_Class(false, fn, zeta, Kt, Ts);

xc = [zeros(1, n0) exp(j*2*pi*deltaF*([n0:n1] - n0)*Ts)];

% 1a
zeta = 1/sqrt(2);
for idx = 1:8:(length(xc)-1)
    next_len = 8;
    x_in = xc(idx:idx+(next_len-1));
    x_in = x_in*exp(i*pll.curr_phase);
    x_in = x_in.*exp(-i*pll.curr_frequency*Ts*[0:(next_len - 1)]);
    pll = runPLL(pll, x_in);
end
frequency_output = pll.frequency_output;
figure(3);
subplot(3,1,1);
n = 0:n1;
st = [zeros(1, n0) repmat(deltaF, 1, n1-n0+1)];
plot(n, frequency_output, n, st);
title('Input Frequency and VCO Frequency (deltaf = 20 Hz)');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

deltaF = 40;
% xc = [zeros(1, n0) exp(j*2*pi*deltaF*([n0:n1] - n0)*Ts)];
pll = resetPLL(pll);
pll = runPLL(pll, xc);
frequency_output = pll.frequency_output;
subplot(3,1,2);
n = 0:n1;
% st = [zeros(1, n0) repmat(deltaF, 1, n1-n0+1)];
plot(n, frequency_output, n, st);
title('Input Frequency and VCO Frequency (deltaf = 40 Hz)');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% 1aiA
deltaF = 2;
xc = [zeros(1, n0) exp(j*2*pi*deltaF*([n0:n1] - n0)*Ts)];
pll = resetPLL(pll);
pll = runPLL(pll, xc);
frequency_output = pll.frequency_output;
subplot(3,1,3);
n = 0:n1;
st = [zeros(1, n0) repmat(deltaF, 1, n1-n0+1)];
plot(n*Ts, frequency_output, n*Ts, st);
title('Input Frequency and VCO Frequency (deltaf = 2 Hz)');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
