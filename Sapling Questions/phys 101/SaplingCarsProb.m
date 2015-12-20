%for max breaking distance at speed = 55\\
%we need lowest acceleration\\
%a = F/m : min f, max m
%a = FFriction/mass 
%a = mu*m*g / m
clear
clc
v = input('what is the velocity in mph?')
v = v*1.46666666;%miles per hour to feet per second
g = 32.2;%feet per second squared
muMin = input('What is the largest coefficient of friction?'); 
aMin = muMin*g;
%vf2 = vi2 + 2ad
MinimumDistance = (-v^2)/(2*aMin)
muMax = input('What is the smallest coefficient of friction?');
aMax = muMax*g;
MaximumDistance = (-v^2)/(2*aMax)
dNew = 155; %d in feet
NewSpeedLimit = ((2*aMax*dNew)^(1/2))/1.46666666