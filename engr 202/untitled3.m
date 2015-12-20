%connect to phone and get accel data
connector on
clear all; close all; clc
m = mobiledev;
m.AccelerationSensorEnabled = 1;
m.Logging = 1;

%initialize data for rolling plot
GX = zeros(1,200);
GY = zeros(1,200);
GZ = zeros(1,200);

prevSize = 1;
tic
while (toc < 30)%run for 30 secs
    
    %read from accel
    a = m.accellog;
    %conditional prevents it from indexing an empty array the first couple
    %of times
    if(exist('a','var')&&~isempty(a))
        gx = a(:,1);
        gy = a(:,2);
        gz = a(:,3);
        %get newest coordinates
        newX = gx(prevSize+1:length(a));
        newY = gy(prevSize+1:length(a));
        newZ = gz(prevSize+1:length(a));

        %concatenate and pop oldest point off
        GX = [GX(length(newX)+1:length(GX)) newX'];
        GY = [GY(length(newY)+1:length(GY)) newY'];
        GZ = [GZ(length(newZ)+1:length(GZ)) newZ'];
        cla
        %draw plot with set axes
        %plot(GX);
        hold on
        plot(GY);
        %plot(GZ);
        
        axis([0 200 -15 15]);
        drawnow
       
        prevSize = length(a);
    end
end
clear all;
close all;