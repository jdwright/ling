#!/usr/bin/perl

print "function batch()
fid = fopen('out.txt','wt');
";
while(<>){
  @a = split;
  print "y = opensph('sph2/$a[0]');
y = y($a[1]:$a[2]);
sp = sgram(y,.005,.001,1024,30,1500);
c = sp_max(sp,5,10);
x = search(c,1,10) + 1;
[r,c] = size(sp);
y = (r-x)/512*8000;
fprintf(fid,'$a[0] %d\\n',y);
pause(2);
";
}
print "fclose(fid);\n";

