%elastic PE is given by PEspring = .5*k*x^2
k = input('What is the spring constant in N/m?');
x = input('What is the stretching distance in m?');
KE = input('What is the desired KE in joules?');
%assuming all PE goes to KE, 
%KE = kx^2 = .5(k*constant)x^2
%for the constant, A: A = 2KE/(k*x*x)
format short g
clc
A = (2*KE)/(k*x*x);
fprintf('k must be multiplied by constant, %.3f.\n',A)
% and fot the next constant, B: B = sqrt((2*KE)/(k*x*x))
B = sqrt((2*KE)/(k*x*x));
fprintf('or x must be multiplied by constant, %.3f,\n\n', B)
if k*A*x > k*B*x
    fprintf('He must exert more force by increasing k.\n')
elseif k*A*x < k*B*x
    fprintf('He must exert more force by increasing x.\n')
else
    fprintf('Both situations require equal force.\n')
end

%enjoy,
%- A.J.