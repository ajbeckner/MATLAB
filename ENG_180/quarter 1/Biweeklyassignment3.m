%Biweekly assignmetn 2
clear all 
clc

fid = fopen('suspiciousFile.txt');
nextLine = fgetl(fid);
Array2 = {};
line = 1;

while ischar(nextLine)
    Array2{line, 1}=nextLine;
    line = line + 1;
    nextLine = fgetl(fid);
end

m = strfind(Array2, 'Drexel');
n= 0;

for i = 1:230
    if m{i} >= 1
        n = n + 1;
    end
end
fprintf('Suspicous word: Drexel (intances found: %d)\n' ,n)


for i = 1:230
    for j=1:length(strfind(Array2{i}, 'Drexel'))
        fprintf('Line #%d (starting at column %d): %s\n', i, strfind(Array2{i}, 'Drexel'), Array2{i})
    end
end
fprintf( '\n')
%% The secound suspicious words

m = strfind(lower(Array2), 'public safety');
n = 0;

for g = 1:230
    if m{g} >= 1
        n = n + 1;
    end
end
fprintf('Suspicous word: Public Safety (intances found: %d)\n' ,n)

for g = 1:230
    for J = 1:length(strfind(lower(Array2{g}), 'public safety'))
        fprintf('Line #%d (Starting at column %d): %s\n', g ,strfind(lower(Array2{g}), 'public safety'), Array2{g})
    end
end
fprintf('\n')
%% The third suspicious words

m = strfind(lower(Array2), 'hazing');
n = 0;

for l = 1:230
    if m{l} >= 1
        n = n + 1;
    end
end
fprintf('Suspicous word: hazing (intances found: %d)' ,n)

for l = 1:230
    for K = 1:length(strfind(lower(Array2{l}), 'hazing'))
        fprintf('Line #%d (Starting at column %d): %s\n', l ,strfind(lower(Array2{l}), 'hazing'), Array2{l})
    end
end