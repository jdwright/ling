function out = temp2(data)
sp = sgram(data,80,10,1024);
out = positive(log10(sp)-1);
