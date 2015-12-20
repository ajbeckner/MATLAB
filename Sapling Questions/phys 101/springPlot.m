function [ plot(x,y) ] = springPlot( m c k y0 y1 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

m = input('What is m?');
c = input('What is c?');
k = input('What is k?');
y0 = input('What is y(0) = ?');
y1 = input('What is y''(0) = ?');
r1 = (-c + (abs(c^2 - 4*m*k))^(1/2))/(2*m);
r2 = (-c - (abs(c^2 - 4*m*k))^(1/2))/(2*m);
%gen sol'n: y = C1*e^(r1*x) + C2*e^z(r2*x)
if isreal(r1) && isreal(r2)
    M = [1 1;r1 r2];
    b = [y0;y1];
    C = M\b;
    x = linspace(0,5);
    y = C(1)*exp(r1*x) + C(2)*exp(r2*x);
    plot(x,y)
end
end

