function  w4p1()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fprintf('\nPlease input the numbers EXACTLY as they are given in the problem unless otherwise instructed.')
fprintf('\n(this includes: scientific notation, bad units, and pos/neg signs.\n')

E = input('\nWhat is the electric field in scientific notation? '); 
r = input('\nWhat is the length in cm? ');
r = r/100;
qp = 1.6*10^-19;

V = E*r;
fprintf('\n\nThe potential difference (voltage) is: %d V ',V)
PE = qp*V;
fprintf('\n\nThe required work (Energy) is: %d J \n',PE)
end

