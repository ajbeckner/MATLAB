% my'' + cy' + ky = 0
% y(0) = y0
% y'(0) = y1

clear all; close all; clc;

m = input('What is the m value for the equation?\n'); 
c = input('What is the c value for the equation?\n'); 
k = input('What is the k value for the equation?\n'); 
y0 = input('What is the y0 value for the equation?\n'); 
y1 = input('What is the y1 value for the equation?\n'); 

if( c*c-4*m*k > 0)
    r1 = (-c+sqrt(c*c-4*m*k))/(2*m) ;
    r2 = (-c-sqrt(c*c-4*m*k))/(2*m) ;

    % create 2x2 system to fit initial conds
    M = [1 1; r1 r2] ;
    rhs = [y0; y1];
    coeff = M\rhs;

    % plot
    t = linspace(0, 5) ;
    y = coeff(1)*exp(r1*t) + coeff(2)*exp(r2*t) ;
    plot (t, y) ;
    shg
end
if(c*c - 4*m*k == 0)
    r = -c/(2*m) ;

    % initial conditions
    M = [ 1 0; r 1];
    rhs = [y0; y1] ; 
    coeff = M\rhs ;

    % plot
    t = linspace(0,5) ;
    y = (coeff(1) + coeff(2)*t) * exp(r*t) ;
    plot(t,y)
    shg

end
if(c*c - 4*m*k < 0)
    a = -c/(2*m) ;
    b = sqrt(4*m*k - c*c) / (2*m) ;

    % solve for coefficients
    M = [1 0; a b] ;
    rhs = [y0; y1] ;
    coeff = M \ rhs ;

    % plot
    t = linspace( 0, 5) ;
    y = exp(a*t) .* (coeff(1).*cos(b*t) + coeff(2).*sin(b*t));
    plot(t,y);
    shg
end