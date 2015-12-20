clear all; clc

T = 298.15;
R = .008314;
P = 34.71/760;
Q = P/(P*P);
G = (-204.6) - (-137.2);
%G = H + (S*T)
%G = -R*T*log(K)
Gnew = G + R*T*log(Q);
