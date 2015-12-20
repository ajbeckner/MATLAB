clear all; close all;clc
fprintf('\n This script models a mass-spring system \n with mass m, spring constant k, dampening \n constant c, forcing constant F, and \n frequency constant w.\n')

reply = input('[Continue]');
clear reply
%%
clc
fprintf('\n A mass-spring system consists of a\n weighted block connected to a spring.\n When a force is applied, the spring\n dampens the motion and the mass oscilates.\n')

reply = input('[Continue]');
clear reply
%%
clc
fprintf('\n This oscilatory motion can be modeled by\n the second order differential equation:\n mx'''' + cx'' + kx = Fcos(wt) with the\n following constants:\n m -- mass of the block \n c -- dampening constant (friction) \n k -- spring constant \n F -- amplitude of Force \n w -- frequency of force \n')

reply = input('[Continue]');
clear reply
%%
clc
fprintf('\n m, c, and k are all properties of the\n system. F and w are properties of the\n force being applied. They simulate a\n periodic force such as an earthquake.\n')

reply = input('[Continue]');
clear reply
%%
clc
fprintf('\n For each m and k, there exists a\n natural frquency w0 = sqrt(k/m).\n When the system oscilates at w0\n and c = 0, the oscilation increases\n exponentially.This is what is known\n as harmonic motion.\n')

reply = input('[Continue]');
clear reply
%%
clc
fprintf('\n By carefully choosing different combinations\n of m,c,k,F,w we can create many different\n and interesting spring motions.\n')

reply = input('[Continue]');
clear reply
%%
clc




