t = [0;1;3;4];
b = [0;8;8;20];
temp = ones(4,1);
A = [temp t];
ATA = A'*A;
ATb = A'*b;
ATAt = ATA^-1;
xh = ATAt*ATb;
p = A*xh;
e = b - p
E = sum(e.^2)
AT = A'
%% problem 2

%% problem 3

%% rad{44}
