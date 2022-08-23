function out = mysmooth(vec,n)
lth = length(vec);
n2 = floor(n/2);
out = vec;
for a = n2+1:lth-n2
    out(a) = sum(vec(a-n2:a+n2)) / n;
end
