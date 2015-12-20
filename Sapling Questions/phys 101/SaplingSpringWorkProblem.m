% the work is given by F*changeX so it is the area under the graph
clear
clc
x1 = -.05;%input('What is x1?');
x2 = .0231;%input('What is x2?');
m = 6.68;%input('What is the mass?');
slope = 6/x1;%slope of line
F1 = slope*x1;
F2 = slope*x2;
W1 = x1*F1*.5;
W2 = x2*F2*.5;
Wtot = abs(W1) + W2
%%
%part 2: Speed
vf = sqrt(abs(2*Wtot/m))
vmax = sqrt(abs(2*W1/m))