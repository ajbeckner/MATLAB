%% q1 
% lambda = 5.46*10^(-6);
% R = .0215;
% x = 1.1;
% r = sqrt(R^2 +x^2);
% k = 8.99*10^9;
% q = lambda*(pi*R*2);
% ah = x/r;
% E = (k*q)/(r*r)

%% q2
k = 8.99*10^9;
d = 7.53*10^(-6);
r = d/2;
A = pi*r*r;
q = -2.55*10^-12;
rho = q/A;

R1 = 3.55*10^(-6);
A1 = pi*R1^2;
q1 = rho*A1;
E1 = (k*q1*R1)/(r*r^2)

R2 = r;
A2 = pi*R2*R2;
q2 = rho*A2;
E2a = (k*q2*R2)/(r^3)

E2b = (k*q2)/(r^2)

R3 = r + R1;
E3 = (k*q)/(R3^2)

%% q3 
clear all; clc
eps = 8.85*10^(-12);
r1 = .034;
r2 = .0289;

rho = 5.22 * 10^-3;

r = .0714;

A = r1*r1 - r2*r2;

E = (rho*A)/(2*r*eps)

%% q4

sqrt((31^2/(2*eps))+(-31^2/(2*eps)))

%%

k = 8.99*10^9;
lambda = 3*10^(-6);
l = .204;
d = .35 - l;

E = ((k*lambda)/d) - ((k*lambda)/(l +d))
