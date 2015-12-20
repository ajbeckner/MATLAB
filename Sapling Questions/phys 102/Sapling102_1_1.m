q = 1.60*10^(-19);
k = 9*10^9;
r = 971*10^-9;

Fe = (k*q*q)/(r^2);
disp(Fe)

%% q2
clear all;
q = 1.45*10^-6;
k = 8.99*10^9;
r1 = .10;
r2 = .06;

Fe1 = (k*q*2*q)/(r1^2);
Fe2 = (k*q*2*q)/(r2^2);
Fe = Fe2-Fe1;
disp(Fe)

%% q3
clear all
%T*sin(theta) = m*g
%T*cos(theta) = q*E
%m*g = q*E*tand(theta)
theta = 90-9.8;
q = 1.55;
g = 9.8;
m = .25/1000;
E = (m*g)/(q*tand(theta));
fprintf('%d',E)

%% q4
clear; clc

%do first charge's E
q1 = 3.35*10^-9;
r = .84;
k = 9*10^9;
E1 = (k*q1)/r^2;

%do second
q2 = 4*10^-9;
a = 1.1;
o = .5;
h = sqrt(o^2 + a^2);
E2 = (k*q2)/h^2;

%solve for x and y

Ex = -E2*(a/h);
Ey = E1-E2*(o/h);
disp(Ex)
disp(Ey)

%% bonus 1

k = 8.99*10^(9);
g = 9.81;
q1 = 4.25 * 10 ^ (-6);
q2 = 46.3 * 10 ^(-9);
m = 12.5 * 10 ^ (-3);
r = .225;
Fe = k*q1*q2/(r*r)
Fg = m*g
theta = atand(Fe/Fg)

%% bonus 2

k = 8.99*10^(9);
q = 17.5* 10 ^(-6);
q1 = 15.4* 10 ^(-6);
q2 = 38.6* 10 ^(-6);
q3 = 87.3* 10 ^(-6);

r = .501;
t = atan(r/r);
r2 = sqrt(2*r^2)
Fe1 = (k*q*q1)/(r*r);
Fe3 = (k*q*q3)/(r*r);
Fe2x = (k*q*q2*cos(t))/(r2*r2);
Fe2y = (k*q*q2*sin(t))/(r2*r2);

Fey = Fe3 - Fe2y;
Fex = Fe1 - Fe2x;
Fe = sqrt(Fex^2 + Fey^2)



