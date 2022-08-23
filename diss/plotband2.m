function plotband2(data,beg,endd,tw)
hold off
imagesc(data)
hold on
cmg = cmassband1(data(beg:endd,:),tw);
plotband(cmg,beg,endd);
