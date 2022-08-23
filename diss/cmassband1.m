function out = cmassband1(data,tw)
% continuous sampling
% tw should be odd
[r,c] = size(data);
out = zeros(1,c);
tw2 = floor(tw/2);
for a = tw2+1:c-tw2
    out(a) = cmass(sum(data(:,a-tw2:a+tw2),2));
end
