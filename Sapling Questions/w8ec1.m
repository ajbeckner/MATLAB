clear all; clc

mM = 7.36*10^22;
mE = 5.97*10^24;
r = 3.84*10^8;
G = 6.67*10^-11
Fg = G*mM*mE/(r*r);

d = 2.3*10^-3;
W = Fg*d

ef = .85;
c = 3*10^8;
E = W/ef;
m = E/(c*c)
%W = .85*E = .85*m*c^2