%Rest energy is given as E = mc^2
%where mchange of the nucleus is the mass of the alpha particle
clear;clc
c = 2.998*10^8; 
% by momentum
m1 = 4.0026*1.66*10^(-27);
m2 = 215.0*1.66*10^(-27);
E1 = 1.388*10^(-12);
v1 = sqrt(2*E1/m1)
v2 = (m1*v1)/m2
dE = .5*m1*v1*v1 + .5*m2*v2*v2

mchange = dE/(c^2)