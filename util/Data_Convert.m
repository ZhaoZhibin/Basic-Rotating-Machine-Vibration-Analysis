function [Channel_Number] = Data_Convert( CurrentFolder, MyFileInfo_Channel ,  Cons)
% This function realizes Converting the data
% Input:
%          CurrentFolder : the folder where you save the data
%          MyFileInfo_Channel : the channels' name
%          Cons : some constant parameters
%  Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
%  Contact with zhaozhibin@stu.xjtu.edu.cn
%  Date: 2017.06.19
k = 1 : Cons.Channel;
Channel_Number = setdiff(k , Cons.ChannelNot);
switch Cons.Collect
    case 1
        % 实现Econ一体机数据采集器的数据转换
        % 忆恒的通道九是转速通道
        for i = 1 :  length(Channel_Number)%通过循环控制通道数
            filename = [CurrentFolder '\' MyFileInfo_Channel(Channel_Number(i)).name];%设置文件路径
            fileID = fopen(filename);
            if Cons.type == 1                
            % 实现y数据保存形式
                x = textscan(fileID,'%f','HeaderLines',21);%读成一个cell数组，根据TXT文件内容设置读取的方式，HeaderLines设置前面空掉的行数。
                fclose(fileID);
                Data = cell2mat(x);
            else
            % 实现x-y数据保存格式
                x = textscan(fileID,'%f %f','HeaderLines',21);
                fclose(fileID);
                Data = cell2mat(x(1,2));
            end
            %% 在抽取之前，默认地采用了8阶chebyshevI型低通滤波器压缩频带。
            % Data = decimate(Data,4);%对原始数据进行降采样处理，原始数据采样频率为12800，降采样之后为3200.根据需要选取！！！
            
            filename = ['Econchan' num2str(Channel_Number(i)) '.mat'];%cell格式转换为mat格式文件
            save(filename,'Data','-v7.3');
        end
        
    case 2    
        % 实现Econ数据采集器（区别一体机）保存文件.txt快速转换为.mat
        %（注意Econ保存的格式是按照x-y或者y的格式进行保存的）
        for i = 1 :  length(Channel_Number)%通过循环控制通道数
            filename = [CurrentFolder '\' MyFileInfo_Channel(Channel_Number(i)).name];%设置文件路径
            fileID = fopen(filename);
            if Cons.type == 1                
            % 实现y数据保存形式
                x = textscan(fileID,'%f','HeaderLines',18);%读成一个cell数组，根据TXT文件内容设置读取的方式，HeaderLines设置前面空掉的行数。
                fclose(fileID);
                Data = cell2mat(x);
            else
            % 实现x-y数据保存格式
                x = textscan(fileID,'%f %f','HeaderLines',18);
                fclose(fileID);
                Data = cell2mat(x(1,2));
            end
            %% 在抽取之前，默认地采用了8阶chebyshevI型低通滤波器压缩频带。
            % Data = decimate(Data,4);%对原始数据进行降采样处理，原始数据采样频率为12800，降采样之后为3200.根据需要选取！！！
            filename = ['Econchan' num2str(Channel_Number(i)) '.mat'];%cell格式转换为mat格式文件
            save(filename,'Data','-v7.3');
        end
        
        
    case 3
        % 本程序实现HBM数据采集器的数据转换，从Txt转换为Mat
        for i = 1 :  length(MyFileInfo_Channel)  %根据通道数设定循环
            filename = [CurrentFolder '\' MyFileInfo_Channel(i).name];%输入你需要转换文件的路径
            fileID = fopen(filename);
            % textscan(fileID,'%s')
            x = textscan(fileID,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');%读成一个16列的cell数组
            fclose(fileID);
            for j = Channel_Number %根据自己设置的通道数
                Data = cell2mat(x(j));
                filename = ['HBMchan' num2str(j) '.mat'];%cell格式转换为mat格式文件
                save(filename,'Data');
            end
        end
        
        
        
end

