function [p, z] = polylsqr(x,y,m)
% to obtain PCT parameters
% x: time
% y:estimated IF
% m: polynomial order
n=length(x);
n=length(y);
for k=1:2*m+1
   c(k)=sum(x.^(k-1));
end
%Find the coefficient vector b of normal equations
for k=1:m+1
   b(k)=sum(y.*x.^(k-1));
end
% Find the coefficient matrix A of normal equations
for i=1:m+1
   for j=1:m+1
      A(i,j)=c(j+i-1);
   end
end 

z=A\b';

p = zeros(size(x));

for i=1:n
   s=z(1);
   for k=2:m+1
      s=s+z(k)*x(i)^(k-1); 
   end 
   p(i)=s;
end