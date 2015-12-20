function  rotationTest
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

polarangles = (pi/4) *(1:2:(2*4 - 1));
X = cos(polarangles);
Y = sin(polarangles);
square = [X*X(1)*3;Y*Y(1)*3];

figure
xmin = -5;
xmax = 5;
ymin = -5;
ymax = 5;
axis equal
axis([xmin xmax ymin ymax])
grid on
hold on

for i = 0:500
    


beta = (i/500)*2*pi
rotationFactorX = [cos(beta), -sin(beta)];
rotationFactorY = [sin(beta), cos(beta)];
triCartesianRotation1 = [rotationFactorX*square; rotationFactorY*square];
x = fill(triCartesianRotation1 (1, :), triCartesianRotation1 (2, :), 'y');

pause(.0001);
delete(x)
end

