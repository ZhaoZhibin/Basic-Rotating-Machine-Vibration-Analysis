% This function realizes ploting frequency domain for each operating condition
clear all;
close all;
clc;
for n = 1:2  
%     filename = ['HBMchan',num2str(n),'.mat'];
    filename = ['Econchan',num2str(n),'.mat'];
    if n ~= 4
        load (filename);
%         Data = cell2mat(Data);
        Data = Data(:);  
        Data = Data-mean(Data);  
        Fs = 4000; 
        % setting the interval of each operating condition
        Data1 = Data(500*Fs:502*Fs-1);  
        Data2 = Data(2925*Fs:2926*Fs-1);  
        Data3 = Data(3800*Fs:3802*Fs-1);  
        Data4 = Data(4800*Fs:4802*Fs-1);  
        Data5 = Data(5900*Fs:5902*Fs-1);  
        Data6 = Data(7000*Fs:7002*Fs-1);  
        Data7 = Data(8150*Fs:8152*Fs-1); 
        
        [y1,f1]=Dofft(Data1,Fs);
        [y2,f2]=Dofft(Data2,Fs);
        [y3,f3]=Dofft(Data3,Fs);
        [y4,f4]=Dofft(Data4,Fs);
        [y5,f5]=Dofft(Data5,Fs);
        [y6,f6]=Dofft(Data6,Fs);
        [y7,f7]=Dofft(Data7,Fs);
        %œ‘ æ500Hz“‘ƒ⁄
%       y1=y1(1:end/4);f1=f1(1:end/4);
%       y2=y2(1:end/4);f2=f2(1:end/4);
%       y3=y3(1:end/4);f3=f3(1:end/4);
%       y4=y4(1:end/4);f4=f4(1:end/4);
%       y5=y5(1:end/4);f5=f5(1:end/4);
%       y6=y6(1:end/4);f6=f6(1:end/4);
        

        figure;
        subplot(321);plot(f1,y1);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'1']);
        axis([0 500 -inf inf]);
        subplot(322);plot(f3,y3);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'2']);
        axis([0 500 -inf inf]);
        subplot(323);plot(f4,y4);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'3']);
        axis([0 500 -inf inf]);
        subplot(324);plot(f5,y5);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'4']);
        axis([0 500 -inf inf]);
        subplot(325);plot(f6,y6);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'5']);
        axis([0 500 -inf inf]);
        subplot(326);plot(f7,y7);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'6']);
        axis([0 500 -inf inf]);
        figure;
        plot(f2,y2);xlabel('Frequency(Hz)');ylabel('Am');title([num2str(n),'7']);
        axis([0 500 -inf inf]);

    end
end

% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13