% FnetW = Fg - T = mW*aW
% FnetS = T - Ft = mS*aS
%therefore T = mS*aS + Ft = Fg - mW*aW
%and Fg = mS*aS + mW*aW + Ft;
% mW*g = a*(mS + mW + Ms)
%a = ( mW*g )/(mS + mW + Ms)
mS = input('What is the mass of the spool in g?')/1000;
mW = input('What is the mass of the weight in g?')/1000;
rS = input('What is the radius of the spool in cm?')/100;
I = .5*mS*rS*rS;
g = 9.81;
FgW = mW*g;

a = ( mW*g )/(mW + .5*mS);
T = abs(mW*a - mW*g);
fprintf('The acceleration is %.4f m/ss.\n',a)
fprintf('The Tension is %.4f N.\n',T)