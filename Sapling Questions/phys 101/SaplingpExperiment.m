clear all; clc
v1 = 13.9;
v2 = 15.3;
v3 = 15.5;
m1 = 37.1;
m2 = 48.7;
m3 = 78.9;
m1 = m1/100;
m2 = m2/100;
m3 = m3/100;
%pbefore = pafter
%mvbefore = mvafter
netm = m1+m2+m3
netv1 = (m1*v1)/netm
netv2 = (m2*v2)/netm
netv3 = (m3*v3)/netm
vFinal = sqrt(netv1^2 + netv2^2 + netv3^2)