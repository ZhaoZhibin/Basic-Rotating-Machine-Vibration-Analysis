function Cal_Plot(CurrentFolder, MyFileInfo_Channel , Cons , Channel_Number)
% This function realizes calculating , ploting and save the figure
% Input:
%          CurrentFolder : the folder where you save the data
%          MyFileInfo_Channel : the channels' name
%          Cons : some constant parameters
%          Channel_Number : the channels' sequences without the channels which
%          you do not want to analysis
%  Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
%  Contact with zhaozhibin@stu.xjtu.edu.cn
%  Date: 2017.06.19

Fs = Cons.Fs;  % Setting the sampling frequency





% plot the Rms comparison figure
if Cons.Flag_RMS
    Rms_Estimate(CurrentFolder, MyFileInfo_Channel , Fs , Cons , Channel_Number)
end
    
for i = 1 : length(MyFileInfo_Channel)    
    
    filename = MyFileInfo_Channel(i).name;
    [~,name,~] = fileparts(filename);
    load(filename);
    Data = Data(:);
    Data = Data-mean(Data);
    if isempty(find(Cons.Speed == Channel_Number(i)))
        % plot the time domain
        n = length(Data);
        t = 0:1/Fs:(n-1)/Fs;
        plot(t,Data);
        title([name '-Time-Domain']);
        xlabel('Time /s')
        ylabel('Amplitude')    
        filename_save = [CurrentFolder '\' name '_Time.fig'];
        saveas(gcf, filename_save);
        close gcf
    end
    
    
    % plot the time-frequency figure
    nLevel = Cons.Win_Len-Cons.Overlap;
    win = MakeWindows('Gaussian', Cons.Win_Len , nLevel);
    Nfft = Fs / Cons.Freq_Res;
    [specgmShow] = STFT(Data , win , nLevel); %具体参数调节输入help STFT,数据点太长可以调整分辨率
    Step = Fs/Cons.Freq;
    specgmShow = abs(specgmShow(1:floor(size(specgmShow,1)/Step),:));
    [ff,tt] = size(specgmShow);
    colormap(jet_Linchao(64))
    if isempty(find(Cons.Speed == Channel_Number(i)))
        imagesc((0:nLevel:(tt-1)*nLevel)/Fs , Cons.Freq*linspace(0,1,ff) , (specgmShow)); %(specgmShow-spmin)/(spmax-spmin)
        axis xy;
        xlabel('Time : s');
        ylabel('Frequecy : Hz')   
        title([name '-Time-Frequency']);
        axis([0 , (((tt-1)*nLevel)/Fs) ,0 , Cons.Freq])
    %      caxis([0,0.001])
        filename_save = [CurrentFolder '\' name '_TF.fig'];
        saveas(gcf, filename_save); 
        close gcf
    else        
        imagesc((0:nLevel:(tt-1)*nLevel)/Fs ,Cons.Freq*linspace(0,1,ff)/Cons.Normalized , (specgmShow)); %(specgmShow-spmin)/(spmax-spmin)
        axis xy;
        xlabel('Time : s');
        ylabel('Frequecy : Hz')   
        title([name '-Speed-Time-Frequency']);
        axis([0 , (((tt-1)*nLevel)/Fs) ,0 , 500])
    %      caxis([0,0.001])
        filename_save = [CurrentFolder '\' name '_Speed_TF.fig'];
        saveas(gcf, filename_save); 
        close gcf
    end
       
end

