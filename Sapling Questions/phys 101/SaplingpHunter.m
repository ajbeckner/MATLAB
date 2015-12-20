%first initialize variables
mElephant = input('What is the mass of the elephant in kg?');
vElephant = input('What is the speed of the elephant in m/s?');
pElephant = mElephant*vElephant;
fprintf('\n The elephant''s momentum is %.2f kg*m/s.',pElephant)
mDart = input('\n\n What is the mass of the dart in kg?');
vDart = input('What is the speed of the dart in m/s?');
pDart = mDart*vDart;
if pElephant > pDart
    fprintf('\n pElephant > pDart')
elseif pElephant < pDart
    fprintf('\n pElephant < pDart')
elseif pElephant == pDart
    fprintf('\n pElephant = pDart')
else
    fprintf('\n More information is needed to determine')
end
%assuming the hunter started from rest
%InitialNetp = phunter;
%therefore p after = running momentum and pHunter = pHunter-pDart
mHunter = input('\n\n What is the mass of the hunter in kg?');
vHunter = input('What is the velocity of the hunter in m/s?');
pHunter = mHunter*vHunter;
fprintf('\n The p of the hunter is %.2f kg*m.s.',pHunter);