%% Question 1 - Analyzing Datafile.txt
%% section sets up variables needed for the code
close all
clear all
clc
validCount = 0;%sets count of valid lines
thresholdCount = 0;%sets count numbers above threshold
dataFileArray = {};%cell array to hold each line of the text
numbersVector = [];%to store all numeric data for computations.
numbersMatrix = [];%to store all numeric data for graphing.

%% section opens file and creates array in Matlab
fid = fopen('dataFile.txt');%opens file
nextLine = fgetl(fid); %Gets first line here.
linNum = 1;
while ischar(nextLine)%operates for all text lines of file until -1
    dataFileArray{linNum,1} = nextLine;%puts line as string in array
    linNum = linNum +1;
    nextLine = fgetl(fid);%gets next line when called.
end
fclose(fid);clear fid;clear nextLine;clear linNum%closes file

%% section for loop populates
for i = 1:length(dataFileArray)%goes through array and enables index i
    
    dataFileArray{i} = regexp(dataFileArray{i},'\s+','split');%splits into text and numbers
    numbers{i,1} = dataFileArray{i}{1};%puts number column in one array
    validity{i,1} = dataFileArray{i}{2};%puts text in a cell array
  
    numbers{i,1} = regexp(numbers{i,1},'-+','split');%further splits number array
    
    for j = 1:length(numbers{i,1})%indexes into numbers
        numbersVector = [numbersVector str2num(numbers{i}{j})];%creates different datatype for math
        if str2double(numbers{i}{j}) > 30.7%checks value at threshold
            thresholdCount = thresholdCount +1;%counts threshold
        end
    end   
    
    if strcmp(validity{i},'valid') == 1 %checks validity
        validCount = validCount +1;%counts the valid lines
        for j = 1:length(numbers{i,1})%indexes into numbers
        numbersMatrix(1,j) = str2num(numbers{i}{j});%converts to double
            figure(1)
            plot(numbersMatrix(1,:),'b-')%plots numbers based on valid lines
            hold on %retains plot
        end
    end 
end
figure(1)
title 'numbers graph'
xlabel 'position in matrix'
ylabel 'value'
%% section formats data from for loop
totalLines = length(dataFileArray);
corruptedLines = totalLines - validCount;
numbersAverage = mean(numbersVector);
stdNumbers = std(numbersVector);

%% section formats information to be presented
fprintf('Total number of lines: %d\n',totalLines)
fprintf('Number of valid lines: %d\n',validCount)
fprintf('Number of corrupt lines: %d\n',corruptedLines)
fprintf('Number of numbers greater than the threshold: %d\n',thresholdCount)
fprintf('mean of all the data: %.2f\n',numbersAverage)
fprintf('Std dev of all the data: %.2f\n',stdNumbers)

%% Problem 2 

%open file
FID = fopen('keyData.txt');
line = fgetl(FID);

%initialize arrays
positionArray = [ ];
timeArray = [ ];
timeStampMidiOn = [ ];
timeStampMidiOff = [ ];
timeStampOSCP = [ ];
positionOSCP = [ ];
lineNum = 1;%sets number of lines for the count
prevLine = { };

%while loop manipulates data
while ischar(line)
    split = regexp(line,'\s*','split');%splits lines to acces individual elements
    splitOld = regexp(prevLine,'\s*','split');%for previous data
     if regexp(line,'^/keylog/midi') == 1 %checks for directory
        if str2double(split{4})== 0 %verifies off/on
            timeStampMidiOff = [timeStampMidiOff str2double(split{5})];%stores data
        elseif str2double(split{4})~= 0%verifies off/on
            timeStampMidiOn = [timeStampMidiOn str2double(split{5})];%stores data
        end
     elseif regexp(line,'^/keylog/oscp') == 1 %looks for other directory
         splitrow = {split{1:end}};
       positionOSCP = str2double(splitrow{1,4});%next two lines gather data into rows
       timeStampOSCP = str2double(splitrow{1,5});
       positionArray = cat(2,positionArray,positionOSCP);%next two lines set up array
       timeArray = cat(2,timeArray,timeStampOSCP);
     else
         fprintf('Warning (line # %d): unhandled OSC path %s \n',lineNum,split{1})%formats data for printing
     end
     if length(split) == 5
        if str2double(split{4}) == 0.75%if statement gets pos and time values at .75
            pos1 = str2double(split{4});
            pos2 = str2double(splitOld{4});
            t1 = str2double(split{5});
            t2 = str2double(splitOld{5});         
            Velocity = (pos2 - pos1)/(t2 - t1);%calculates velocity
        end
     end
     prevLine = line;%stores previous line from text
     line = fgetl(FID);%gets next line
     lineNum = lineNum + 1;%counts lines
    
end

minPosition = min(timeArray);%two lines find min and max
maxPosition = max(timeArray);
 
%% section plots data on graph
figure(2);%calls figure
axis([0, 3, 0, 1]); 
hold on;%keeps grpah
plot(timeArray,positionArray,'b-');%plots main graph
plot([minPosition minPosition], [0 1], 'r-' );
plot([maxPosition maxPosition], [0 1], 'k-' );
plot([t2 t2], [0 1], 'k--')
%next lines format figure with labels and legend
hold on;
legend('position','Start Time','End Time','Position');
title('Key Position vs Time');
xlabel('Time (in Seconds)');
ylabel('Position');