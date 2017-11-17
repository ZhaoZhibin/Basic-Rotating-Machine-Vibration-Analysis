function [ X ] = Polynomial_chriplet( Sig , Win , Hop_Size , Nfft , Fs , alpha)
% Polynomial chriplet transform
%     Sig : the inputting signal
%     Win : The length of the window
%     Hop_Size : the size of the jump
%     Nfft : FFT length >= length(Win)
%     alpha : the parameter of Polynomial chirp transform
%     when alpha = [0]---> STFT
%     when alpha = [1]---> LCP(Linear Chrip transform)
% Output:
%     X : The short time fourier transforming coefficients
% Attention : the length of FFT is equal to the length of the Windows
% Reference:
%)	Peng Z.K , Meng G., Lang Z.Q.,Chu F.L, Zhang W.M., Yang Y., Polynomial Chirplet Transform with Application to Instantaneous Frequency Estimation,
%   IEEE Transactions on Measurement and Instrumentation 60(2011) 3222-3229
% Modified by Zhaozhibin
% Date: 2017.09
% Email:zhaozhibin@stu.xjtu.edu.cn
Sig = Sig(:);
N = length(Sig);
dt = (0:(N-1))' / Fs;
% Contructing the rotating operator
Rotating = zeros(size(dt));
for k = 1 : length(alpha)
    Rotating = Rotating + alpha(k) / (k+1) * dt .^ (k+1);
end
% Construct the shifting operator
Shift = zeros(size(dt));
for k = 1 : length(alpha)
    Shift = Shift + alpha(k) * dt .^ k;
end
L = length(Win);
Half = floor(L/2);
% padding the components
Rotating = [zeros(Half ,1) ; Rotating ; zeros(Half-Hop_Size+1 , 1)];
dt = [zeros(Half ,1) ; dt ; zeros(Half-Hop_Size+1 , 1)];
Sig = [zeros(Half ,1) ; Sig ; zeros(Half-Hop_Size+1 , 1)];
Sig = hilbert(real(Sig));
% reshape the vector into matrix
X = buffer(Sig , L , L-Hop_Size , 'nodelay');
R = buffer(Rotating , L , L-Hop_Size , 'nodelay');
T = buffer(dt , L , L-Hop_Size , 'nodelay');
% Construct the chrip kernel
S = Shift(1 : Hop_Size : size(X , 2)*Hop_Size);
C = exp(-1i*2*pi*(R-bsxfun(@times, S' , T)));
% Use the chrip funtion to do STFT
X = X .* C;
X = fft(X,Nfft);
end
