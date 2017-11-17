clear all
addpath('./util')
addpath('./Fast_STFT')
Fs = 2000;
N = 4000;
t = -2:1/Fs:(N-1)*(1/Fs);
y = sin(2*100*pi*t)+sin(2*200*pi*t)+sin(2*400*pi*t); 
% y = chirp(t,0,1,150); % Start @ DC, % cross 150Hz at t=1 sec

Hop_Size = 100;
win = MakeWindowsTF('Gaussian' , 200 , Hop_Size);

[specgm] = STFT(y , win , Hop_Size ,1000);
DisplaySTFT(specgm , Fs , Hop_Size , 0);
