function [ Eigenfre] = Calculatingbearing(fr, Dp, Dw, theta, n)
% CALCULATINGBEARING calculating the eigenfrequency of bearing 
% (supposed that the contact between rolling elements and inner and outer rings is pure roll)
% made by Zhaozhibin
% date:2015.12.6
% Input:
%       fr : the rotating frequency of the shaft/HZ
%       Dp : the pitch diameter of bearing which is equal to (OD+ID)/2  /mm
%       Dw : the diameter of rolling elements/mm
%       theta : the contact angle/бу
%       n : the number of rolling element
% Output:
%       Eigenfre : [fc, fo, fi, fe],the characteristic frequencies of the bearing
%       fc : the revolution frequency of rolling element,or the rotating frequency of the cage
%       fo : the passage frequency(fault characteristic frequency) of the outer ring 
%       fi : the passage frequency(fault characteristic frequency) of the inner ring
%       fe : the passage frequency(fault characteristic frequency) of the rolling element
fc = fr / 2 * (1-Dw/Dp*cosd(theta)); 
fb = fr * Dp / Dw / 2 * (1-(Dw/Dp)^2*(cosd(theta))^2);
fo = n * fc;
fi  = n * (fr-fc);
fe = fb;
Eigenfre = [fc, fo, fi, fe];
end

