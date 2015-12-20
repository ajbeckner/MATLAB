% Beckner, Anthony
% Math 261 ­ A : Fall 2013
% Lab 4
clear all
clc

%% Problem 1
load('MATH261LAB4DATA.mat');

%% Problem 2
scatter(T,P,'m','^');

%% Problem 3
%since P = C1*T +c2 we can get [T+1]*(c1,c2)
%first we create A
temp = ones(50,1);
A = [T temp];
% then we solve for ATA and ATP
ATA = A'*A;
ATP = A'*P;
%now we can find c
c = ATA\ATP;

%% Problem 4
%now we want to plot the line of best fit
%first we must get the x and y values for plot()
x = (min(T)-2:max(T)+2);
y = c(1)*x + c(2);
%then we plug them in first holding the graph from before
hold on
plot(x,y,'b-');

%% Problem 5
figure(1)
hold on
title('Pressure v.s. Temperature');
ylabel('Pressure(kPa)')
xlabel('Temperature(Celcius)')
scatter(T,P,'m','^')
plot(x,y,'b-')
legend('measured values', 'best fit line')

