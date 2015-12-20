%%Beckner, Anthony
%Math 261 - A: Fall 2013
%Lab 1

clear all
clc

%%Question 1.
%setting up variables
x = [8 8]'; y = [2 4]';
%trying out the semicolon
u = [3:9]';
%redoing u with the correct # of elements now that I know what it does
u = [3:3:9]';
%more variables
v = [2 7 13]';w = [400:400:1200]';
%ran your operations
u+v+w
12*x-7*y
u+(2*v+w)
0*u-(v-w)
%using differentvector sizes
'u*y'% this string doesn't work when the ' are removed

%%Question 2.
u.*v
sum(ans)
%or
u*v'
ans.*[1 0 0;0 1 0;0 0 1]%must be the identity vector
sum(sum(ans))
%or
u'*v %but not u*v' (see above)
%finally, also
dot(u,v)%found this one by asking google if there was a command

%%Question 3.
%norm(variable) gets the vectoral length; length(variable) determines the
%max column/row dimension
%For my vectors
norm(x);
norm(y);
norm(u);
norm(v);
norm(w);
%to create unit vectors we divide
e_x = x./(norm(x));
e_y = y./(norm(y));
e_u = u./(norm(u));
e_v = v./(norm(v));
e_w = w./(norm(w));

%%Question 4.
%finding the angles: unitvector(dot)unitvector=cos(theta)
%2d first
anglexy = acos(e_x'*e_y);
%3d next
angleuv = acos(e_u'*e_v);
anglevw = acos(e_v'*e_w);
anglewu = acos(e_w'*e_u);
%check for orthagonals (=0): none 

%%Question 5.
%creating matrix A from vectros u v w
A = [u v w];
%adding another element to x
x = [x;8];
%to get the linear combinations
z = A*x
%manual computation for the linear combinations checked with matlab's computation
if z(1) == (A(1,1) + A(1,2) + A(1,3)) .* x(1)
    disp('z(1) computed correctly')
end
if z(2) == (A(2,1) + A(2,2) + A(2,3)) .* x(2)
    disp('z(2) computed correctly')
end
if z(3) == (A(3,1) + A(3,2) + A(3,3)) .* x(3)
    disp('z(3) computed correctly')
end

%%Question 6.
%first clear x
clear x
%then define b
b = [405;813;1222]
%next divide the matrix
x = A\b;
%finally, set up an if staement to check
if b == A*x
    disp('the matrix division worked')
else 
    disp('the matrix division did not work')
end
%this does not work because A(1) [3;6;9] is proportional to A(3)
%[400;800;1200]

%%Question 7.
clear x
%create B
B = [1 2 3;2 4 6;3 6 9];
x = B\b
clear x
b = [0 0 0;0 0 0;0 0 0]
x = B\b
%neither works with a dependent matrix

%%Question 8.
%create the matrix
M=randi(9,3);
%eliminate row 2 and row 3 in column 1
p=M(1,1);
l=M(2,1)/p;
M(2,:)=M(2,:)-l*M(1,:)
l=M(3,1)/p;
M(3,:)=M(3,:)-l*M(1,:)
%eliminate row 3 in column 2
p=M(2,2);
l=M(3,2)/p;
M(3,:)=M(3,:)-l*M(2,:)

%%Question 9.
%Create vectors
C = randi(100,3,4); D = randi(100,2,3);
'C+D'%error message: matrix dimmensions must agree
'C*D'%error message: inner matrix dimensions must agree

%%Question 10.
%legal matrix multiplication
E = [0;1;2]*[1 2 3]
if E == [0 0 0;1 2 3;2 4 6]
    disp('matrix multiplication works like it does in the text')
else
    disp('matrix multiplication does not work like it does in the text')
end

%%Question 11.
%method one
transpose(u)
%methos two
u'
%check that they are the same
if transpose(u) == u'
    disp('the methods are equivalent')
else
    disp('the methods are not equivalent')
end

%%Question 12.

