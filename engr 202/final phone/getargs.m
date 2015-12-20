function [ v, angle ] = getargs( )
%connect to phone and get accel data
m = mobiledev;
m.AccelerationSensorEnabled = 1;
m.OrientationSensorEnabled = 1;
m.Logging = 1;

%initialize data for rolling plot
t = zeros(1,200);
GX = zeros(1,200);
GY = zeros(1,200);
GZ = zeros(1,200);
AZ = zeros(1,200);
PT = zeros(1,200);
RL = zeros(1,200);

prevSize = 1;
tic
while (toc < 5)%run for 30 secs
    
    %read from accel
    [a,time]= m.accellog;
    o = m.orientlog;
    %conditional prevents it from indexing an empty array the first couple
    %of times
    if(exist('a','var')&&~isempty(a))
        gx = a(:,1);
        gy = a(:,2);
        gz = a(:,3);
        %get newest coordinates
        newT = time(prevSize+1:length(a));
        newX = gx(prevSize+1:length(a));
        newY = gy(prevSize+1:length(a));
        newZ = gz(prevSize+1:length(a));

        %concatenate and pop oldest point off
        t = [t(length(newT)+1:length(t)) newT'];
        GX = [GX(length(newX)+1:length(GX)) newX'];
        GY = [GY(length(newY)+1:length(GY)) newY'];
        GZ = [GZ(length(newZ)+1:length(GZ)) newZ'];
        prevSize = length(a);
    end
    if(exist('o','var')&&~isempty(o))
        az = o(:,1);
        pt = o(:,2);
        rl = o(:,3);
        %get newest coordinates
        newAz = az(prevSize+1:length(o));
        newPt = pt(prevSize+1:length(o));
        newRl = rl(prevSize+1:length(o));

        %concatenate and pop oldest point off
        AZ = [AZ(length(newAz)+1:length(AZ)) newAz'];
        PT = [PT(length(newPt)+1:length(PT)) newPt'];
        RL = [RL(length(newRl)+1:length(RL)) newRl'];
        
    end
end

%get accel and time at peak
maxGY = max(GY);
for i = (1:length(GY))
    if GY(i) == max(GY)
        maxPos = i;
        break
    end
end
tmax = t(maxPos);

%get accel and time before peak
oPos = 5;
GYo = GY(oPos);
for i = (0:maxPos-1)
    n = maxPos-i;
    if GY(n) < 1 && GY(n) > 0
        GYo = GY(n);
        oPos = n;
        break
    end
end
to = t(oPos);

v = (maxGY - GYo)/(tmax - to);
angle = -atand(GY(oPos)/GX(oPos));
end

