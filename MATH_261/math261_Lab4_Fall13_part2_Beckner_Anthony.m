% Beckner, Anthony
% Math 261 ­ A : Fall 2013
% Lab 4
clear all
clc

%% Part 2 %%
%%%%%%%%%%%%
%THIS FIRST SECTION IS LINES OF CODE FROM PART ONE, 
%NEEDED TO RUN PART TWO
%%%%%%%%%%%%
load('MATH261LAB4DATA.mat');
temp = ones(50,1);
A = [T temp];
ATA = A'*A;
ATP = A'*P;
c = ATA\ATP;
%%%%%%%%%%%%
%%%%%%%%%%%%
%% Problem 1
test = A\P;
% the \ operater sucessfully calculated c (x hat), just like we did
% manually before

%% Problem 2
fit = polyfit(T,P,1);
% the results are the same again
%polyfit formats the data with T and P

%% Problem 3
val(2) = polyval(c,0);
val(1) = polyval(c,1) - polyval(c,0);

%polyval formats the data using c (x hat) instead of T and P

%% Problem 4

figure(2)
title('X versus Y')
xlabel('X')
ylabel('yData')
hold on
scatter(X,Y,'gs')
f = polyfit(X,Y,5);
yData = f(1)*X.^5+f(2)*X.^4+f(3)*X.^3+f(4)*X.^2+f(5)*X.^1+f(6)*X.^0;
plot(X,yData,'b-')
legend('scatterplot of X and Y','best fit line')