% 本程序实现简单的时域和频域的谱图绘制
clc
clear all
close all
for i = 1:2 %根据通道数目自行设置  
    if i == 4
        continue;  %控制输入通道的数目，这里例如11通道未使用
    else
%         filename = ['HBMchan' num2str(i) '.mat'];
        filename = ['Econchan' num2str(i) '.mat'];
        load(filename)
%         Data = cell2mat(Data);
        Data = Data(:)';  % 实现行向量向列向量的转换
        Data = Data-mean(Data); %去平均
        n = length(Data);
        Fs = 4000; % 设置采样频率
        t = 0:1/Fs:(n-1)/Fs;
        figure(i)
        plot(t,Data);
        titlex = ['通道' num2str(i) '时域图'];
        title(titlex)
        xlabel('time /s')
        ylabel('amplitude')
        saveas(gcf, ['J:\XH_test\2017\0610\通道' num2str(i) '时域图.fig']);
        close gcf
    end
%% 根据需要画频谱图，如果是变转速信号，这个全工况的频谱图必要性不大,需要时频图
% [Mag,f] = dofft(c,Fs); 
% Plot single-sided amplitude spectrum.
% figure(2)
% plot(f,Mag) 
% title('Single-Sided Amplitude Spectrum of y(t)')
% xlabel('Frequency (Hz)')
% ylabel('|Y(f)|') 
end

% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13
