function Rms_Estimate(CurrentFolder, MyFileInfo_Channel , Fs , Cons , Channel_Number)
% This function realizes calculating , ploting and save the
% Rms_Comparison figure
% Input:
%          CurrentFolder : the folder where you save the data
%          MyFileInfo_Channel : the channels' name
%          Fs : the sampling frequency
%          Cons : some constant parameters
%          Channel_Number : the channels' sequences without the channels which
%          you do not want to analysis
%  Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
%  Contact with zhaozhibin@stu.xjtu.edu.cn
%  Date: 2017.06.19


cl = {'r';'g';'b';'y';'m';'c';'k'}; %根据需要的通道数来画图
for i = 1 : length(MyFileInfo_Channel)
    if ~isempty(find(Cons.Speed == Channel_Number(i)))
        continue;
    end
    filename = MyFileInfo_Channel(i).name;
    load(filename)
    Data = Data(:); % 实现行向量向列向量的转换
    Data = Data-mean(Data); %去平均
    L = length(Data);
    % 计算RMS值，每Cons.Len个点计算一次，中间重叠Cons.Olap个点
    N = Cons.Len;
    start = 1;
    t = (1:L)/Fs;
    Timeindex = start : Cons.Olap : (L-N);
    for irow = 1:length(Timeindex)
        Vibrationseg = Data(Timeindex(irow):Timeindex(irow)+N-1);
        Index= Cal_Index(Vibrationseg);
        Rms(irow) = Index;
    end
    plot(t(Timeindex + Cons.Olap),Rms);
    hold all;
    axis([-inf,inf,-inf,inf]);   
end
% legend('低压','高压','Location','NorthEastOutside');
legend('低压','高压','Location','NorthEastOutside');
filename_save = [CurrentFolder '\Total_Comparison.fig'];
saveas(gcf, filename_save); 
close gcf
end

