function  w6q1
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Fb = 5.05*10^-16;
v = 271;
theta = 79.3;
q = 2*1.602*10^-19;
%Fb = qvBsin(theta)
B = Fb/(q*v*sind(theta));

fprintf('The magnitude of the mgnetic field is: %.4f T.\n',B);

end

