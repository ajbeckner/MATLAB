function value = getVal(valName)
%Reads and returns value from file storage

%open file and get first line
fid = fopen('conditions.txt');
line = fgetl(fid);

%check each line in while loop
    while(ischar(line))
        endtoken = regexp(line,valName,'end');
        
        %if line has token, read value
        if ~isempty(endtoken)
            value = line(endtoken+2:length(line));
        end
        
        line = fgetl(fid);
    end
if ~exist('value')
    error('Could not find value named ''%s''.',valName);
end
%close file
    fclose(fid);


