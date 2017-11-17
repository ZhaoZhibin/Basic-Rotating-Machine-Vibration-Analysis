function [ yf, f ] = Hilbert_envelope( Sig , Fs , Flag)
% Calculating the Hilbert envelope spectrum of the signal
% Input:
%          Sig : the input signal
%          Fs : the sampling frequency
%          Flag : if Flag = 1 or not exist, then perform square
%          HilbertEnvelope; if Flag = 0, then perform HilbertEnvelope
% Output:
%          yf : the FFT of the signal's envelope
%          f : the frequency index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~exist('Flag','var') || isempty(Flag)
    Flag = 1;
end
Sig = Sig(:);                                                         % build the column vector

HSig = abs(hilbert(Sig));
if Flag
    [yf , f] = Dofft(HSig.^2 , Fs);                            % square  HilbertEnvelope
else
    [yf , f] = Dofft(HSig , Fs);                                 % HilbertEnvelope
end

end

%% Do fast fourier transform
function [yf , f] = Dofft(Sig , Fs)
% Calculating the fft of the signal
% Input:
%          Sig : the input signal
%          Fs : the sampling frequency
% Output:
%          yf : the FFT of the signal's envelope
%          f : the frequency index
xlen = length(Sig);
Sig = Sig - mean(Sig);
NFFT = 2 ^ nextpow2(xlen);
yf = fft(Sig,NFFT) / xlen * 2;
yf = abs(yf(1 : NFFT/2+1));
f = Fs / 2 * linspace(0,1,NFFT/2+1);
f = f(:);
end

% Made by Zhibin Zhao
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13