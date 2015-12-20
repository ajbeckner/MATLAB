clear
clc
m = 32.3;%in kg
g = 9.8;%in m/s^2
W = m*g% in N
T2y = W;% in N
T2 = T2y/sind(32.2)
T2x = T2*cosd(32.2);
T1 = T2x