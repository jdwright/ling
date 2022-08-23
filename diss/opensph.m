function x = opensph(fn)
fid = fopen(fn);
fseek(fid,1024,0);
x = fread(fid,inf,'int16')';
fclose(fid);