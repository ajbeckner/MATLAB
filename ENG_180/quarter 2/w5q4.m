function [ E ] = w5q4( C1,q,C2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

C1 = C1*10^-6;
C2 = C2*10^-6;
q = q*10^-3;

E1 = .5*q^2/C1;
E2 = .5*q^2/C2;

E = abs(E1 - E2);

end