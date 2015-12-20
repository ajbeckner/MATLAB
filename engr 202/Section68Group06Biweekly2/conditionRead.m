function value = conditionRead(filename)
%reads and returns value from file storage
fid = fopen(filename);
value = fgetl(fid);
fclose(fid);
