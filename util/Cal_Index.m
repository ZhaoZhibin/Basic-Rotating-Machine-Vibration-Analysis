function [ Index ] = Cal_Index( x )
% Calculate the Index of time domain for dimensional and non-dimensional
% Made by Zhibin Zhao, Baoqing Ding, Shuming Wu
% Contact with zhaozhibin@stu.xjtu.edu.cn
% Date: 2016.09.13
% x:the original signal

[a,b] = size(x);
y = mean(x);
x = x-y;
if a == 1
   x = x';
end   
% disp('Result of parameters');
% disp('Mean Value=');% the average
% disp(y)
% disp('Standard Deviation Value=');
% Sta=std(x);
% disp(Sta)
% disp('Variance Value=');
% Var=var(x);
% disp(Var)
% disp('Skewness Value=');
% Ske=skewness(x);
% disp(Ske)
% disp('kurtosis Value=');
% Kur=kurtosis(x);
% disp(Kur)
% disp('P_P Value=');
% Ppv=max(x)-min(x);
% disp(Ppv)
% disp('Xr Value=');
% Xr=(mean(sqrt(abs(x))))^2;
% disp(Xr);
% disp('Xmean Value=');
% Xmean=mean(abs(x));
% disp(Xmean);
% disp('Xrms Value=');
% Xrms=sqrt(mean(x.*x));
% disp(Xrms);
% disp('Xp Value=');
% Xp=max(max(x), -min(x));
% disp(Xp);
% disp('W Value=');
% W=Xrms/Xmean;
% disp(W)
% disp('C Value=');
% C=Xp/Xrms;
% disp(C)
% disp('I Value=');
% I=Xp/Xmean;
% disp(I)
% disp('L Value=');
% L=Xrms/Xr;
% disp(L)
% 
% disp('S Value=');
% S=Ske/(mean(sum(x.^3)) );
% disp(S)
% 
% disp('K Value=');
% K=Kur/(mean(sum(x.^4)) );
% disp(K)
% Index=[y,Sta,Var,Ske,Kur,Ppv,Xr,Xmean,Xrms,Xp,W,C,I,L,S,K];
Xrms = sqrt(mean(x.*x));
Index = Xrms;
end

