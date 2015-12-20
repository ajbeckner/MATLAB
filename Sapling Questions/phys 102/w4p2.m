function  w4p2( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fprintf('\nPlease input the numbers EXACTLY as they are given in the problem unless otherwise instructed.')
fprintf('\n(this includes: scientific notation, bad units, and pos/neg signs.\n')

q1 = input('\nWhat is the charge of q1? ');
q2 = input('\nWhat is the charge of q2? ');
D = input('\nWhat is the distance ''D'' between the charges (in meters)? ');
d = input ('\nWhat is the distance ''d'' to the origin (in meters)? ');

r1 = d;
r2 = D + d;
k = 8.99*10^9;

V1 = (k*q1)/r1;
V2 = (k*q2)/r2;

V = V1 + V2;
fprintf('\n\nThe potential (or voltage) at A is: %d V.\n',V)
end

