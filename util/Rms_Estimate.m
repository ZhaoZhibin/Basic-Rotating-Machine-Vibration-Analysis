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


cl = {'r';'g';'b';'y';'m';'c';'k'};  %Refer to the number of channels
for i = 1 : length(MyFileInfo_Channel)
    if ~isempty(find(Cons.Speed == Channel_Number(i)))
        continue;
    end
    filename = MyFileInfo_Channel(i).name;
    load(filename)
    Data = Data(:);  % transfer to column vector
    Data = Data-mean(Data); 
    L = length(Data);
    % Calculate RMS
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
% legend('low pressure','high pressure','Location','NorthEastOutside');
legend('low pressure','high pressure','Location','NorthEastOutside');
filename_save = [CurrentFolder '\Total_Comparison.fig'];
saveas(gcf, filename_save); 
close gcf
end

