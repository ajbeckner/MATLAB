function w4p3()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
fprintf('\nPlease input the numbers EXACTLY as they are given in the problem unless otherwise instructed.')
fprintf('\n(this includes: scientific notation, bad units, and pos/neg signs.\n')

q = input('\nWhat is the charge in microCoulombs? ');
a = input('\nWhat is the angle in degrees? ');
E = input('\nWhat is the electric field in N/C? ');
d = input('\nWhat is the distance in meters? ');

q = q*10^-6;
r = d;

PE = E*cosd(a)*r*q;
fprintf('\n\nThe work done (potential energy) is: %d J. ',PE)

V = PE/(abs(q));
fprintf('\n\nThe potential difference between positions is: %.6f. \n',V)
end

