function p_m115_fxqs()
y = opensph('sph2/p_m115_fxqs.sph');
y = y(9760:11424);
sp = sgram(y,.005,.001,1024,30,1500);
c = sp_max(sp,5,10);
x = search(c,1,10) + 1;
[r,c] = size(sp);
y = (r-x)/512*8000;
