function [ c,p,A,i ] = findHypotenuse( a,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
c= sqrt(a^2+b^2);
p = a + b + c;
A = .5*a*b;
if a == b
    i = 1;
elseif a ~= b
    i = 0;
end

