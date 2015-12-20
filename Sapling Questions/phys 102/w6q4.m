function w6q4
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a = 44.5;
B = .0673;
T = .00247;

%T = m*Bsin(a)
m = T/(B*sind(a));
fprintf('\nThe magnetic dipole moment is: %d \n\n',m)


end

