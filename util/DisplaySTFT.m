function DisplaySTFT( X , Fs , Hop_Size , mode , Fr)
% Display the spectrogram in the specified range
% Input : 
%      X : STFT coefficients
%      Fs : the sampling frequency
%      Hop_Size : the length of the jumpping
%      mode : 1 ----> dB  0----> normal
%      Fr : the maximal frequency you want to display
% Modified by Zhaozhibin  from Xi'an Jiaotong University
% Date: 2017.09
% Email:zhaozhibin@stu.xjtu.edu.cn
if nargin < 4
    mode = 0;
end
if nargin < 5
    Fr = Fs/2;
end
[Nf , Nt] = size(X);
if mode
    Spec = 20*log10(abs(X(1:round(Nf/2),:)));
else
    Spec = abs(X(1:round(Nf/2),:));
end
tt = (0:Hop_Size:(Nt-1)* Hop_Size)  / Fs;
ff = (0 : Nf-1) / Nf *( Fs / 2);
% colormap(jet_Linchao(64))   % the white background
colormap jet              % the blue background
clf
set(gcf,'Position',[20 100 350 300]);	    
set(gcf,'Color','w');	
imagesc(tt , ff , Spec)
axis xy;
xlabel('Time (seconds)')
ylabel('Frequency (Hz)')
ylim([0 Fr]);

end

