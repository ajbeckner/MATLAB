clear all
clc
P1 = input('P1 is');
P2 = input('P2 is');
V1 = input('V1 is');
V2 = input('V2 is');
T1 = input('T1 is');
T2 = input('T2 is');
n1 = input('n1 is');
n2 = input('n2 is');
if isnumeric(P1) == 0
    P1 = (P2*V2*T1*n1)/(T2*n2*V1);
    fprintf('P1 is %.2f',P1)
end
if isnumeric(P2) == 0
    P2 = (P1*V1*T2*n2)/(T1*n1*V2);
    fprintf('P2 is %.2f',P2)
end
if isnumeric(V1) == 0
    V1 = (P2*V2*T1*n1)/(T2*n2*P1);
    fprintf('V1 is %.2f',V1)
end
if isnumeric(V2) == 0
    V2 = (P1*V1*T2*n2)/(T1*n1*P2);
    fprintf('V2 is %.2f',V2)
end
if isnumeric(T1) == 0
    T1 = (P1*V1*T2*n2)/(P2*V2*n1);
    fprintf('T1 is %.2f',T1*n1)
end
if isnumeric(T2) == 0
    T2 = (P2*V2*T1*n1)/(P1*V1*n2);
    fprintf('T2 is %.2f',T2)
end
if isnumeric(n1) == 0
    n1 = (P1*V1*T2*n2)/(P2*V2*T1);
    fprintf('n1 is %.2f',n1)
end
if isnumeric(n2) == 0
    n2 = (P2*V2*T1*n1)/(P1*V1*T2);
    fprintf('n2 is %.2f',n2)
end
%P1V1/n1T1 = P2V2/n2T2
fprintf('\n')