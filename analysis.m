clc
clear all
close all
%% setting the path
% get the fundamental file information
original_path = fileparts(mfilename('fullpath'));
tools = genpath(original_path);
FileFolder = uigetdir('C:\');
cd(FileFolder);
CurrentFolder = pwd;
MyFileInfo = dir;
addpath(tools)
%% setting some fundamental parameters
Cons = Pars_Setting;

if Cons.Flag  % Choose if you have the .mat or not
    %% pick up the filename with .txt
     k = 1;
    for  i = 3 : length(MyFileInfo)
        [~,~,ext] = fileparts(MyFileInfo(i).name);
        if strcmpi(ext , '.txt')
            MyFileInfo_Channel1(k).name = MyFileInfo(i).name; 
            k = k + 1;
        end  
    end
    %% load the data and save it
    Channel_Number = Data_Convert( CurrentFolder, MyFileInfo_Channel1 ,  Cons);
else
    k = 1 : Cons.Channel;
    Channel_Number = setdiff(k , Cons.ChannelNot);
end

%% Calculate the RMS, STFT, and the time domain
MyFileInfo = dir;
 k = 1;
for  i = 3 : length(MyFileInfo)
    [~,~,ext] = fileparts(MyFileInfo(i).name);
    if strcmpi(ext , '.mat')
        MyFileInfo_Channel2(k).name = MyFileInfo(i).name; 
        k = k + 1;
    end  
end

Cal_Plot(CurrentFolder, MyFileInfo_Channel2 , Cons , Channel_Number)


%  Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
%  Contact with zhaozhibin@stu.xjtu.edu.cn
%  Date: 2017.06.19
