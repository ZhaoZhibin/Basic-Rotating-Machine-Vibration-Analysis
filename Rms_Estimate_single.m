% 本程序实现全工况的RMS（有效值）的趋势图的绘制
clc;
clear all;
close all;
cl = {'r';'g';'b';'y';'m';'c';'k'}; %根据需要的通道数来画图
Fs = 4000; %设置采样频率
for n = 1:2
%         if n == 1 || n == 2 || n == 3 || n == 4 
%         if n == 5 || n == 6 
        if n == 1 || n == 2
%         if n == 2 || n == 6 || n == 7  
%         if n == 1 || n == 3 || n == 8  
%         filename = ['HBMchan',num2str(n),'.mat'];
        filename = ['Econchan' num2str(n) '.mat'];       
        load (filename)
        Data = Data(:); % 实现行向量向列向量的转换
        Data = Data-mean(Data); %去平均
        L = length(Data);
        % 计算RMS值，每2000个点计算一次，中间重叠1000个点
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
%% 根据对应的循环顺序命名不同颜色信号的名称
%   legend('水泥台横向','1#测功机横向','测功机支座横向',3,'Location','NorthEastOutside');
%   saveas(gcf, ['G:\TestProject(2016-09-24,15-34-22)\codes\RMS对比图\水泥台横向_1#测功机横向_测功机支座横向.fig']);
%   legend('1#测功机轴向','1#测功机横向',2,'Location','NorthEastOutside');
%   saveas(gcf, ['G:\TestProject(2016-09-24,15-34-22)\codes\RMS对比图\测功机横向与轴向.fig']); 
%   legend('2#轴承垂直','3#轴承垂直','4#轴承垂直',3,'Location','NorthEastOutside');
%   saveas(gcf, ['G:\TestProject(2016-09-24,15-34-22)\codes\RMS对比图\2#轴承垂直_3#轴承垂直_4#轴承垂直.fig']);
  legend('低压','高压',2,'Location','NorthEastOutside');
  saveas(gcf, ['J:\XH_test\2017\0610\全部对比.fig']); 
% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13