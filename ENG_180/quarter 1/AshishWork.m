clc
close all
clear all
%% Question 1:
% Using a while loop to read the dataFile.txt. Counting the number of times
% the word "valid" and "corrupted" are repeated. Also, counting the number
% of lines presnet the text file. Finding the number of times a value is
% greater than the threshold value of 30.7 and incrementing the respective
% counter. Calculating the mean and std of the numbers present in the file
% and also ploting the numbers.
fprintf('Question 1')

% Declaring variables needed.
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;
currentValueString = '';
tempCurrentValueString = '';
tempCount = 0;

% opening the dataFile.txt and cycling through it to perform required
% functions.
fileid = fopen('dataFile.txt');
while('true')
    line = fgetl(fileid);
    if (ischar(line) == 0)
        break;
    end
    count1 = count1+1;
    count2 = count2+numel(strfind(line,'valid'));
    count3 = count3+numel(strfind(line,'corrupted'));       
    tempCurrentValueString = regexp(line,'\s','split');
    currentValueString = regexp(tempCurrentValueString(1,1),'-','split');
    numberValue = str2double(currentValueString{1,1});
    plot(numberValue,'b-')
    hold on;
    grid on;
    for c=1:(length(numberValue))
        newNumberValues = numberValue(c);
        if (numberValue(c) > 30.7)
            count4 = count4 + 1;
        end
    end
end

% Calculating the mean and std of the numbers.
meanOfNumbers = mean(numberValue);
stdOfNumbers = std(numberValue);

% Printing the values as specified and ploting the graph.
fprintf('\nTotal number of lines : %d  ',count1);
fprintf('\nNumber of valid lines : %d  ',count2);
fprintf('\nNumber of corrupted lines : %d  ',count3);
fprintf('\nNumber of numbers greater than the threshold : %d  ',count4);
fprintf('\nMean of all the data : %f  ',meanOfNumbers);
fprintf('\nStd dev of all the data : %f ',stdOfNumbers);
hold on;
xlabel('Index of Values');
ylabel('Value of numbers');
title('Valid Lines of the dataFile.txt plotted');

% Closing the dataFile.txt.
fclose(fileid);


%% Question 2:
% Opening the keyData.txt using the while loop and calculating the
% timeStamp value of the midi On/Off message along with calculating the
% time stamp and position value of the key position message. When it's a
% message that's neither, displaying a warning message. Calculating the
% velocity of the key position when the position value is 0.75.
fprintf('\n\n');
fprintf('\nQuestion 2\n');

% Declaring the variables needed.
lineCount = 1;
midiOn = 0;
midiOff = 0;
numberTemp = 0;
positionArray = [];
timeArray = [];
midiOnArray = [];
midiOffArray = [];
line2 = {0 0 0 0 0};
line3 = {0 0 0 0 0};
position1 = 0;
position2 = 0;
time1 = 0;
time2 = 0;
calculatedVelocity = 0;

% Opening the keyData.txt to cycle through and perform the specified
% functions.
fid = fopen('keyData.txt');
while('true')
    newLine = fgetl(fid);
    if (ischar(newLine) == 0)
        break;
    end
    midiLines = regexp(newLine,'/keylog/midi');
    oscpLines = regexp(newLine,'/keylog/oscp');
    
    % If the value of "numberTemp" equals zero, the MIDI note is On, else
    % the Midi note is off.
    if (length(midiLines) == 1)
        tempString = regexp(newLine,'\s','split');
        newTemp = {tempString{1:end}};
        numberTemp = str2double(newTemp{1,4}); 
        actualValue = str2double(newTemp{1,5});
        if(numberTemp == 0)
            fprintf('\nThe MIDI note ON time stamp is --> %f\n',actualValue);
            midiOnArray = cat(2,midiOnArray,actualValue);
        else
            fprintf('The MIDI note OFF time stamp is --> %f \n',actualValue);
            midiOffAray = cat(2,midiOffArray,actualValue);
        end
        
    % Records the position and timeStamp values of the keyPosition message
    % using the "cat function."    
    elseif (length(oscpLines) == 1)
       tempString2 = regexp(newLine,'\s','split');
       newTemp2 = {tempString2{1:end}};
       numberTempPosition = str2double(newTemp2{1,4});
       numberTempTimeStamp = str2double(newTemp2{1,5});
       fprintf('\nThe position value of the key position message are --> %f ',numberTempPosition);
       fprintf('\nThe TimeStamp values of the key position message are --> %f ',numberTempTimeStamp);
       positionArray = cat(2,positionArray,numberTempPosition);
       timeArray = cat(2,timeArray,numberTempTimeStamp);
    
    % Displaying a warning sign when the message is neither that of a MIDI 
    % or oscp.
    else
        tempString3 = regexp(newLine,'\s','split');
        newTemp3 = {tempString3{1:end}};
        tempPath = newTemp3{1,1};
        fprintf('\n\nWarning (line %d): unhandled OSC path <%s> \n\n',lineCount,tempPath);
    end
    lineCount = lineCount + 1;
    
    % Calculates the new velocity based on the the timeStamp and velocity
    % values of the line before and after the line that has a position
    % value equal to 0.75.
    if(length(oscpLines) == 1)
        tempString3 = regexp(newLine,'\s','split');
        newTemp3 = {tempString3{1:end}};
        position1 = str2double(newTemp3{1,4});
        time1 = str2double(newTemp3{1,5});
        numberTempLine2 = str2double(line2{1,4});
        if (numberTempLine2 == 0.75)
            position2 = str2double(line3{1,4});
            time2 = str2double(line3{1,5});
            calculatedVelocity = (position2 - position1)/(time2 - time1);
            fprintf('\n\nThe calculated velocity value is --> %f \n\n',calculatedVelocity);
        end
        line3 = line2;
        line2 = newTemp3;
    end
end

% Calculating the minPosition and maxPosition of the timeStamp values.
minPosition = min(timeArray);
maxPosition = max(timeArray);

% Plotting the graph, along with lines for the min, max and 0.75 place
% values. 
figure(2);
axis([0, 3, 0, 1]); 
hold on;
plot(timeArray,positionArray,'b-');
plot([minPosition minPosition], [0 1], 'r-' );
plot([maxPosition maxPosition], [0 1], 'k-' );
plot([time2 time2], [0 1], 'k--')
hold on;
legend('position','Start Time','End Time','Position');
title('Key Position vs Time');
xlabel('Time (in Seconds)');
ylabel('Position');