%engineering 180 Final project
%by Anthony Beckner
clear all 
clc
%lines 6 to 10 set up variables for counts within the while loop
tweetsCount = 0;
ICount = 0;
theCount = 0;
handleCount = 0;
hashTagCount = 0;

fid = fopen('funfetti.txt');%opens the text file
newline = fgetl(fid);%gets line one before the for loop
while ischar(newline)%operates while newline is a character array
    tweetsCount = tweetsCount + 1;%counts lines(number of tweets)
    charCounts(tweetsCount) = length(newline);%puts number of charachters as element in an array
    ICount = ICount + length([regexp(newline,'^I ') regexp(newline,'[ ]I ')]);%counts number of Is in the line and adds them to existing count
    theCount = theCount + length(regexp(newline,'[Tt]he'));%does the same for "the"
    hashLine = regexp(newline,'#\w+','match');%finds hashtags in the line
    for q = 1:length(hashLine);%this for loop coounts total hashtags while indexing them into an array
        hashTagCount = hashTagCount + 1;%count
        hashTags{hashTagCount} = hashLine{q};%index array
        hashLengths(hashTagCount) = length(hashLine{q})-1;%index of lengths (minus the #)
    end
    handleLine = regexp(newline,'@\w+','match');%finds handles in line
    for r = 1:length(handleLine);%for loop operates like the previous one but for handles
        handleCount = handleCount + 1;%count
        handles{handleCount} = handleLine{r};%index array for handles
        handleLengths(handleCount) = length(handleLine{r})-1;%index of lengths for handles (minus the @)
    end
    newline = fgetl(fid);%gets next line
end
   %lines 34 to 37 format information about the tweets in general 
fprintf('Number of tweets:%d \n',tweetsCount)
fprintf('Average characters in tweets: %.2f \n',mean(charCounts))
fprintf('Number of I''s: %d \n',ICount)
fprintf('Number of the''s used: %d \n\n',theCount)
%lines 39 to 44 format specific information about the hashtags
fprintf('number of #''s used: %d \n',hashTagCount)
fprintf('hashtags:')
for i = 1:length(hashTags)
    fprintf('%s ',hashTags{i})
end
fprintf('\nAverage hashtag length:%.2f \n\n',mean(hashLengths))
%lines 46 to 51 format specific info about handles 
fprintf('number of @''s used: %d \n',handleCount)
fprintf('handles:')
for j = 1:length(handles)
    fprintf('%s ',handles{j})
end
fprintf('\nAverage handle length: %.2f \n',mean(handleLengths))
fclose(fid);%closes file
%% Short report 

% name of twitter account: @fun_fetti

%this account is moderately popular but not famous. They interact with a
%lot of other accounts using handles. But they are not a celebrity and do
%not use I very much. 

%the frequency of tweets subsided since last thursday because this user did
%not tweet during thanksgiving break

%this user's tweets offer a small amount of insight into their daily
%life/thoughts. More of the tweets concentrate on contacting other twitter
%users or having conversations with them via their handles. These types of
%tweets may not be of interest to people who do not know these users or who
%are not involved in the dialogues.

