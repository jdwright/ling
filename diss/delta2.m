function out = delta2(mat)
vec = sum(mat,2);
lth = length(vec);
lth2 = lth / 2;
dm = 0;
out = 0;
for a = 2:lth-2
    b = mean(vec(1:a));
    c = mean(vec(a+1:lth));
    d = b - c;
    if abs(d) > dm
        dm = abs(d);
        if d > 0
            out = lth2 - (a/2);
        else
            out = (a+lth)/2 - lth2;
        end
    end
end
