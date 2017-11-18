% This function realizes trend chart plot for all operating conditions
clc;
clear all;
close all;
cl = {'r';'g';'b';'y';'m';'c';'k'}; 
Fs = 4000; 
for n = 1:2
%         if n == 1 || n == 2 || n == 3 || n == 4 
%         if n == 5 || n == 6 
        if n == 1 || n == 2
%         if n == 2 || n == 6 || n == 7  
%         if n == 1 || n == 3 || n == 8  
%         filename = ['HBMchan',num2str(n),'.mat'];
        filename = ['Econchan' num2str(n) '.mat'];       
        load (filename)
        Data = Data(:); 
        Data = Data-mean(Data); 
        L = length(Data);
        
        N = 1000*2;
        start = 1;
        t = (1:L)/Fs;
        Timeindex = start:1000:(L-N);
        for irow = 1:length(Timeindex)
            Vibrationseg = Data(Timeindex(irow):Timeindex(irow)+N-1);
            Index= Cal_Index(Vibrationseg);
            Rms(irow) = Index;
        end
        
        plot(t(Timeindex + 1000),Rms);
        hold all;
        axis([-inf,inf,-inf,inf]);
        end
end
legend('low pressure','high pressure','Location','NorthEastOutside');
saveas(gcf, ['J:\XH_test\2017\0610\all_comparison.fig']); 
% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13