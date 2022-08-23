function plotband3(data,beg,endd,tw,n)
hold off
imagesc(data)
hold on
cmg = cmassband1(data(beg:endd,:),tw);
cmg2 = deriv3(cmg,n);
plotband(cmg2,beg,endd);
