clear all ;clc
%   Detailed explanation goes here
r = 2.75/100;
Bmax = .00675;
w = 339;
A = pi*r*r;

%\int E.dl = - B.dA/dt
% B = Bmax*cos(w*t)
% E*l = -Bmax*cos(w*t)*(dA/dt)
%dA/dt = (E*l)/(-Bmax*cos(w*t))
%B*w*A = -E*L*((log((sin(w*t)+1)/sin(w*t)-1))/2)
%2*B*w*A/(L) = -E*((log((sin(w*t)+1)/sin(w*t)-1)))

r1 = 1.45/100;
r2 = 6.85/100;
Emax = 0;

   
E1 = Bmax*A*w/r1;




E2 = Bmax*A*w/r2;




