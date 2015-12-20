%the change in KE is given by the work done by Ff and Fs over distance d
%therefore -.5*m*v*v = ((mu*m*g) + (.5*k*x))x
%which becomes quadratic 0 = (.5*k)x^2 + (mu*m*g)x + (.5*m*v*v)
m = input('what is the mass in kg? ');
v = input('What is the speed in m/s? ');
g = 9.81;
k = input('What is the spring constant in N? ');
mu = input('What is the coefficient of friction? ')
a = .5*k;
b = mu*m*g;
c = .5*m*v*v;
x2 = (-b + abs(b^2 - 4*a*c)^(1/2))/(2*a);
x1 = (-b - abs(b^2 - 4*a*c)^(1/2))/(2*a);
if x1 ~= x2 && x1 > 0
    fprintf('The block travels %.3f.\n',x1)
elseif x1 ~= x2 && x2 > 0
    fprintf('The block travels %.3f.\n',x2)
elseif x1 == x2 
    fprintf('The block travels %.3f.\n',x1)
else
    fprintf('error: no valid solution was computed.\n')
end