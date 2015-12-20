% while the car coasts the only force acting on it is drag. this is asociated
% with the work and that can be found as the difference in energy
v1 = input('What is the starting velocity in m/s?\n');
v2 = input('What is the ending velocity in m/s?\n');
m = input('What is the mass in kg?\n');
h = input('What is the height in m?\n');
d = input('What is the distance traveled up ramp in m?\n');
%fitst KE loss
g = 9.81;
KE1 = .5*m*v1*v1;
KE2 = .5*m*v2*v2;
KE = KE2 - KE1;
PE = m*g*h;
    W = PE + KE;
F = W/d;
clc
fprintf('The Drag force is %.2f N.\n',abs(F))

%enjoy,
%- A.J.
