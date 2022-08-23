function temp(data,bw)
cmg = cmassg(data,bw,20);
cmg2 = deriv2(cmg,15);
img(cmg2)
