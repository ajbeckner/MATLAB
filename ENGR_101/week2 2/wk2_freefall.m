%% Accelerometer Module, Week 2 Lab Investigation, Free Fall Detector

%% Overview
% This skeleton script connects MATLAB to the accelerometer and sets up a
% figure window for plotting data. The magnitude of all three of the 
% accelerometer's axes is shown. When received, new values are placed on
% the right end of the plot and old values are shifted off of the left end.
%
% You should be able to modify this code to use the magnitude data and
% setup a free fall detector. When the device is in free fall, you should
% alert the user by display a message or producing a sound.
%% Ensure that the ENGR 101 Accelerometer Files are Available
% This is a small administrative command. This ensures that the required
% commands to interface with the accelerometer/balance board are all
% available.
path([getenv('home') '\Documents\MATLAB\Matlab_ENGR101'],path)

%% Initializing the Accelerometer and the Figure window
% Same as the previous script. See that file for more information.
if ~exist('accelerometer','var')
    accelerometer = setup_accel();
end

if exist('h','var') && ishandle(h)
    close(h)               
end

h = figure(1);


%% Data Collection and Display
% The rolling plot runs by creating an array of 300 values (initially as
% zeros). We plot that array, then we update it by appending it with the 
% a new reading from the accelerometer. To maintain the size of 300 values,
% the first value in the array is removed.


% ----- These variables are all used to initialize the rolling plot -----
buf_len = 300;
magdata = zeros(buf_len,1);
index = 1:buf_len;
% -----------------------------------------------------------------------

% Save the threshold in memory which will be used to detect the free fall.
%%%%---%%%%---%%%%---%%%%---%%%%---%%%
%%%%--- STUDENTS ADD CODE HERE ---%%%%    

%%%%---%%%%---%%%%---%%%%---%%%%---%%%
%%%%---%%%%---%%%%---%%%%---%%%%---%%%

% While the figure window is open.
while(ishandle(h))
    
    % Get the new values from the accelerometer
    [gx gy gz] = accelerometer.read;

    % Calculate the magnitude of the accelerometer axis readings
    mag = sqrt(gx^2 + gy^2 + gz^2);
    
    % Append the new reading to the end of the rolling plot data. Drop the
    % first value.
    magdata = [magdata(2:end) ; mag];
 
    % Determine if we're in free fall by performing a threshold test.
    % Dispaly a message or play a sound.
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%--- STUDENTS ADD CODE HERE ---%%%%    
    
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    
    % Update the rolling plot.
    plot(index,magdata)
    axis([1 buf_len 0 4]);

    % Display the threshold on the plot
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%--- STUDENTS ADD CODE HERE ---%%%%    
    
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    
    drawnow;
      
end
