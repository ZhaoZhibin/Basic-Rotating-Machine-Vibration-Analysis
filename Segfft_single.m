% 本程序实现各工况的频谱图的绘制
clear all;
close all;
clc;
for n = 1:2 %选取通道数
%     filename = ['HBMchan',num2str(n),'.mat'];
    filename = ['Econchan',num2str(n),'.mat'];
    if n ~= 4
        load (filename);
%         Data = cell2mat(Data);
        Data = Data(:); % 实现行向量向列向量的转换
        Data = Data-mean(Data); %去平均
        Fs = 4000;%采样频率
        % 选取各个工况的点数段，可以根据全工况时域图来判断各个工况的区间
        Data1 = Data(500*Fs:502*Fs-1); %慢车
        Data2 = Data(2925*Fs:2926*Fs-1); %0.1工况
        Data3 = Data(3800*Fs:3802*Fs-1); %0.2工况
        Data4 = Data(4800*Fs:4802*Fs-1); %0.35工况
        Data5 = Data(5900*Fs:5902*Fs-1); %0.6工况
        Data6 = Data(7000*Fs:7002*Fs-1); %0.8工况
        Data7 = Data(8150*Fs:8152*Fs-1); %0.9工况
        
        [y1,f1]=Dofft(Data1,Fs);
        [y2,f2]=Dofft(Data2,Fs);
        [y3,f3]=Dofft(Data3,Fs);
        [y4,f4]=Dofft(Data4,Fs);
        [y5,f5]=Dofft(Data5,Fs);
        [y6,f6]=Dofft(Data6,Fs);
        [y7,f7]=Dofft(Data7,Fs);
        %显示500Hz以内
%       y1=y1(1:end/4);f1=f1(1:end/4);
%       y2=y2(1:end/4);f2=f2(1:end/4);
%       y3=y3(1:end/4);f3=f3(1:end/4);
%       y4=y4(1:end/4);f4=f4(1:end/4);
%       y5=y5(1:end/4);f5=f5(1:end/4);
%       y6=y6(1:end/4);f6=f6(1:end/4);
        
%         figure(n)
%         subplot(321);plot(f1,y1);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道慢车频谱']);
%         subplot(322);plot(f2,y2);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.1工况频谱']);
%         subplot(323);plot(f3,y3);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.2工况频谱']);
%         subplot(324);plot(f4,y4);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.35工况频谱']);
%         subplot(325);plot(f5,y5);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.6工况频谱']);
%         subplot(326);plot(f6,y6);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.8工况频谱']);

        figure;
        subplot(321);plot(f1,y1);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道慢车频谱']);
        axis([0 500 -inf inf]);
        subplot(322);plot(f3,y3);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.2工况频谱']);
        axis([0 500 -inf inf]);
        subplot(323);plot(f4,y4);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.35工况频谱']);
        axis([0 500 -inf inf]);
        subplot(324);plot(f5,y5);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.6工况频谱']);
        axis([0 500 -inf inf]);
        subplot(325);plot(f6,y6);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.8工况频谱']);
        axis([0 500 -inf inf]);
        subplot(326);plot(f7,y7);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道1.0工况频谱']);
        axis([0 500 -inf inf]);
        figure;
        plot(f2,y2);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.1工况频谱']);
        axis([0 500 -inf inf]);

%         subplot(421);plot(f1,y1);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道慢车频谱']);
% %         axis([0 500 -inf inf]);
%         subplot(422);plot(f2,y2);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.1工况频谱']);
% %         axis([0 500 -inf inf]);
%         subplot(423);plot(f3,y3);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.2工况频谱']);
% %         axis([0 500 -inf inf]);
%         subplot(424);plot(f4,y4);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.35工况频谱']);
% %         axis([0 500 -inf inf]);
%         subplot(425);plot(f5,y5);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.6工况频谱']);
% %         axis([0 500 -inf inf]);
%         subplot(426);plot(f6,y6);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.8工况频谱']);
% %         axis([0 500 -inf inf]);
%          subplot(4,2,[7,8]);plot(f7,y7);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'通道0.9工况频谱']);



%         saveas(gcf, ['G:\TestProject(2016-09-24,15-34-22)\codes\稳工况频谱\通道' num2str(n) '稳工况频谱500.fig']);
    end
end

% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13