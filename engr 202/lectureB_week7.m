%% Close Serial
closeSerial
%% Initialize
clear
close all
clc

%% Open and Calibrate

comPort='/dev/tty.usbmodem1421';
[accelerometer.s,flag]=setupSerial(comPort);
calCo=calibrate(accelerometer.s);

%% Define variables
buffer=200; %Set buffer length
t_vect=zeros(1,buffer); % Vector for times
gxOrig_vect=zeros(1,buffer); % Vector for gx values
jx_vect = zeros(1,buffer);
gx_vect=zeros(1,buffer); % Vector for gx values
vx_vect=zeros(1,buffer); % Vector for x velocities
x_vect = zeros(1,buffer);
atan_vect = zeros(1,buffer);
amult_vect = zeros(1,buffer);
% subplot(6,1,1) % setting up plots
% PgxOrig=plot(t_vect,gxOrig_vect);
% title('original Acceleration')
% xlabel('Time (s)')
% ylabel('gx(t)')
% ylim([-1 1])
% 
% subplot(6,1,2) 
% Pjx=plot(t_vect,jx_vect);
% title('x-jerk')
% xlabel('Time (s)')
% ylabel('j(t)')
% ylim([-100 100])

subplot(4,1,1) 
Pgx=plot(t_vect,gx_vect);
title('x-Acceleration')
xlabel('Time (s)')
ylabel('A_x(t)')
ylim([-1 1])

subplot(4,1,2)
Pvx=plot(t_vect,atan_vect);
title('angle (arctan)')
xlabel('Time (s)')
ylabel('V_x(t)')
ylim([-100 100])

subplot(4,1,3)
Px = plot(t_vect,amult_vect);
title('Angle (90*gy)')
xlabel('Time (s)')
ylabel('S_x(t)')
ylim([-100 100]);

subplot(4,1,4) 
Ppos=plot(0,0,'og');
title('x')
xlabel('x-Position')
ylabel('y-Position')
xlim([-100 100])
ylim([-100 100])


%% Read, Calculate Velocity
tnow = 0;
gxnowOrig = 0;
jxnow = 0;
gxnow = 0;
vxnow = 0;
xnow = 0;

tic % start timer
while (true )
    [gxnow, gy, gz]=readAcc(accelerometer,calCo) ;

    tnow = toc; % time of measurement
    delta_t=tnow-t_vect(end); % width of trapazoid
    
%     avg_height_gxOrig=(gxnowOrig+gxOrig_vect(end))/2; % average height of trapazoid
%     area_trap_gxOrig=avg_height_gxOrig/delta_t; % area of trapazoid    
%     jxnow=jx_vect(end)+area_trap_gxOrig; % add area to previous area
%     
%     avg_height_jx=(jxnow+jx_vect(end))/2; % average height of trapazoid
%     area_trap_jx=delta_t*avg_height_jx; % area of trapazoid    
%     gxnow=gx_vect(end)+area_trap_jx; % add area to previous area
    
    avg_height_gx=(gxnow+gx_vect(end))/2; % average height of trapazoid
    area_trap_gx=delta_t*avg_height_gx; % area of trapazoid    
    vxnow=vx_vect(end)+area_trap_gx; % add area to previous area
    
    avg_height_vx=(vxnow+vx_vect(end))/2; % average height of trapazoid
    area_trap_vx=delta_t*avg_height_vx; % area of trapazoid
    xnow=x_vect(end)+area_trap_vx; % add area to previous area

    atannow = atand(gy/gz);
    amultnow = gy*90;
    
     t_vect=[ t_vect(2:end)  tnow]; % rolling time vector
    gxOrig_vect=[gxOrig_vect(2:end) gxnowOrig];
    jx_vect=[jx_vect(2:end) jxnow];
    gx_vect=[gx_vect(2:end) gxnow]; % Rolling gx vector
    vx_vect=[vx_vect(2:end) vxnow]; % rolling velocity vector
     x_vect=[ x_vect(2:end)  xnow]; % rolling pos vector
     atan_vect=[atan_vect(2:end) atannow];
     amult_vect=[amult_vect(2:end) amultnow];
     
    %set(PgxOrig,'ydata',gxOrig_vect,'xdata',t_vect);
    %set(Pjx,'ydata',jx_vect,'xdata',t_vect);
    set(Pgx,'ydata',gx_vect,'xdata',t_vect);
    set(Pvx,'ydata',atan_vect,'xdata',t_vect);
    set(Px,'ydata',amult_vect,'xdata',t_vect);
    set(Ppos,'xData',xnow);
    drawnow

end
%% Data Analysis
% 
% figure(2)
% hist(gx_vect) % histogram of gx data
% xlabel('Gx Value')
% ylabel('Counts')
% 
% Avg=mean(gx_vect) 
% StDev=std(gx_vect)
% 
% Outliers=length(gx_vect(gx_vect>(Avg+2*StDev)))+...
%     length(gx_vect(gx_vect<(Avg-2*StDev))) %number of points more than 2 standard deviations from the mean
% 
% 
