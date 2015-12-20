function Emf = w8q1
%   Detailed explanation goes here

n = 101;

r = 2.25;
r = r/100;

t = .169;

Bi = 50.7;
Bi = Bi/1000;

Bf = 90.3;
Bf = Bf/1000;
dB = Bf - Bi;

dA = pi*r*r;

Emf = -dB*dA*n/t;
Emf = Emf*1000;

end

