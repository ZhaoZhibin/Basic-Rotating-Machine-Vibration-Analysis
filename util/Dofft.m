function [yf , f] = Dofft( Sig , Fs ,Flag)
% Calculating the fft of the signal
% Input:
%          Sig : the input signal
%          Fs : the sampling frequency
%          Flag : if Flag = 0 or not exist, then not plot the frequency
%          spectrum if Flag = 1, then plot the frequency spectrum
% Output:
%          yf : the FFT of the signal's envelope
%          f : the frequency index
if ~exist('Flag','var') || isempty(Flag)
    Flag = 0;
end
xlen = length(Sig);
Sig = Sig - mean(Sig);
NFFT = 2 ^ nextpow2(xlen);
yf = fft(Sig,NFFT) / xlen * 2;
yf = abs(yf(1 : NFFT/2+1));
f = Fs / 2 * linspace(0,1,NFFT/2+1);
f = f(:);
% Plot the frequency spectrum
if Flag
plot(f,yf);
title('single side amplitude spectrum of x(t)')
xlabel('frequency (Hz)')
ylabel('|y(f)|')
end

end

% Made by Zhibin Zhao
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13

