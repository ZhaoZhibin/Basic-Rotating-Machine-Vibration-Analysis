function [ X ] = STFT( Sig , Win , Hop_Size , Nfft)
% fast STFT not using any loop
% Input:
%     Sig : the inputting signal
%     Win : The length of the window
%     Hop_Size : the size of the jump <= length(Win) / 2
%     Nfft : FFT length >= length(Win)
% Output:
%     X : The short time fourier transforming coefficients
% Attention : the length of FFT is equal to the length of the Windows
% Modified by Zhaozhibin  from Xi'an Jiaotong University
% Date: 2017.09
% Email:zhaozhibin@stu.xjtu.edu.cn

if nargin < 3
    Hop_Size = 1;
end
if nargin < 4
    Nfft = 1024;
end
disp('Calculating the STFT\n.')
Sig = Sig(:);
Sig = hilbert(real(Sig));
L = length(Win);
Half = floor(L/2);
Sig = [zeros(Half ,1) ; Sig ; zeros(Half-Hop_Size+1 , 1)];
X = buffer(Sig , L , L-Hop_Size , 'nodelay');
X = bsxfun(@times, Win(:), X);
X = fft(X,Nfft)/ sqrt(Nfft);
disp('Finishing the STFT\n.')
end
