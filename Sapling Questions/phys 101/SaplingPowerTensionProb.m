clear
clc
T = ;
phi = 42;
Ty = T*cosd(phi)
v = 6.3;
PT = Ty*v
%%
m = .331;
g = 9.81;
Fg = m*g
Fn = Fg - T*sind(phi)
mu = .624;
Ff = mu*Fn
Pf = -Ff*v
if Ty - Ff > 0
    fprintf('the velocity is increasing')
end
if Ty - Ff == 0
    fprintf('the velocity is constant')
end
if Ty - Ff < 0
    fprintf('the velocity is decreasing')
end
