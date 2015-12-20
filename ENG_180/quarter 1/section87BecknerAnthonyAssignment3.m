    %% Question #1
% first clear the vaiables and the workspace
clear all
clc

%now set up an array with 5 sentences
Array = {'How should I know?','A bald and rich and not excessively bald and tall and young rich mathematician helped a terrified and young and terrified and very terrified and good and tall and young and young and very smart and smart and not excessively smart and very good and not excessively smart and tall and rich and smart and bald and smart and smart and rich and tall and not excessively smart and not very rich and tall and not excessively rich and not very young and bald and rich and tall and not very tall and rich and tall and young and bald and very terrified kid.','The customer is always right.','The rich and young programmer wanted it.','A bald programmer obeyed the kid.'};
%also set up these arrays which wil be used later in the code
vowels = {'a','e','i','o','u','A','E','I','O','U'};
special = zeros(length(Array),1);
thes = {'the','The'};
ands = {'and','And'};
%and finally set up the count, and the variables are done
n = 0;
    
%a short for loop to display the length of each sentence by character
for i = 1:length(Array)%index is number of sentences
    %this next command chooses each sentence using braces
    fprintf('The number of characters in sentence %d is %d. \n',i,length(Array{i}))
end 
fprintf('\n')

%another loop to display the number of special characters
%that means punctuation only
for i = 1:length(Array)
    for j = 1:length(Array{i})
        %to find punctuation use the 'punct' string. Make sure that letters and numbers don't get counted  
        if isstrprop(Array{i}(j),'punct') == 1 && isstrprop(Array{i}(j),'alphanum')==0
            special(i) = special(i) + 1;
        else
        end
    end
    fprintf('The number of special characters in Sentence %d is %d.\n',i,special(i))
end
fprintf('\n')

%this loop is for the vowels
%the vowels are all in an array
for i = 1:length(Array)
    n = 0;
    for j = 1:length(vowels)
        n = n + length(strfind(Array{i},vowels{j})); 
    end
    fprintf('The number of vowels in sentence %d is %d. \n',i,n)
end
fprintf('\n')

%the spaces loop does not require a second index, j, nor a count,n
for i = 1:length(Array)
    fprintf('The number of spaces in sentence %d is %d. \n',i,length(strfind(Array{i},' ')))
end
fprintf('\n')

%The "the" loop
for i = 1:length(Array)
    n =0;
    for j = 1:length(thes)
        n = n + length(strfind(Array{i},thes{j}));
    end
    fprintf('The number of the''s in sentence %d is %d. \n',i,n)
end
fprintf('\n')

%the "and" loop
for i = 1:length(Array)
    n = 0;
    for j = 1:length(ands)
    n = n + length(strfind(Array{i},ands{j}));
    end
    fprintf('The number of and''s in sentence %d is %d. \n',i,n)
end
fprintf('\n')


%the last part is a little trickier
%first put the sentences into a new kind of array
All = [Array{1} '' Array{2} '' Array{3} '' Array{4} '' Array{5}];
%use strread to get each word on it's own
words = strread(All,'%s','delimiter',' ,.?!');
%then unique to get one of each
uWords = unique(words);
%and finally set up a count before the loop
x = zeros(length(uWords),1);

%next make a loop
%inside set up a count that adds each time a word is equal to a unique word
%then put these indeces into a matrix
for i = 1:length(words)
    n = strcmp(words{i},uWords);
     for j = 1:length(n)
         if n(j)
             x(j) = x(j) + 1;
         end
     end 
end

%the max of the matrix should give the most frequent word
[max, index] = max(x);
mostFrequentWord = uWords{index};
fprintf('The most frequent word in all the sentences is "%s".\n',mostFrequentWord)
fprintf('\n')

%% Question 2

%first, open the text file and assign an id
fid = fopen('suspiciousFile.txt');
%set a few variables for later
nextLine = fgetl(fid);
Array2 = {};
line = 1;%this must start with 1 NOT 0 in order to avoid an error

%use a while loop to get the proper variable nextLine by going through the
%text file
while ischar(nextLine)
    Array2{line, 1}=nextLine;
    line = line + 1;
    nextLine = fgetl(fid);
end
line = line - 1;%this refixes line for the indexing

%suspicious word: Drexel
%set count 
m = strfind(Array2, 'Drexel');
n= 0;

%run through the lines with a for loop
for i = 1:line
    if m{i} >= 1
        n = n + 1;
    end
end
fprintf('Suspicous word: Drexel (intances found: %d)\n' ,n)

% second for loop to specify the row and column with indeces
for i = 1:line
    for j = 1:length(strfind(Array2{i}, 'Drexel'))
        fprintf('Line #%d (starting at column %d): %s\n', i, strfind(Array2{i}, 'Drexel'), Array2{i})
    end
end
fprintf( '\n')
% the proces repeats for two more words

%suspicious words: public safety

m = strfind(lower(Array2), 'public safety');
n = 0;

for g = 1:line
    if m{g} >= 1
        n = n + 1;
    end
end
fprintf('Suspicous word: Public Safety (intances found: %d)\n' ,n)

for g = 1:line
    for J = 1:length(strfind(lower(Array2{g}), 'public safety'))
        fprintf('Line #%d (Starting at column %d): %s\n', g ,strfind(lower(Array2{g}), 'public safety'), Array2{g})
    end
end
fprintf('\n')

%suspicious word: hazing

m = strfind(lower(Array2), 'hazing');
n = 0;

for l = 1:line
    if m{l} >= 1
        n = n + 1;
    end
end
fprintf('Suspicous word: hazing (intances found: %d)' ,n)

for l = 1:line
    for K = 1:length(strfind(lower(Array2{l}), 'hazing'))
        fprintf('Line #%d (Starting at column %d): %s\n', l ,strfind(lower(Array2{l}), 'hazing'), Array2{l})
    end
end

%finally close the file
fclose(fid);