function w4p4()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
fprintf('\nPlease input the numbers EXACTLY as they are given in the problem unless otherwise instructed.')
fprintf('\n(this includes: scientific notation, bad units, and pos/neg signs.\n')

q = input('\nWhat is the charge in C? ');
r = input('\nWhat is the radius in m? ');
v = input('\nWhat is the voltage of separation in V? ');
k= 8.99*10^9;


V = (k*q)/r;
fprintf('\n\nThe voltage of the surface is: %.4f V. ',V)
newV = V - v;

d = (k*q)/newV;
fprintf('\n\nThe distance from the charge is: %.6f. \n',d);
end

