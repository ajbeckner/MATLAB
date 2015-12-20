function [r1 r2] = quad(a,b,c)
r1 = (-b + (b^2 - 4*a*c)^(1/2))/(2*a);
r2 = (-b - (b^2 - 4*a*c)^(1/2))/(2*a);
end