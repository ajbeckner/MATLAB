function w5q2
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fprintf('\nPlease input the numbers from the problem in the order that they appear, exactly as they apper. \n')
Cold = input('C_original = ');

C = Cold*5;
disp(C)
Cnew = ((2*C)^-1 + (3*C)^-1)^-1;
fprintf('The new Capacitance = %d\n',Cnew)
end

