clear all;clc
%I = m*r^2
m = input('What is the mass of each rod in kg?');
r = input('What is the length of each rod in m?');
%A 
IA = (4/12)*m*r*r;
%B 
IB = (1/12)*m*r*r + (1/3)*m*r*r;
%C
mC = 2*m;
rC = 2*r;
IC = (1/3)*mC*rC*rC;
%D
ra = .5*r;
ma = .5*m;
mb = 1.5*m;
rb = 1.5*r;
ID = (1/3)*ma*ra*ra + (1/3)*mb*rb*rb + (1/3)*m*r*r;
clc
fprintf('The moment of inertia for A is %.4f.\n',IA)
fprintf('The moment of inertia for B is %.4f.\n',IB)
fprintf('The moment of inertia for C is %.4f.\n',IC)
fprintf('The moment of inertia for D is %.4f.\n',ID)