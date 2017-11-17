% This function realizes the STFT for single channels


Fs = 100000;%设置采样频率
Data = Data1_AI_A_1(:); % 实现行向量向列向量的转换
Data = Data-mean(Data); %去平均
figure(1)
nLevel = 3000;
win = MakeWindows('Gaussian', 6000 , nLevel);
Nfft = Fs / 1;
[specgmShow] = STFT(Data,win , nLevel , Nfft); %具体参数调节输入help STFT,数据点太长可以调整分辨率
specgmShow = abs(specgmShow(1:size(specgmShow,1)/2,:));
[ff,tt] = size(specgmShow);
% colormap(jet_Linchao(64))
imagesc((0:nLevel:(tt-1)*nLevel)/Fs,Fs/2*linspace(0,1,ff),(specgmShow)); %(specgmShow-spmin)/(spmax-spmin)
axis xy;
xlabel('time : s');
ylabel('frequecy : Hz')
title('时频图');
axis([0 , (((tt-1)*nLevel)/Fs) ,0 , 2000])%此处限制坐标的范围

caxis([0,0.03])


% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13