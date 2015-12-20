%PV = nRT
P = input('what is the Pressure in atm?')
V = input('what is the Volume in L?')
n = input('what is the number of moles?')
R = .08206;
T = input('what is the Kelvin Temperature?')
if isnumeric(P) == 0
    P = (n*R*T)/V;
    fprintf('P = %.2f\n',P)
end
if isnumeric(V) == 0
    V = (n*R*T)/P;
    fprintf('V = %.2f\n',V)
end
if isnumeric(n) == 0
    n = (P*V)/(R*T);
    fprintf('n = %.2f\n',n)
end
if isnumeric(T) == 0
    T = (P*V)/(n*R);
    fprintf('T = %.2f\n',T)
end
