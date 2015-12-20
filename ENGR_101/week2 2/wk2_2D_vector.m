%% Accelerometer Module, Week 2 Lab Investigation

%% Overview
% This skeleton script connects MATLAB to the accelerometer, runs a
% calibration routine if needed, opens a new figure, and runs a loop that
% continually plots the x-component of the accelerometer. The accelerometer
% data is placed in the variables [gx gy gz]. 
%
% In today's lab, you will be holding the accelerometer like a steering 
% wheel, with the label facing towards you (i.e., the z-axis of the 
% accelerometer pointing out towards you). The goal today is to modify this
% script to:
%
%   1) Add the Y-component of the accelerometer to the plot window.
%   2) Add the resultant of the X and Y accelerometers to the plot window.
%   3) Set the figure title to update with the tilt angle when the
%   accelerometer is held like a steering wheel.

%% Ensure that the ENGR 101 Accelerometer Files are Available
% This is a small administrative command. This ensures that the required
% commands to interface with the accelerometer/balance board are all
% available.
path([getenv('home') '\Documents\MATLAB\Matlab_ENGR101'],path)

%% Initializing the Accelerometer
% We will save all of the information that MATLAB will use to interface
% with the accelerometer in a variable called 'accelerometer'. If this
% variable doesn't exist, then we haven't initialized the accelerometer
% yet. To initialize the accelerometer, we run the function
% 'setup_accel()'. This will setup the accelerometer to interface with the
% DAQ, and also calibrate it.

if ~exist('accelerometer','var')
    accelerometer = setup_accel();
end

%% Setting up the Figure Window
% The code here will setup the figure window we will use to plot the
% accelerometer's component vectors.

% If the figure window we're using is still open, close it and re-
% initialize it (see 'ishandle' for more information).
if exist('h','var') && ishandle(h)
    close(h)               
end

h = figure(1);
ax = axes('box','on');

%%
% This code here sets the x and y axis limits of the plot window. See the
% help page of 'axis' for more information.
limits = 2.5;
axis([-limits limits -limits limits])
axis square

%% Data Collection and Display
% To display the data in real time, we run a loop that continues as long as
% the figure window is open. In this loop, we pull the component data from
% the accelerometer, reset the values within plot window from the previous
% loop iteration, and plot the new component vectors,

while(ishandle(h))
    
    % Read new values from the accelerometer
    [gx gy gz] = accelerometer.read;

    % Clear the values from the previous run of the loop
    cla            
    
    % Plot the X acceleration vector
    line([0 gx], [0 0], 'Color', 'r', 'LineWidth', 2, 'Marker', 'o');
    
    % Plot the Y acceleration vector, and the resultant vector.
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%--- STUDENTS ADD CODE HERE ---%%%%
    
    
    
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    
    % Calculate the angle of the resultant acceleration vector and print
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    %%%%--- STUDENTS MODIFY CODE HERE ---%%%%
        
    theta = 1234;
    
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    
    % Update the title of the figure window
    title(['Accelerometer angle: ' num2str(theta, '%.0f')]);
    
    % Force MATLAB to display the new results.
    drawnow;
    
end

