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
        % Realize the data transformation from Econ all-in-one machine
        % Channel is the speed channel
        for i = 1 :  length(Channel_Number) 
            filename = [CurrentFolder '\' MyFileInfo_Channel(Channel_Number(i)).name]; 
            fileID = fopen(filename);
            if Cons.type == 1                
            % only save amplitude
                x = textscan(fileID,'%f','HeaderLines',21); 
                fclose(fileID);
                Data = cell2mat(x);
            else
            % save amplitude and time simultaneously
                x = textscan(fileID,'%f %f','HeaderLines',21);
                fclose(fileID);
                Data = cell2mat(x(1,2));
            end
            %% If your sampling frequency is too high, you need down sampling
            % Data = decimate(Data,4);
            
            filename = ['Econchan' num2str(Channel_Number(i)) '.mat'];
            save(filename,'Data','-v7.3');
        end
        
    case 2    
        % Realize the data transformation from Econ (not all-in-one
        % machine)
        for i = 1 :  length(Channel_Number)
            filename = [CurrentFolder '\' MyFileInfo_Channel(Channel_Number(i)).name];
            fileID = fopen(filename);
            if Cons.type == 1                
            % only save amplitude
                x = textscan(fileID,'%f','HeaderLines',18);
                fclose(fileID);
                Data = cell2mat(x);
            else
           % save amplitude and time simultaneously
                x = textscan(fileID,'%f %f','HeaderLines',18);
                fclose(fileID);
                Data = cell2mat(x(1,2));
            end
            %% If your sampling frequency is too high, you need down sampling
            % Data = decimate(Data,4);
            filename = ['Econchan' num2str(Channel_Number(i)) '.mat'];
            save(filename,'Data','-v7.3');
        end
        
        
    case 3
        % Realize the data transformation from HBN
        for i = 1 :  length(MyFileInfo_Channel)  
            filename = [CurrentFolder '\' MyFileInfo_Channel(i).name]; % this is the name of the file
            fileID = fopen(filename);
            % textscan(fileID,'%s')
            x = textscan(fileID,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');
            fclose(fileID);
            for j = Channel_Number  %According to the number of channels
                Data = cell2mat(x(j));
                filename = ['HBMchan' num2str(j) '.mat'];
                save(filename,'Data');
            end
        end
        
        
        
end

