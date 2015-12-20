clear all;clc
m = input('What is the mass of each rod in kg?');
r = input('What is the length of each rod in m?');

I = (5/3)*m*r*r;
rpm = 581;
w = (104.72/1000)*rpm;
KE = .5*I*w*w;
clc
fprintf('The rotational KE is %d.\n',KE)