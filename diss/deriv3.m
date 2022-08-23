function out = deriv3(mat,n)
[r,c] = size(mat);
out = zeros(r,c);
m = floor(n/2);
for a = 1:r
    ds = deriv(mat(a,:));
    for b = n:c
        out(a,b+m) = mean(ds(b-n+1:b));
    end
end
