function saveVal(valName,newVal)
%writes value to file storage using permission 'w'

%open file and get first line
fid = fopen('conditions.txt');
line = fgetl(fid);
lines = {};
%save all lines into cell array with loop
while(ischar(line))
    lines = [lines; line];
    line = fgetl(fid);
end
%close file
fclose(fid);

%find and change value of line with desired valName
for i = (1:1:length(lines))
    line = lines{i};
    endtoken = regexp(line,valName,'end');
    if ~isempty(endtoken)
        lines{i} = [valName ':' newVal]; 
    end
end

%open file again and rewrite all lines
fid = fopen('conditions.txt','w');
for i = (1:1:length(lines))
    fprintf(fid,lines{i});
    fprintf(fid,'\n');
end

%close file
fclose(fid);