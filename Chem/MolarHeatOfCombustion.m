%% part one molar heat of combustion

mW = 1130;
cW = 4.18;
T2 = 28.40;
T1 = 25.60;
DT = T2 - T1;
qW = mW*cW*DT;
g2 = -.821;
gmol = (12*6)+(1*10)+(4*16);
moles = g2/gmol;
DH = molDH*moles*1000;
qC = DH - qW
CC = qC/DT

%% Part two
mW = 80.13;
cW = 4.184;
CC = 1.54;
mT = 19.75;
cT = .523;
tr = (mW*cW+CC)/(mT*cT)
tW = 20.59;
tT = 97.56;
tf = (tr*tW+tT)/(1+tr)

%% Part 3
mW = 107.7;
mS = 3.57;
cW = 4.184;
CC = 1.68;
Ti = 25.76;
Tf = 22.62;
dT = Ti - Tf;
qS = (mW + mS)*cW*dT;
qC = CC*dT;
qR = qS + qC
g = 3.57;
gmol = (39+35.5+64);
moles = g/gmol;
qrPmol = qR/(moles*1000)