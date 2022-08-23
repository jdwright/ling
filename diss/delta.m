function out = delta(mat)
[r,c] = size(mat);
mid = floor(r/2);
vec = sum(mat,2);
one = sum(vec(1:mid));
two = sum(vec(mid+1:r));
out = abs(one - two);