function loop(filters,x,xlen)
f1_beg = 700;
f2_beg = 1850;
f1_end = 900;
f2_end = 1700;


for k = 10:10:150
    f1 = f1_beg+k;
    %f1 = 750;
    f2 = 2550 - f1;%f2_beg-k;
    [f1 f2]
    [y,yp] = filter_sync(filters,x,xlen,[f1 f2 2600 3500 4500],[ 50 50 50 100 200],.4);
    play(yp)
    pause(1)
end
end
