%t = d/v
%solve for ball one
clear all;clc
d1 = input('distance for ball one in m:');
vBelt = input('speed of conveyor belt:');
w1 = input('angular speed ball 1:');
r1 = input('radius ball 1: in cm;')/100;
v1 = r1*w1 + vBelt;
t1 = d1/v1;

%second ball
d2 = input('distance for ball 2 in m:');
w2 = input('angular speed ball 2:');
r2 = input('radius ball 2: in cm;')/100;
v2 = r2*w2;
t2 = d2/v2;

if t1 > t2
newt = t2;
newv = d1/newt;
neww = (newv - vbelt)/r1;
elseif t2 > t1   
newt = t1;
newv = d2/newt;
neww = newv/r2;
end
clc
fprintf('The time for 1 is %.3f.\n',t1)
fprintf('The time for 2 is %.3f.\n',t2)
fprintf('The new w must be %.3f.\n',neww)