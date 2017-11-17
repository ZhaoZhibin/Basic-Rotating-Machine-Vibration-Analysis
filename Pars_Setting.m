function [ Cons ] = Pars_Setting()
% Setting some constant parameters
%  Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
%  Contact with zhaozhibin@stu.xjtu.edu.cn
%  Date: 2017.06.19
Cons.Fs = 10240;        % sampling frequency

%% This is the collection information
Cons.Collect = 1;        % 1 : yiheng; 2: yiheng(all-in-one); 3:HBM
Cons.Flag = 0;           %0 : you do not want to convert your data(actually, you have save the .mat already; you want to use .mat directly); 1 : you want to save the data as .mat
Cons.type = 1;         %1: save as y;   2: save as x-y(determined by your setting in the collector)

%% This is the channel information
Cons.Channel = 1;          % the number of the channels
Cons.ChannelNot = [5,6]; % this is the channel which you do not want to analysis

%% This is the Speed information
Cons.Speed = [];   %This is your speed channel, only calculate the time-frequency figure!!!!!
Cons.Normalized = 6; % This is the Speed Normalized factor, it is depended on the collecting.

%% This is the calculating information for RMS estimating
Cons.Flag_RMS = 1;    % if the value is 0, we do not calculate the RMS, if the value is 1, we calculate the RMS.
Cons.Len = 5120;        % Calculating the RMS with Cons.Len points
Cons.Olap = 2560;      % Calculating the RMS with Cons.Olap overlapping points

%% This is the calculating information for STFT estimating
Cons.Win_Len = 20480;  % the length of the window used in STFT
Cons.Overlap = 10240;   % the oveplap of the window
Cons.Freq = 1000;      % This is the max frequency interval which you want to save
Cons.Freq_Res = 1;     % the frequency resolution ratio---->1 : 1HZ ; 2 : 2Hz

end

