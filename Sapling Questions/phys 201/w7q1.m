function w7q1(x1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I = 8;
N = 420;
R = 14;
R=R/100;
mu = 4*pi*10^-7;

x1 = x1/100;

Bx1 = mu*N*I*R*R/(2*(x1^2+R^2)^(3/2));
x2 = x1-R;
Bx2 = mu*N*I*R*R/(2*(x2^2+R^2)^(3/2));


Bx = Bx1+Bx2
end

