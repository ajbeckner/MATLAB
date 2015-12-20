%sice the v is constant a  = 0
%since a = 0 the net force = 0 and the other forces are in equilibrium.
%Fg separates into two componants
%the total Fg along the incline must = Ffriction
%Ffriction uses kinetic mu because the block is in motion
clc
clear
m2 = input('What is the mass of block 2?');
mu = input('What is the coefficient of friction?');
theta = input('What is the angle of the incline?');
g = 9.81;

Fg2 = m2*g;
Fg2i = Fg2*sind(theta);
Fg2p = Fg2*cosd(theta);
Fn2 = Fg2p;
FF = Fn2*mu;

massOfOne = (FF + Fg2i)/g