function [X, T] = MassSpringPlot( m, c, k, x0, x1)
%% MassSpringPlot
% created by Anthony Beckner 12824358
% Math 262 - B Prof Carlo winter 2013 
% % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % 
% script will solve a 
% %mx'' + cx' + kx = 0
% m = input('What is m?');
% c = input('What is c?');
% k = input('What is k?');
% x0 = input('What is x(0) = ?');
% x1 = input('What is x''(0) = ?');

% gen sol'n: y = C1*e^(r1*x) + C2*e^z(r2*x)
if c^2 - 4*m*k > 0
    %Calculate r values for system of equations
    r1 = (-c + (abs(c^2 - 4*m*k))^(1/2))/(2*m);
    r2 = (-c - (abs(c^2 - 4*m*k))^(1/2))/(2*m);
    %set up system to solve for C1 and C2 in vector C
    M = [1 1;r1 r2];
    b = [x0;x1];
    C = M\b;
    %graph x(t) for horizontal position over time
    t = linspace(0,5);
    x = C(1)*exp(r1*t) + C(2)*exp(r2*t);
    plot(t,x)
    shg
elseif c^2 - 4*m*k < 0
    alpha = -c/(2*m);
    beta = sqrt(4*m*k -c^2)/(2*m);
    %y = C1*exp(alpha*x).*cos(beta*x) + C1*exp(alpha*x).*sin(beta*x)
    M = [1 0; alpha beta];
    b = [x0;x1];
    C = M\b;
    %graph x(t) for horizontal position over time
    t = linspace(0,5);
    x = C(1).*exp(alpha*t).*cos(beta*t) + (C(2).*exp(alpha.*t).*sin(beta*t));
    plot(t,x)
    shg
elseif c^2 - 4*m*k == 0
    %first r value
    r = -c/(2*m) ;
    % Matrix to solve for C1 and C2 with 0 space from t2 = tx1
    M = [ 1 0; r 1];
    b = [x0; x1] ; 
    C = M\b ;
    % %graph x(t) for horizontal position over time
    t = linspace(0,5) ;
    x = (C(1) + C(2)*t) .* exp(r*t) ;
    plot(t,x)
    shg
end
X = max(x);
for i = 1:length(x)
    if x(i) == X 
        T = t(i)
    end
end
end