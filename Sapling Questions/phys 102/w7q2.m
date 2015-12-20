function [I, B, Bcheck] = w7q2
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

R = 65/2000;
y = 3.1/100;
r = R^2 + y^2
cross = R/r;
B = 5.75*10^-15;
mu = 4*pi*10^-7;
%B = k*(I*pi*2*R*cross/r^2)
%B = mu*I*R*R/(2*r^(3/2))

I = (B*2*(r^(3/2)))/(mu*R*R)
B = mu*I*R*R/(2*R^3)

Bcheck = (mu*I*R^2)/(2*(R^2 +y^2)^(3/2))
end

