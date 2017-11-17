function win2 = MakeWindowsTF(Name,n , Hop_Size)
% MakeWindow -- Make artificial Window so it will be tight frame
% this file is modified from 'STFT.m' originally by 
% Ilker Bayram, Istanbul Technical University,
%  Usage
%    wig = MakeWindow(Name,n)
%  Inputs
%    Name   string: 'Rectangle', 'Hanning', 'Hamming',
%            'Gaussian', 'Blackman';
%    n      Window length
%    Hop_Size: the steps
%  Outputs
%    win    1-d Window, with length 2n+1;
%  Description
%    Rectangle		1
%    Hanning 		cos(pi*t)^2
%    Hamming		.54 + .46cos(2pi*t)
%    Gaussian		exp(-18 * t^2/2)
%    Blackman		.42 + .50*cos(2pi*t) + .08cos(4.*pi.*t)
%  Examples
%     win = MakeWindow('Rectangle',17);	plot(win);
%     win = MakeWindow('Hanning',  17);	plot(win);
%     win = MakeWindow('Hamming',  17);	plot(win);
%     win = MakeWindow('Gaussian', 17);	plot(win); 
%     win = MakeWindow('Blackman', 17);	plot(win);
%

% Modified by Zhaozhibin from Xi'an Jiaotong University
% Date: 2017.09
% Email:zhaozhibin@stu.xjtu.edu.cn
if mod(n , 2)
    n = floor(n / 2);
    t = ((1:(2*n+1))-(n+1))./n./2;
else
    n = n / 2;
    t = linspace(-n , n , n*2)./n./2;
end
 if strcmp(Name,'Rectangle')
 	win = ones(size(t));
 elseif strcmp(Name,'Hanning')
	win = realpow(cos(pi.*t),2);
 elseif strcmp(Name,'Hamming')
	win = .54 + .46*cos(2.*pi.*t);
 elseif strcmp(Name,'Gaussian')
	win = exp(-realpow(t,2)*18);
 elseif strcmp(Name,'Blackman')
	win = .42 + .50*cos(2.*pi.*t) + .08*cos(4.*pi.*t);
 end
 
 % normalize the window according to the Hop_Size so that the STFT is a
 % tight frame
 K = floor(n / Hop_Size);
 win2 = win .^ 2;
 Temp = win2;
 for k = 1 : K
     Temp(1:end-k*Hop_Size) = Temp(1:end-k*Hop_Size) + win2(k*Hop_Size+1:end);
 end
 for k = 1 : K
     Temp(k*Hop_Size+1:end) = Temp(k*Hop_Size+1:end) + win2(1:end-k*Hop_Size);
 end 
 win2 = win ./ sqrt(Temp);
end

