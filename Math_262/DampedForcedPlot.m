function DampedForcedPlot(m, c, k, F, w, x0, x1)
% By Anthony J Beckner
% plots Damped and forced spring oscilations

%plots x(t) for mx'' + cx' + kx = F sin(wt) 

%first we find the nonhomogeneous solution (homogeneous cannot conflict)
%substitute these
p = c/(2*m); w0 = sqrt(k/m);
% by guessing Acos(wt) + Bsin(wt) and solving for A and B we get 
A = (2*F*p*w)/(-m*(w0^2 - w^2)^2 - (2*m*p*w^2));
B = (F*(w0^2 - w^2))/(-m*(w0^2 - w^2)^2 - (2*m*p*w^2));
%xp = A*cos(w*t) + B*sin(w*t)


%now we solve what we need for the homogeneous case
%there are three differnt cases depending on the determinant 
if c^2 > 4*k*m
    %choosing x = e^rt, we get characteristic equation
    %m*r^2 + c*r + k = 0
    r1 = -p + sqrt(p^2 - w0^2);
    r2 = -p - sqrt(p^2 - w0^2);
    
    %solve for initial conditions
    M = [1 1;r1 r2];
    b = [x0; x1];
    C = M\b;
    C1 = C(1);
    C2 = C(2);
    
    %plot
    t = linspace(0,30);
    x = C1.*exp(r1.*t) + C2.*t.*exp(r1.*t) + A.*cos(w.*t) + B.*sin(w.*t);
    plot(t,x)
    shg
elseif c^2 == 4*k*m
    %xh = C1*e^(-pt) + C2*t*e^(-pt) 
    %x = C1*e^(-p*t) + C2*t*e^(-p*t) + A*cos(w*t) + B*sin(w*t)
    
    %constants can be solved for directly one then the other
    C1 = x0 - A;
    C2 = x1 - B*w + C1*p;
    
    %plot
    t = linspace(0,30);
    x = C1.*exp(-p.*t) + C2.*t.*exp(-p.*t) + A.*cos(w.*t) + B.*sin(w.*t);
    plot(t,x)
    
    shg
elseif c^2 < 4*k*m
    %xh = C1*Cos(w*t)*exp(-p*t) + C1*sin(w*t)*exp(-p*t)
    
    %solve for initial conditions
    C1 = x0;
    C2 = C1*p + x1;
    
    %plot
    t = linspace(0,30);
    x = C1.*cos(w.*t).*exp(-p.*t) + C1.*sin(w.*t).*exp(-p.*t) + A.*cos(w.*t) + B.*sin(w.*t);
    plot(t,x)
    shg
end