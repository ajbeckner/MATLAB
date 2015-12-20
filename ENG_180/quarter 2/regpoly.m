function name = shape(nSides,color,l);
polarangles = (pi/nSides) *(1:2:(2*nSides - 1));

X = cos(polarangles);
Y = sin(polarangles);
X = X*X(1)*l;
Y = Y*Y(1)*l;

name = fill(X,Y,color);

end