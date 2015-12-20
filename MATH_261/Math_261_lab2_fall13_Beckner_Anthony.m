%Beckner, Anthony
%Math 261 - A: Fall 2013
%Lab 2

%% Problem 1
%create matrix
A = [2 4 4 0; 4 8 -4 12; -2 -4 4 8]
%create subspaces and solutions
b1 = [6;12;-4];
x1 = A\b1;
b2 = [0;2;4];
x2 = A\b2;
b3 = [1;-1;1];
x3 = A\b3;
%check solutions
check1 = A*x1 - b1;
check2 = A*x2 - b2;
check3 = A*x3 - b3; 
%checks are approx 0
%no warning appeared

%% Problem 2
%create new right side
b = [1;6;1];
x = A\b;
%try check
checkx = A*x;
%results are b exactly
%no error message here either
% x must be correct solution and b must be in C(A)

%% Problem 3
R = rref(A)
%also accomplished this by hand

%% Problem 4
% the pivot columns are cloumns 1, 3, and 4
% free column 2 is twice pivot column 1 
% columns 3 and 4 are independant. 1 and 2 are dependant upon each other.
% A must be all 3d space because it consists of three distinct vectors

%% Problem 5
syms x1 x2 x3 x4
%x1, x3, and x4 are pivot variables; %x2 is free

%% Problem 6
x1 = x2/2; x3 = x2/-2; x4 = -2*x2
x = [x1;x2;x3;x4]
Na = A*x
%% Problem 7
syms u v
x = x2*u + x4*v

%% Problem 8
r = 3
% no warnings showed up earlier 
%% Problem 9
% the value of the rank is the number of dimensions A has geometrically 
% (I feel like there should be more to this problem. Did I miss something?)

