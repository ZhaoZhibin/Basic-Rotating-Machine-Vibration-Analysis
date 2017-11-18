% This function plots the time domain and frequency domain
clc
clear all
close all
for i = 1:2  
    if i == 4
        continue;   
    else
%         filename = ['HBMchan' num2str(i) '.mat'];
        filename = ['Econchan' num2str(i) '.mat'];
        load(filename)
%         Data = cell2mat(Data);
        Data = Data(:)';   
        Data = Data-mean(Data); 
        n = length(Data);
        Fs = 4000; 
        t = 0:1/Fs:(n-1)/Fs;
        figure(i)
        plot(t,Data);
        titlex = ['Channel' num2str(i) 'TimeDomain'];
        title(titlex)
        xlabel('time /s')
        ylabel('amplitude')
        saveas(gcf, ['J:\XH_test\2017\0610\Channel' num2str(i) 'TimeDomain.fig']);
        close gcf
    end
%%
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
