
% my'' + cy' + ky = 0
% y(0) = y0
% y'(0) = y1

clear all; close all; clc;

m = input('What is the m value for the equation?\n'); %1
c = input('What is the c value for the equation?\n'); %3
k = input('What is the k value for the equation?\n'); %1
y0 = input('What is the y0 value for the equation?\n'); %2
y1 = input('What is the y1 value for the equation?\n'); %2

% assume c^2-4mk > 0
% (overdamped)
r1 = (-c+sqrt(c*c-4*m*k))/(2*m) ;
r2 = (-c-sqrt(c*c-4*m*k))/(2*m) ;

% create 2x2 system to fit initial conds
M = [1 1; r1 r2] ;
rhs = [y0; y1];
coeff = M\rhs;

% plot
t = linspace(0, 5) ;
y = coeff(1)*exp(r1*t) + coeff(2)*exp(r2*t) ;
plot (t, y) ;
