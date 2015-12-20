%% Initialize
% Group 6 - Anthony Beckner, Megan Begley, Cory Klawunn
clear
close all
clc


%% Setup the serial connection
%section calls function that connects accelaerometer to comport through
%string path; sets flag = 1 for connected

comPort='/dev/tty.usbmodem1421';
[accelerometer.s,flag]=setupSerial(comPort);


%% Calibrate Sensor
%section calls function to calibrate accelerometer 
calCo=calibrate(accelerometer.s);

%% part a
%section uses while loop and tictoc to show complete vector representation
%of sampled accelerometer data

%starts timer
tic;
while(toc < 10)%while loop ends when timer reaches 10
    
    %starts sampling data and saving 3 components
    [gx, gy, gz]=readAcc(accelerometer,calCo);
    cla %Slow way of replotting
    
    %plots four lines using component data; 3 component lines plus
    %composite line
    line([0 gx],[0 0],[0 0],'Linewidth',2,'Color','r')
    line([0 0],[0 gy], [0 0],'Linewidth',2,'Color','g')
    line([0 0],[0 0], [0 gz],'Linewidth',2,'Color','b')
    line([0 gx],[0 gy], [0 gz],'Linewidth',2,'Color','k')
  
    %set axes in 3D and forces redraw for smooth animation and set titles
    %for both graphs
    axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]);
    title('Complete Vector Representation')
    drawnow;
end

%% Rolling Plot demo
% section uses while loop to create rolling plot of magnitude data for 10
% seconds using 50 points

%first sets of points initilized as pseudorandom instead of 0 for smoother
%animation; 3 component datasets and 1 composite
GX = rand(1,50);
GY = rand(1,50);
GZ = rand(1,50);
GT = sqrt(GX.^2 + GY.^2 + GZ.^2);

%plot first datasets before while loop
plot(GX,'r');
hold on
plot(GY,'g');
plot(GZ,'b');
plot(GT,'k');

%starts timer
tic;
while(toc < 10)%loop ends when timer reaches 10
    
    %start reading accelerometer data
    [gx, gy, gz]=readAcc(accelerometer,calCo);
    cla%slow way of redrawing
    
    %replot data with hold
    hold on
    plot(GX,'r');
    plot(GY,'g');
    plot(GZ,'b');
    plot(GT,'k');
    
    %shift datasets by one, adding new sampled data
    GX = [GX(2:end) gx];
    GY = [GY(2:end) gy];
    GZ = [GZ(2:end) gz];
    GT = sqrt(GX.^2 + GY.^2 + GZ.^2);
    
    %force redraw for smooth animation
    xlabel('Domain')
    ylabel('Magnitude')
    title('Complete Magnitude Representation')
    drawnow
end

%% Close the Serial Port
%make sure serisl port is safely closed
closeSerial


