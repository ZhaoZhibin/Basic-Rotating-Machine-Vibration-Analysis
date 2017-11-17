function win2 = MakeWindows(Name , n)
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

% Modified by Zhaozhibin
% Date: 2017.09
% Email:zhaozhibin@stu.xjtu.edu.cn
n = n+1-rem(n,2);
n = floor(n / 2);
t = ((1:(2*n+1))-(n+1))./n./2;
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
win2 = win / norm(win);

 
end

