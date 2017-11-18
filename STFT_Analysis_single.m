% This function only realizes STFT without calculating other things
clc
clear all
close all
original_path = fileparts(mfilename('fullpath'));
tools = genpath(original_path);
addpath(tools)
Fs = 6000; 
for i = 3:3 
    if i == 5
        continue;   
    else
%         filename = ['HBMchan' num2str(i) '.mat'];
        filename = ['Econchan',num2str(i),'.mat'];
        load(filename);
        Data = Data(:);  
%         Data = Data(5000*Fs:5100*Fs-1);
        Data = Data-mean(Data);  
%         figure(1)
%         plot((1:size(Data,1))/Fs,Data)
        figure(i)
        nLevel = 3000;
        win = MakeWindows('Gaussian', 6000 , nLevel);
        Nfft = Fs / 1;
        [specgmShow] = STFT(Data,win , nLevel , Nfft);  
        Step = Fs/1000;
        specgmShow = abs(specgmShow(1:floor(size(specgmShow,1)/Step),:));
        [ff,tt] = size(specgmShow);
        colormap(jet_Linchao(64))
        imagesc((0:nLevel:(tt-1)*nLevel)/Fs,1000*linspace(0,1,ff),(specgmShow)); %(specgmShow-spmin)/(spmax-spmin)
        axis xy;
        xlabel('time : s');
        ylabel('frequecy : Hz')   
        title([num2str(i),'TimeFrequency']);
        axis([0 , (((tt-1)*nLevel)/Fs) ,0 , 400]) 

%          caxis([0,0.001])
%          saveas(gcf, ['G:\XH_test\2017\0610\' num2str(i) 'TimeFrequency.fig']); 
    end    
end

% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13