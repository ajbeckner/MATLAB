function UndampedForcedPlot( m,k,F,omega,x0,x1)
%Created by Anthony Beckner section 262 B

%This solves mx'' + kx = Fcos(wt)
%first we do the homogeneous part of the solution
%mx'' + kx = 0
%guess x =e^(rt)
%mr^2 +k = 0
%therefore r = sqrt(-k/m)
r1 = sqrt(-k/m);
r2 = -sqrt(-k/m);
%check for real solution
%note: solutions should NOT be real
if isreal(r1) == 1 && isreal(r2) ==1
   %this code does not accept real solutions since k should not be negative
   %such solutions would go here
else 
    %for this case mu is represented as the natural frequency w0    
    omega0 = sqrt(k/m);
    %xh = C1cos(w0t) + C2sin(w0t)
    if omega ~= omega0 %first case
        %choose xp  = Acos(wt)
        %xp'' = Awwcos(wt)
        %A(k - mww) = F
        A = F/(k - m*omega*omega);
        %obtained by manipulating initial condition equations
        C1 = x0 - A;
        C2 = x1/omega0;
        
        %graph it
        t = linspace(0,500000000);
        x = C1*cos(omega*t) + C2*sin(omega*t) + A*cos(omega*t);
        plot(t,x)
        shg
        
    elseif omega == omega0      
        %         choose xp  = A*t*cos(w0t) + b*t*sin(w0t);
        %         xp'' = -Btw0^2sint(w0)-2Aw0sin(w0t) - Atw0^2cos(w0t) +
        %         2bw0cos(w0t)
        %set up matrix to solve for A and B
        t = 0;
        M = [-2*omega0 -t*omega0; -t*omega0^2 2*omega0]; 
        b = [0; F];
        Solutions = m\b;
        A = Solutions(1);
        B = Solutions(2);
        %x0 = C1*cos(w0t) + C2*sin(w0t) + t*A*cos(w0*t) + B*t*sin(w0*t)
        %x0 = C1
        C1 = x0;
        %x1 = btw0 + C2*w0 + A
        C2 = (x1 - A)/omega0;
        %graph
        t = linspace(0,500000000);
        x = C1.*cos(omega0*t) + C2.*sin(omega0*t) + A.*t.*cos(omega0*t) + B.*t.*sin(omega0*t);
        plot(t,x)
        shg
    end
end