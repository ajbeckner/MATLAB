%Work in should result in change in PE
%which means a change in altitude that can bring it outside orbit
%The force required must oppose Fg
%Fg = (G*m1*m2)/(r^2)
%W= Pe = Fg h = (G*m1*m2)/(r)
m1 = 961%input('What is the mass of the satellite in kg?\n');
m2 = 5.98 * 10^24; %input('What is the mass of the earth in kg?\n');
G = 6.67 * 10^(-11);
r1 = 243%input('what is the altitude of the satellite in km?');
r1 = r1*1000;
r2 = 6.37*10^6; 
r = r1 + r2;
Fg = (G*m1*m2)/(r^2);
PE = Fg*r;
E = .5*PE;
clc
fprintf('The Work must exceed %d.\n',E)

%enjoy,
%- A.J.