Lp = 71.5;
c = 3*10^8;
v = .53*c;
t = (Lp/v);
k = v/c;

y = 1/sqrt(1 - k^2);

tp = t/y;


%%
vo = .881*c;

LA = Lp/y
LB = -Lp/y
uA = LA/tp
uB = LB/tp
vA = vo - v
vB = vo + v

u2A = (uA - vA)/(1 - uA*vA/c^2)
u2B = (uB - vB)/(1 - uB*vB/c^2)

t2B = LB*10^9/u2B
t2A = LA*10^9/u2A

% k2 = v2/c;
% y2 = 1/sqrt(1 - k2^2);
% =
% t2 = t*10^9 / y2;

