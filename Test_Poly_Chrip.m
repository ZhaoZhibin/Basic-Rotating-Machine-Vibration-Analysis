clear all
close all
addpath('./util')
addpath('./Polynomial_chriplet_analysis')
Fs = 200;
t = 0 : 1/Fs : 15;

c1 = 2 * pi * 10;            % initial frequency of the chirp excitation
c2 = 2 * pi * 5/2;           % set the speed of frequency change be 1 Hz/second
c3 = 2 * pi * 1/3;
c4 = 2 * pi * -1/40;

Sig = sin(c1 * t + c2 * t.^2 / 2 + c3 * t.^3 /3 + c4 * t.^4 /4);   % get the A(t)
n1 = rand(size(Sig));
n1 = n1 - mean(n1);
n1 = 3*n1 / max(n1) * max(Sig);
std(n1)
Sig = Sig + n1/2;
y = Sig';

Hop_Size = 1;
Nfft = 512;
alpha = 0;
Iter = 7;
win = MakeWindows('Gaussian' , 215);
[specgm , f , p] = Do_PCT( Iter , t, y , win , Hop_Size , Nfft , Fs , alpha);
figure
plot(t, f, t, p)
figure
DisplaySTFT(specgm , Fs , Hop_Size , 0,50)
