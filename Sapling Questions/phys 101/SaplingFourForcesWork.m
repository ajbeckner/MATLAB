% to solve this we calculate Fnet then use mass to get acceleration and
% distance. Then F*d gives work
Fnorth = input('What is the northward force in N? \n');
Fsouth = input('What is the southward force in N? \n');
Feast = input('What is the eastward force in N? \n');
Fwest = input('What is the westward force in N? \n');
t = input('What is the time in seconds?\n');
m = input('What is the mass?');
Fx = abs(Feast - Fwest);
Fy = abs(Fnorth - Fsouth);
Fnet = sqrt(Fx^2 + Fy^2);
a = Fnet/m;
d = .5*a*t^2;
W = Fnet*d;
clc
fprintf('The total work is %.2f\n',W)
%P = W/t;
v = a*t;
fprintf('The Speed is %.2f.\n',v)

%enjoy,
%- A.J.