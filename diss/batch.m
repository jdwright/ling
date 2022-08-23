function batch(y)
sp = sgram(y,.005,.001,1024,30,3000);
figure(3)
imagesc(sp)
sp = sgram(y,.005,.001,1024,30,3000);
figure(1)
imagesc(sp)
c = sp_max(sp,5,10);
figure(2)
%x = search(sp,8,10) + 1;
x = f1_detector(sp,12,15);
[r,c] = size(sp);
y = (r-x)/512*8000
%fprintf(fid,'p_m115_fxqs.sph %d\n',y);
pause(2);
%fclose(fid);
