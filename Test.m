% ±æ≥Ã–Ú≤‚ ‘STFT∫ÕSTFT-based SST
close all;clear;clc;
fs=1024;
t=(0:1024-1)/fs;
A1=1;A2=1;A3=1;
fc1=100;fc3=450;Am=20;fm=10;alpha=250;beta=400;gama=-400;
x1=A1*cos(2*pi*fc1*t-Am/fm*cos(2*pi*fm*t));
x2=A2*cos(2*pi*alpha*t+pi*beta*t.^2+2*pi/3*gama*t.^3);
x3=A3*cos(2*pi*fc1*t-pi/4);
x5=100*(t-0.5);
x4=cos(2*pi*(256*t+0.4*(x5.*log(x5+sqrt(x5.^2+1))-cosh(log(x5+sqrt(x5.^2+1))))));
x=x2;
% x=awgn(x,5,'measured');

figure
plot(t,x)

sigma=0.01;nfft=length(x);

%}
tic
[s,Tx,time,freqr,win]=Fast_STFT_SST_Matrix_ZoomNoRecon(x,fs,sigma,5,1,fs/2,4);
toc
figure
imagesc(time,freqr,abs(Tx));axis xy

%}
