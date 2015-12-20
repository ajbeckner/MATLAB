qStart = 1*10^-6;
qFinish = 10*10^-6;
qInterval = 1*10^-6;
r = .10;%(rStart:rInterval:rFinish)';
k = 8.99*10^(9);
q = (qStart:qInterval:qFinish)';
F = k.*q.*q/(r*r);
