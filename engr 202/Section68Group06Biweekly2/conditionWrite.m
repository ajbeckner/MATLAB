function conditionWrite(filename,value)
%writes value to file storage using permission 'w'
fid = fopen(filename,'w');
fprintf(fid,value);
fclose(fid);